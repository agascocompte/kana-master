import 'package:flutter/material.dart';
import 'package:kana_master/pages/exam/widgets/jp_text.dart';
import 'package:kana_master/theme/app_theme.dart';

/// Reading text of the booklet. Besides [JpText] marks, a line starting
/// with `# ` is a centred title and consecutive lines starting with `|` form
/// a table (cells separated by `|`).
class PassageCard extends StatelessWidget {
  final String text;

  const PassageCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    final table = <List<String>>[];

    void flushTable() {
      if (table.isEmpty) return;
      children.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: _PassageTable(rows: [...table]),
      ));
      table.clear();
    }

    for (final line in text.split('\n')) {
      if (line.startsWith('|')) {
        table.add(_cells(line));
        continue;
      }
      flushTable();
      if (line.startsWith('# ')) {
        children.add(Center(
          child: JpText(
            line.substring(2),
            fontSize: 18,
            fontWeight: FontWeight.w800,
            textAlign: TextAlign.center,
          ),
        ));
      } else if (line.isEmpty) {
        children.add(const SizedBox(height: 8));
      } else {
        children.add(JpText(line, fontSize: 17));
      }
    }
    flushTable();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.sand),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

/// Cells of a `| a | b |` row. Bars inside furigana marks (`[円|えん]`) are
/// part of the cell.
List<String> _cells(String line) {
  final cells = <String>[];
  final cell = StringBuffer();
  var inRuby = false;
  for (final char in line.split('')) {
    if (char == '[') inRuby = true;
    if (char == ']') inRuby = false;
    if (char == '|' && !inRuby) {
      cells.add(cell.toString().trim());
      cell.clear();
    } else {
      cell.write(char);
    }
  }
  cells.add(cell.toString().trim());
  // Drop the empty cells outside the first and last bars.
  return cells.sublist(1, cells.last.isEmpty ? cells.length - 1 : cells.length);
}

class _PassageTable extends StatelessWidget {
  final List<List<String>> rows;

  const _PassageTable({required this.rows});

  @override
  Widget build(BuildContext context) {
    final columns = rows.fold<int>(0, (m, r) => r.length > m ? r.length : m);
    final table = Table(
      defaultColumnWidth: const IntrinsicColumnWidth(),
      border: TableBorder.all(color: AppColors.slate.withAlpha(120)),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        for (var r = 0; r < rows.length; r++)
          TableRow(
            decoration: r == 0 ? BoxDecoration(color: AppColors.sand) : null,
            children: [
              for (var c = 0; c < columns; c++)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: JpText(
                    c < rows[r].length ? rows[r][c] : '',
                    fontSize: 15,
                    fontWeight: r == 0 ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
            ],
          ),
      ],
    );
    // Columns take the width of their content; wide tables scroll sideways.
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: table,
    );
  }
}
