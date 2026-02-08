import 'package:flutter/material.dart';
import 'package:kana_master/domain/models/dictionary_entry.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/pages/dictionary/widgets/chip_wrap.dart';
import 'package:kana_master/pages/dictionary/widgets/info_block.dart';
import 'package:kana_master/theme/app_theme.dart';

class DictionaryEntryCard extends StatelessWidget {
  const DictionaryEntryCard({
    super.key,
    required this.entry,
  });

  final DictionaryEntry entry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            entry.word,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.ink,
            ),
          ),
          if (entry.reading.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: SelectableText(
                entry.reading,
                style: const TextStyle(color: AppColors.slate),
              ),
            ),
          const SizedBox(height: 8),
          ChipWrap(
            items: entry.meanings,
            color: AppColors.peach.withAlpha(70),
            borderColor: AppColors.peach.withAlpha(120),
          ),
          if (entry.partsOfSpeech.isNotEmpty ||
              entry.tags.isNotEmpty ||
              entry.jlpt.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ChipWrap(
                items: [
                  ...entry.partsOfSpeech,
                  ...entry.tags,
                  ...entry.jlpt,
                ],
                color: AppColors.mist,
                borderColor: AppColors.sand,
                textStyle: const TextStyle(fontSize: 12),
              ),
            ),
          if (entry.info.isNotEmpty || entry.seeAlso.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (entry.info.isNotEmpty)
                    InfoBlock(
                      title: t.app.dictionaryNotes,
                      lines: entry.info,
                    ),
                  if (entry.seeAlso.isNotEmpty)
                    InfoBlock(
                      title: t.app.dictionarySeeAlso,
                      lines: entry.seeAlso,
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
