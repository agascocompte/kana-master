import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kana_entry.dart';
import 'package:kana_master/di/dependency_injector.dart';
import 'package:kana_master/pages/learn/bloc/learn_bloc.dart';
import 'package:kana_master/pages/learn/learn.dart';
import 'package:kana_master/pages/study/bloc/material_bloc.dart';
import 'package:kana_master/pages/test_kana/test_kana.dart';
import 'package:kana_master/pages/study/widgets/material_tab.dart';

class StudyTab extends StatelessWidget {
  final List<KanaEntry> kanaEntries;
  final Map<String, String> kanaMap;
  final KanaType kanaType;
  final DifficultyLevel difficultyLevel;

  const StudyTab({
    super.key,
    required this.kanaEntries,
    required this.kanaMap,
    required this.kanaType,
    required this.difficultyLevel,
  });

  @override
  Widget build(BuildContext context) {
    final String languageCode = Localizations.localeOf(context).languageCode;
    return MultiBlocProvider(
      key: ValueKey('${kanaType.name}-$languageCode'),
      providers: [
        BlocProvider(
          create: (_) => sl<LearnBloc>()
            ..add(LearnInitialized(
              kanaType: kanaType,
              languageCode: languageCode,
            )),
        ),
        BlocProvider(
          create: (_) => sl<MaterialBloc>(),
        ),
      ],
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Material(
              color: Colors.white,
              child: TabBar(
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(color: jOrange, width: 3),
                  insets: EdgeInsets.zero,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: const TextStyle(fontWeight: FontWeight.w700),
                labelColor: jDarkBLue,
                unselectedLabelColor: jLightBLue,
                tabs: const [
                  Tab(text: "Learn"),
                  Tab(text: "Test"),
                  Tab(text: "Material"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildLearnTab(),
                  _buildTestTab(),
                  const MaterialTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLearnTab() {
    if (kanaType != KanaType.kanji) {
      return LearnTab(
        entries: kanaEntries,
        kanaType: kanaType,
      );
    }
    return LearnTab(
      entries: const [],
      kanaType: kanaType,
    );
  }

  Widget _buildTestTab() {
    if (kanaType != KanaType.kanji) {
      return TestTab(
        kanaType: kanaType,
        kana: kanaMap,
        difficultyLevel: difficultyLevel,
      );
    }
    return BlocBuilder<LearnBloc, LearnState>(
      builder: (context, state) {
        if (state is LearnLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is LearnError) {
          return Center(
            child: Text(state.stateData.errorMessage),
          );
        }
        return TestTab(
          kanaType: kanaType,
          kana: const {},
          kanjiEntries: state.stateData.kanjiEntries,
          kanjiMeanings: state.stateData.kanjiMeanings,
          difficultyLevel: difficultyLevel,
        );
      },
    );
  }
}
