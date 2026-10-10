import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kana_groups.dart';
import 'package:kana_master/domain/models/quiz_item.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/theme/app_theme.dart';

/// Session setup: what to practice, how many questions, and start.
class TestStartCard extends StatefulWidget {
  const TestStartCard({
    super.key,
    required this.modeLabel,
    required this.kanaType,
    required this.difficulty,
    required this.pool,
    required this.useModel,
    required this.onStart,
  });

  final String modeLabel;
  final KanaType kanaType;
  final DifficultyLevel difficulty;

  /// Every item matching the current selection (rows, JLPT level, mode).
  final List<QuizItem> pool;
  final bool useModel;
  final void Function(List<QuizItem> pool, bool isReview) onStart;

  @override
  State<TestStartCard> createState() => _TestStartCardState();
}

class _TestStartCardState extends State<TestStartCard> {
  bool _onlyMistakes = false;

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    final settings = context.watch<SettingsBloc>().state.stateData;
    final itemStats = context
            .watch<StatsBloc>()
            .state
            .stateData
            .itemStatsByType[widget.kanaType] ??
        const <String, ItemStat>{};

    final TestType testType = TestKanaBloc.testTypeFor(widget.difficulty);
    final List<QuizItem> usable = TestKanaBloc.usableItems(
      widget.pool,
      testType: testType,
      useModel: widget.useModel,
    );
    final List<QuizItem> weak =
        usable.where((i) => itemStats[i.symbol]?.weak ?? false).toList();
    final bool onlyMistakes = _onlyMistakes && weak.isNotEmpty;
    final List<QuizItem> selected = onlyMistakes ? weak : usable;
    final bool someNotDrawable = testType == TestType.drawingTest &&
        usable.length < widget.pool.length;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.sand),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(12),
              blurRadius: 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.flash_on_outlined, size: 32, color: AppColors.ink),
            const SizedBox(height: 8),
            Text(
              widget.modeLabel,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 18),
            if (widget.kanaType != KanaType.kanji)
              _KanaGroupPicker(
                kanaType: widget.kanaType,
                selected: settings.kanaGroupsFor(widget.kanaType),
              )
            else if (testType != TestType.drawingTest) ...[
              _SectionLabel(tr.app.kanjiQuizMode),
              SegmentedButton<KanjiQuizMode>(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(
                    value: KanjiQuizMode.meaning,
                    label: Text(tr.app.kanjiModeMeaning),
                  ),
                  ButtonSegment(
                    value: KanjiQuizMode.reading,
                    label: Text(tr.app.kanjiModeReading),
                  ),
                ],
                selected: {settings.kanjiQuizMode},
                onSelectionChanged: (value) => context
                    .read<SettingsBloc>()
                    .add(ChangeKanjiQuizMode(mode: value.first)),
              ),
            ],
            const SizedBox(height: 16),
            _SectionLabel(tr.app.practiceSource),
            SegmentedButton<bool>(
              showSelectedIcon: false,
              segments: [
                ButtonSegment(
                  value: false,
                  label: Text(tr.app.practiceSourceAll),
                ),
                ButtonSegment(
                  value: true,
                  enabled: weak.isNotEmpty,
                  label: Text(
                    tr.app.practiceSourceMistakes(count: weak.length),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
              selected: {onlyMistakes},
              onSelectionChanged: (value) =>
                  setState(() => _onlyMistakes = value.first),
            ),
            const SizedBox(height: 16),
            _SectionLabel(tr.app.practiceSessionLength),
            SegmentedButton<int>(
              showSelectedIcon: false,
              segments: [
                for (final length in sessionLengths)
                  ButtonSegment(value: length, label: Text('$length')),
              ],
              selected: {settings.sessionLength},
              onSelectionChanged: (value) => context
                  .read<SettingsBloc>()
                  .add(ChangeSessionLength(length: value.first)),
            ),
            const SizedBox(height: 14),
            if (someNotDrawable)
              _Notice(
                usable.isEmpty
                    ? tr.app.practiceNothingToDraw
                    : tr.app.practiceNotDrawable,
              ),
            if (widget.kanaType != KanaType.kanji)
              Text(
                tr.app.practiceItemsCount(count: selected.length),
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.slate, fontSize: 13),
              ),
            const SizedBox(height: 12),
            Center(
              child: ElevatedButton.icon(
                onPressed: selected.isEmpty
                    ? null
                    : () => widget.onStart(selected, onlyMistakes),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.ink,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 12,
                  ),
                ),
                icon: const Icon(Icons.play_arrow),
                label: Text(tr.app.beginSession),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _KanaGroupPicker extends StatelessWidget {
  const _KanaGroupPicker({required this.kanaType, required this.selected});

  final KanaType kanaType;
  final Set<String> selected;

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    final groups = kanaGroupsFor(kanaType);
    final bool allSelected = groups.every((g) => selected.contains(g.id));

    void update(Set<String> ids) {
      if (ids.isEmpty) return;
      context
          .read<SettingsBloc>()
          .add(ChangeKanaGroups(kanaType: kanaType, groupIds: ids));
    }

    Widget section(String title, KanaGroupKind kind) {
      final kindGroups = groups.where((g) => g.kind == kind).toList();
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: AppColors.slate, fontSize: 12),
            ),
            const SizedBox(height: 6),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final group in kindGroups)
                  FilterChip(
                    label: Text(group.label),
                    showCheckmark: false,
                    visualDensity: VisualDensity.compact,
                    selected: selected.contains(group.id),
                    selectedColor: AppColors.peach,
                    onSelected: (value) => update(value
                        ? {...selected, group.id}
                        : ({...selected}..remove(group.id))),
                  ),
              ],
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: _SectionLabel(tr.app.practiceWhat)),
            TextButton(
              onPressed: allSelected
                  ? () => update(defaultKanaGroupIds(kanaType))
                  : () => update(groups.map((g) => g.id).toSet()),
              child: Text(tr.app.practiceSelectAll),
            ),
          ],
        ),
        section(tr.app.practiceRowsBasic, KanaGroupKind.basic),
        section(tr.app.practiceRowsDakuten, KanaGroupKind.dakuten),
        section(tr.app.practiceRowsCombos, KanaGroupKind.combo),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
        ),
      ),
    );
  }
}

class _Notice extends StatelessWidget {
  const _Notice(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.mist,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, size: 18, color: AppColors.slate),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: AppColors.slate, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
