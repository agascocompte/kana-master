// Drives the exam screens like a user would. With EXAM_SCREENS=1 it also
// renders them at phone size for a visual check (needs Windows fonts):
//   EXAM_SCREENS=1 flutter test test/exam_screens_test.dart --update-goldens
// The images land in test/exam_screens/, which is not committed.
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kana_master/domain/exam/exam_bank.dart';
import 'package:kana_master/domain/exam/exam_builder.dart';
import 'package:kana_master/domain/exam/exam_models.dart';
import 'package:kana_master/domain/exam/exam_scoring.dart';
import 'package:kana_master/domain/repositories/exam_repository.dart';
import 'package:kana_master/domain/repositories/settings_repository.dart';
import 'package:kana_master/di/dependency_injector.dart';
import 'package:kana_master/pages/exam/exam_hub_page.dart';
import 'package:kana_master/pages/exam/bloc/exam_session_cubit.dart';
import 'package:kana_master/pages/exam/exam_result_page.dart';
import 'package:kana_master/pages/exam/exam_review_page.dart';
import 'package:kana_master/pages/exam/exam_session_page.dart';
import 'package:kana_master/services/exam/exam_audio_player.dart';
import 'package:kana_master/theme/app_theme.dart';

class FakeExamRepository extends ExamRepository {
  final ExamPaper paper;
  int saved = 0;

  FakeExamRepository(this.paper);

  @override
  Future<ExamPaper> createPaper(List<ExamSection> sections) async => ExamPaper(
        sections: sections,
        questions: {for (final s in sections) s: paper.questions[s]!},
      );

  @override
  Future<void> saveResult(
      ExamPaper p, Map<ExamQuestion, int> a, ExamScore s) async {
    saved++;
  }
}

/// Finishes every clip after a short, fixed time.
class FakePlayer implements ExamAudioPlayer {
  final List<String> played = [];

  @override
  Future<void> play(String asset) async {
    played.add(asset);
    await Future<void>.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> pause() async {}
  @override
  Future<void> resume() async {}
  @override
  Future<void> stop() async {}
  @override
  Future<void> dispose() async {}
}

final bool _screens = Platform.environment['EXAM_SCREENS'] == '1';

Future<void> _loadFonts() async {
  if (!_screens) return;
  Future<void> load(String family, List<String> files) async {
    final loader = FontLoader(family);
    for (final f in files) {
      final file = File(f);
      if (file.existsSync()) {
        loader.addFont(
            Future.value(ByteData.sublistView(file.readAsBytesSync())));
      }
    }
    await loader.load();
  }

  // flutter_tester lives in bin/cache/artifacts/engine/<platform>/.
  final artifacts = File(Platform.resolvedExecutable).parent.parent.parent;
  await load('Roboto', ['C:/Windows/Fonts/YuGothM.ttc']);
  await load('MaterialIcons', [
    '${artifacts.path}/material_fonts/materialicons-regular.otf',
  ]);
}

ExamBank _bank() => ExamBank.fromJsonStrings({
      for (final m in Mondai.values)
        m: File(examBankAsset(m)).readAsStringSync(),
    });

Widget _app(Widget child) {
  AppColors.setBrightness(Brightness.light);
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: AppTheme.build(Brightness.light).copyWith(
      textTheme: AppTheme.build(Brightness.light)
          .textTheme
          .apply(fontFamilyFallback: const ['Roboto']),
    ),
    home: child,
  );
}

Future<void> _shot(WidgetTester tester, String name) async {
  await tester.pump(const Duration(milliseconds: 50));
  if (!_screens) return;
  await expectLater(
    find.byType(MaterialApp),
    matchesGoldenFile('exam_screens/$name.png'),
  );
}

