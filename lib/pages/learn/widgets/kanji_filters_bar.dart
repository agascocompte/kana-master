import 'package:flutter/material.dart';
import 'package:kana_master/i18n/strings.g.dart';

class KanjiFiltersBar extends StatelessWidget {
  final String jlptFilter;
  final ValueChanged<String> onQueryChanged;
  final ValueChanged<String> onJlptChanged;

  const KanjiFiltersBar({
    super.key,
    required this.jlptFilter,
    required this.onQueryChanged,
    required this.onJlptChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: t.app.searchByMeaning,
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) => onQueryChanged(value),
            ),
          ),
          const SizedBox(width: 8),
          DropdownButton<String>(
            value: jlptFilter,
            onChanged: (value) {
              if (value != null) onJlptChanged(value);
            },
            items: [
              DropdownMenuItem(value: 'all', child: Text(t.app.filterAll)),
              const DropdownMenuItem(value: 'n5', child: Text('N5')),
              const DropdownMenuItem(value: 'n4', child: Text('N4')),
              const DropdownMenuItem(value: 'n3', child: Text('N3')),
              const DropdownMenuItem(value: 'n2', child: Text('N2')),
              const DropdownMenuItem(value: 'n1', child: Text('N1')),
            ],
          ),
        ],
      ),
    );
  }
}
