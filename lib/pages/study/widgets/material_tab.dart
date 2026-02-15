import 'package:flutter/material.dart' hide MaterialState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/pages/study/bloc/material_bloc.dart';
import 'package:kana_master/pages/study/widgets/dropdown_selector.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/widgets/dialogs.dart';
import 'package:kana_master/widgets/snackbars.dart';
import 'package:kana_master/i18n/strings.g.dart';

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
                    icon: const Icon(Icons.info_outline, color: AppColors.ink),
                    onPressed: () {
                      Dialogs.showExpectedFormatDialog(context);
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
                    label: Text(t.app.importCsv),
                  ),
                  const SizedBox(width: 12),
                  if (data.importedFileName.isNotEmpty)
                    Expanded(
                      child: Text(
                        t.app.fileLabel(
                            count: data.entries.length,
                            name: data.importedFileName),
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
                      child: DropdownSelector(
                        label: t.app.askWith,
                        value: data.questionColumn,
                        items: data.headers,
                        onChanged: (value) => context
                            .read<MaterialBloc>()
                            .add(MaterialQuestionColumnChanged(value)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownSelector(
                        label: t.app.answerWith,
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
                                    label: Text(t.app.newQuestion),
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
                                    label: Text(t.app.checkAnswer),
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
                                Text(
                                  t.app.materialsEmpty,
                                  style: const TextStyle(
                                      color: AppColors.graphite),
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
                                decoration: InputDecoration(
                                  labelText: t.app.yourAnswer,
                                  border: const OutlineInputBorder(),
                                ),
                                enableSuggestions: false,
                                autocorrect: false,
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
                                            ? t.app.answerPrefix(
                                                answer: data.currentEntry!
                                                            .values[
                                                        data.answerColumn!] ??
                                                    '')
                                            : t.app.showAnswer,
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
