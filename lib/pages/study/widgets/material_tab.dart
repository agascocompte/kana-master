import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/material_entry.dart';
import 'package:kana_master/widgets/snackbars.dart';

class MaterialTab extends StatefulWidget {
  const MaterialTab({super.key});

  @override
  State<MaterialTab> createState() => _MaterialTabState();
}

class _MaterialTabState extends State<MaterialTab> {
  List<String> headers = [];
  List<MaterialEntry> entries = [];
  String? questionColumn;
  String? answerColumn;
  MaterialEntry? currentEntry;
  bool isLoading = false;
  bool showExpectedAnswer = false;
  final TextEditingController _answerController = TextEditingController();
  final Random _random = Random();
  String importedFileName = '';

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  Future<void> _pickCsv() async {
    try {
      setState(() {
        isLoading = true;
      });
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
        withData: true,
      );
      if (result == null) {
        setState(() {
          isLoading = false;
        });
        return;
      }

      final file = result.files.first;
      final bytes = file.bytes ?? await File(file.path!).readAsBytes();
      final content = utf8.decode(bytes);

      final rows = const CsvToListConverter(eol: '\n').convert(content);
      if (rows.isEmpty || rows.first.isEmpty) {
        throw Exception('No se encontraron datos en el CSV.');
      }

      final parsedHeaders = rows.first
          .map((e) => e.toString().trim())
          .where((h) => h.isNotEmpty)
          .toList();
      final parsedEntries = rows
          .skip(1)
          .map((row) {
            return MaterialEntry.fromRow(parsedHeaders, row);
          })
          .where((e) => e.hasAnyValue)
          .toList();

      if (parsedEntries.isEmpty) {
        throw Exception('No se encontraron filas válidas.');
      }

      setState(() {
        headers = parsedHeaders;
        entries = parsedEntries;
        questionColumn = headers.isNotEmpty ? headers.first : null;
        answerColumn = headers.length > 1 ? headers[1] : headers.first;
        importedFileName = file.name;
        currentEntry = null;
        _answerController.clear();
      });
      Snackbars.showSuccessScaffold(context,
          'Importado ${parsedEntries.length} entradas de ${file.name}');
    } catch (e) {
      Snackbars.showErrorScaffold(context, 'Error al importar: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _nextQuestion() {
    if (entries.isEmpty || questionColumn == null || answerColumn == null) {
      Snackbars.showWarningScaffold(
          context, 'Importa un CSV y elige columnas antes de practicar.');
      return;
    }
    final entry = entries[_random.nextInt(entries.length)];
    setState(() {
      currentEntry = entry;
      _answerController.clear();
    });
  }

  void _checkAnswer() {
    if (currentEntry == null ||
        questionColumn == null ||
        answerColumn == null) {
      Snackbars.showWarningScaffold(
          context, 'Primero inicia una pregunta desde tu material.');
      return;
    }
    final correct = currentEntry!.values[answerColumn!] ?? '';
    final user = _answerController.text;
    if (_isAnswerClose(user, correct)) {
      Snackbars.showSuccessScaffold(context, '¡Correcto!');
      _nextQuestion();
    } else {
      Snackbars.showWarningScaffold(context, 'Respuesta incorrecta');
    }
  }

  bool _isAnswerClose(String userInput, String correct) {
    String normalize(String input) => input
        .toLowerCase()
        .replaceAll(RegExp(r'[\\[\\]\\(\\)\\{\\}\\.,;:!?¿¡\\-_/]'), ' ')
        .replaceAll(RegExp(r'\\s+'), ' ')
        .trim();

    final user = normalize(userInput);
    final correctNorm = normalize(correct);

    if (user.isEmpty || correctNorm.isEmpty) return false;

    final correctParts = correctNorm
        .split(RegExp(r'[/|]'))
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty);

    for (final part in correctParts) {
      if (part.isEmpty) continue;
      if (user.contains(part) || part.contains(user)) {
        return true;
      }
    }
    return correctNorm.contains(user) || user.contains(correctNorm);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                tooltip: 'Formato esperado',
                icon: const Icon(Icons.info_outline, color: Colors.grey),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Formato esperado'),
                      content: const Text(
                        'Cabeceras recomendadas:\n\nEspañol | Romaji | Hiragana | Katakana | Kanji.\n\nPuedes mapear cualquier columna como pregunta o respuesta. Usa CSV separado por comas.',
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
                onPressed: isLoading ? null : _pickCsv,
                style: ElevatedButton.styleFrom(
                  backgroundColor: jOrange,
                  foregroundColor: jDarkBLue,
                ),
                icon: const Icon(Icons.upload_file),
                label: Text(isLoading ? 'Importando...' : 'Importar CSV'),
              ),
              const SizedBox(width: 12),
              if (importedFileName.isNotEmpty)
                Expanded(
                  child: Text(
                    'Archivo: $importedFileName (${entries.length} filas)',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: jDarkBLue,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          if (headers.isNotEmpty)
            Row(
              children: [
                Expanded(
                  child: _DropdownSelector(
                    label: 'Preguntar con',
                    value: questionColumn,
                    items: headers,
                    onChanged: (value) {
                      setState(() {
                        questionColumn = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _DropdownSelector(
                    label: 'Responder con',
                    value: answerColumn,
                    items: headers,
                    onChanged: (value) {
                      setState(() {
                        answerColumn = value;
                      });
                    },
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
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
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
                                onPressed: _nextQuestion,
                                icon: const Icon(Icons.play_arrow),
                                label: const Text('Nueva pregunta'),
                              ),
                              const SizedBox(width: 12),
                              ElevatedButton.icon(
                                onPressed: _checkAnswer,
                                icon: const Icon(Icons.check),
                                label: const Text('Comprobar'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          if (currentEntry != null && questionColumn != null)
                            Text(
                              currentEntry!.values[questionColumn!] ?? '',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: jDarkBLue,
                              ),
                            )
                          else
                            const Text(
                              'Importa tu CSV y pulsa \"Nueva pregunta\" para empezar.',
                              style: TextStyle(color: Colors.grey),
                            ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _answerController,
                            textInputAction: TextInputAction.done,
                            onSubmitted: (_) => _checkAnswer(),
                            decoration: const InputDecoration(
                              labelText: 'Tu respuesta',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (currentEntry != null && answerColumn != null)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showExpectedAnswer = !showExpectedAnswer;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    showExpectedAnswer
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    showExpectedAnswer
                                        ? 'Respuesta: ${currentEntry!.values[answerColumn!] ?? ''}'
                                        : 'Mostrar respuesta',
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12),
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
            color: jDarkBLue,
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