void main() {
  setUpAll(_loadFonts);

  late ExamPaper paper;
  setUp(() {
    paper =
        ExamBuilder(bank: _bank(), rng: Random(7)).build(ExamSection.values);
  });

  void phone(WidgetTester tester) {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
  }

  testWidgets('written sections', (tester) async {
    phone(tester);
    final repo = FakeExamRepository(paper);
    await tester.pumpWidget(_app(ExamSessionPage(
      sections: const [ExamSection.vocabulary, ExamSection.grammarReading],
      repository: repo,
      playerFactory: FakePlayer.new,
    )));
    await tester.pumpAndSettle();
    await _shot(tester, '01_intro_vocabulary');

    await tester.tap(find.text('Empezar'));
    await tester.pump();
    final cubit = BlocProvider.of<ExamSessionCubit>(
        tester.element(find.byType(ListView).first));

    Future<void> showFirstOf(Mondai m, String name) async {
      final i = cubit.state.questions.indexWhere((q) => q.mondai == m);
      cubit.goTo(i);
      cubit.answer(cubit.state.question, 1);
      await tester.pump();
      await _shot(tester, name);
    }

    await showFirstOf(Mondai.kanjiReading, '02_kanji_reading');
    await showFirstOf(Mondai.orthography, '03_orthography');
    await showFirstOf(Mondai.contextual, '04_contextual');
    await showFirstOf(Mondai.paraphrase, '05_paraphrase');

    await tester.tap(find.byIcon(Icons.grid_view));
    await tester.pumpAndSettle();
    await _shot(tester, '06_question_grid');
    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle();

    await cubit.finishSection();
    await tester.pumpAndSettle();
    await _shot(tester, '07_intro_grammar');
    await tester.tap(find.text('Empezar'));
    await tester.pump();

    await showFirstOf(Mondai.grammarForm, '08_grammar_form');
    await showFirstOf(Mondai.sentenceOrder, '09_sentence_order');
    await showFirstOf(Mondai.textGrammar, '10_text_grammar');
    await showFirstOf(Mondai.shortReading, '11_short_reading');
    await showFirstOf(Mondai.midReading, '12_mid_reading');
    await showFirstOf(Mondai.infoSearch, '13_info_search');

    await cubit.finishSection();
    await tester.pumpAndSettle();
    expect(repo.saved, 1);
    await _shot(tester, '14_result_partial');
  });

  testWidgets('listening section runs by itself', (tester) async {
    phone(tester);
    final repo = FakeExamRepository(paper);
    final player = FakePlayer();
    await tester.pumpWidget(_app(ExamSessionPage(
      sections: const [ExamSection.listening],
      repository: repo,
      playerFactory: () => player,
    )));
    await tester.pumpAndSettle();
    await _shot(tester, '20_intro_listening');
    await tester.tap(find.text('Empezar'));
    await tester.pump();
    await _shot(tester, '21_listening_instruction');

    // Instruction, item number and recording: 3 clips of 2 s.
    await tester.pump(const Duration(seconds: 2));
    await tester.pump(const Duration(seconds: 2));
    await _shot(tester, '22_listening_playing');
    await tester.pump(const Duration(seconds: 2));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.tap(find.text('１'));
    await tester.pump();
    await _shot(tester, '23_listening_answering');

    // Let the whole section play out.
    for (var i = 0; i < 400 && repo.saved == 0; i++) {
      await tester.pump(const Duration(seconds: 1));
    }
    expect(repo.saved, 1);
    final listening = paper.questions[ExamSection.listening]!;
    expect(
      player.played.where((a) => a.contains('/num_')).length,
      listening.length,
    );
    expect(
      player.played.where((a) => a.contains('/inst_')).length,
      ExamSection.listening.mondai.length,
    );
    await tester.pumpAndSettle();
    await _shot(tester, '24_result_listening');
  });

  testWidgets('utterance and quick response screens', (tester) async {
    phone(tester);
    final repo = FakeExamRepository(paper);
    final player = FakePlayer();
    await tester.pumpWidget(_app(ExamSessionPage(
      sections: const [ExamSection.listening],
      repository: repo,
      playerFactory: () => player,
    )));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Empezar'));
    await tester.pump();
    final listening = paper.questions[ExamSection.listening]!;
    Future<void> advanceTo(Mondai m) async {
      for (var i = 0; i < 600; i++) {
        final current = player.played.isEmpty ? '' : player.played.last;
        final q = listening.firstWhere((q) => q.mondai == m);
        if (current == q.clip!.audioAsset) break;
        await tester.pump(const Duration(seconds: 1));
      }
    }

    await advanceTo(Mondai.utterance);
    await tester.pump(const Duration(milliseconds: 100));
    await _shot(tester, '25_utterance');
    await advanceTo(Mondai.quickResponse);
    await tester.pump(const Duration(milliseconds: 100));
    await _shot(tester, '26_quick_response');
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 3));
  });

  testWidgets('hub', (tester) async {
    phone(tester);
    sl.registerSingleton<ExamRepository>(_HubRepository(paper));
    sl.registerSingleton<SettingsRepository>(_Settings());
    addTearDown(sl.reset);
    await tester.pumpWidget(_app(const ExamHubPage()));
    await tester.pumpAndSettle();
    expect(find.text('Examen completo'), findsWidgets);
    expect(find.text('134/1140'), findsOneWidget);
    await _shot(tester, '00_hub');
  });

  testWidgets('full result and review', (tester) async {
    phone(tester);
    final all = paper.allQuestions;
    final rng = Random(3);
    final answers = {
      for (final q in all)
        q: rng.nextDouble() < 0.7
            ? q.correctIndex
            : (q.correctIndex + 1) % q.options.length,
    };
    final args = ExamResultArgs(
      paper: paper,
      answers: answers,
      score: ExamScore.grade(all, answers),
    );
    await tester.pumpWidget(_app(ExamResultPage(args: args)));
    await tester.pumpAndSettle();
    await _shot(tester, '30_result_full');

    await tester.pumpWidget(
        _app(ExamReviewPage(args: args, playerFactory: FakePlayer.new)));
    await tester.pumpAndSettle();
    await _shot(tester, '31_review');
    await tester.drag(find.byType(ListView), const Offset(0, -6000));
    await tester.pumpAndSettle();
    await _shot(tester, '32_review_scrolled');
    await tester.drag(find.byType(ListView), const Offset(0, -20000));
    await tester.pumpAndSettle();
    await _shot(tester, '33_review_listening');
  });
}

class _HubRepository extends FakeExamRepository {
  _HubRepository(super.paper);

  @override
  Future<List<ExamResultRecord>> getResults() async {
    ExamScore score(int right) => ExamScore({
          for (final m in Mondai.values)
            m: Tally(min(m.count, (m.count * right) ~/ 10), m.count),
        });
    return [
      ExamResultRecord(
          id: 3,
          timestamp: DateTime.now(),
          sections: ExamSection.values,
          score: score(8)),
      ExamResultRecord(
          id: 2,
          timestamp: DateTime.now().subtract(const Duration(hours: 3)),
          sections: const [ExamSection.listening],
          score: score(5)),
      ExamResultRecord(
          id: 1,
          timestamp: DateTime.now().subtract(const Duration(days: 1)),
          sections: ExamSection.values,
          score: score(4)),
    ];
  }

  @override
  Future<(int, int)> getCoverage() async => (134, 1140);
}

class _Settings extends SettingsRepository {
  @override
  Future<DateTime> getExamDate() async => DateTime(2026, 12, 6);
}
