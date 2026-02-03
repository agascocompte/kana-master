import 'package:flutter/material.dart' hide MaterialState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/pages/study/bloc/material_bloc.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/widgets/snackbars.dart';

class MaterialTab extends StatelessWidget {
  const MaterialTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaterialBloc, MaterialState>(
      listener: (context, state) {
        final message = state.stateData.message;
        if (message.isEmpty) return;
        switch (state.stateData.messageType) {
          case MaterialMessageType.success:
            Snackbars.showSuccessScaffold(context, message);
            break;
          case MaterialMessageType.warning:
            Snackbars.showWarningScaffold(context, message);
            break;
          case MaterialMessageType.error:
            Snackbars.showErrorScaffold(context, message);
            break;
          case MaterialMessageType.none:
            break;
        }
      },
      builder: (context, state) {
        final data = state.stateData;
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    tooltip: 'Expected Format',
                    icon: const Icon(Icons.info_outline, color: AppColors.ink),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Expected Format'),
                          content: const Text(
                            'Recommended headers:\n\nLanguage | Romaji | Hiragana | Katakana | Kanji.\n\nYou can map any column as question or answer. Use comma-separated CSV.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  ElevatedButton.icon(
                    onPressed: data.isLoading
                        ? null
                        : () => context
                            .read<MaterialBloc>()
                            .add(MaterialImportRequested()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.ink,
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Import CSV'),
                  ),
                  const SizedBox(width: 12),
                  if (data.importedFileName.isNotEmpty)
                    Expanded(
                      child: Text(
                        'File: ${data.importedFileName} (${data.entries.length} rows)',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.graphite,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              if (data.headers.isNotEmpty)
                Row(
                  children: [
                    Expanded(
                      child: _DropdownSelector(
                        label: 'Ask with',
                        value: data.questionColumn,
                        items: data.headers,
                        onChanged: (value) => context
                            .read<MaterialBloc>()
                            .add(MaterialQuestionColumnChanged(value)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _DropdownSelector(
                        label: 'Answer with',
                        value: data.answerColumn,
                        items: data.headers,
                        onChanged: (value) => context
                            .read<MaterialBloc>()
                            .add(MaterialAnswerColumnChanged(value)),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 12),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                      ),
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraints.maxHeight),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.sand),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(10),
                                offset: const Offset(0, 4),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.ink,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () => context
                                        .read<MaterialBloc>()
                                        .add(MaterialQuestionRequested()),
                                    icon: const Icon(Icons.play_arrow),
                                    label: const Text('New Question'),
                                  ),
                                  const SizedBox(width: 12),
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.teal,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () => context
                                        .read<MaterialBloc>()
                                        .add(MaterialAnswerSubmitted()),
                                    icon: const Icon(Icons.check),
                                    label: const Text('Check Answer'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              if (data.currentEntry != null &&
                                  data.questionColumn != null)
                                Text(
                                  data.currentEntry!
                                          .values[data.questionColumn!] ??
                                      '',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.ink,
                                  ),
                                )
                              else
                                const Text(
                                  'Import your CSV and press "New Question" to start.',
                                  style: TextStyle(color: AppColors.graphite),
                                ),
                              const SizedBox(height: 16),
                              TextFormField(
                                key: ValueKey(
                                    'material-answer-${data.inputVersion}'),
                                textInputAction: TextInputAction.done,
                                onChanged: (value) => context
                                    .read<MaterialBloc>()
                                    .add(MaterialAnswerUpdated(value)),
                                onFieldSubmitted: (_) => context
                                    .read<MaterialBloc>()
                                    .add(MaterialAnswerSubmitted()),
                                decoration: const InputDecoration(
                                  labelText: 'Your Answer',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 8),
                              if (data.currentEntry != null &&
                                  data.answerColumn != null)
                                GestureDetector(
                                  onTap: () => context
                                      .read<MaterialBloc>()
                                      .add(MaterialToggleExpectedAnswer()),
                                  child: Row(
                                    children: [
                                      Icon(
                                        data.showExpectedAnswer
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        size: 16,
                                        color: AppColors.ink,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        data.showExpectedAnswer
                                            ? 'Answer: ${data.currentEntry!.values[data.answerColumn!] ?? ''}'
                                            : 'Show Answer',
                                        style: const TextStyle(
                                            color: AppColors.graphite,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DropdownSelector extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const _DropdownSelector({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.graphite,
          ),
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          initialValue: value,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          items: items
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
