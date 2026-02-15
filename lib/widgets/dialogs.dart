import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kana_entry.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/pages/learn/widgets/kana_dialog.dart';
import 'package:kana_master/pages/learn/widgets/kanji_dialog.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';
import 'package:kana_master/i18n/strings.g.dart';

class Dialogs {
  static void showResetStatsAlert(
    BuildContext context,
  ) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Center(child: Text(t.app.confirmActionTitle)),
          content: Text(t.app.confirmActionBody),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  t.app.cancel,
                  style: const TextStyle(
                    color: jDarkBLue,
                  ),
                )),
            TextButton(
                onPressed: () {
                  context.read<StatsBloc>().add(ResetStats());
                  Navigator.pop(context);
                },
                child: Text(
                  t.app.delete,
                  style: const TextStyle(color: Colors.red),
                )),
          ],
        );
      },
    );
  }

  static void showAiInfoDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(t.app.aiInfoTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t.app.aiInfoLine1),
            const SizedBox(height: 6),
            Text(t.app.aiInfoLine2),
            const SizedBox(height: 6),
            Text(t.app.aiInfoLine3),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(t.app.ok),
          ),
        ],
      ),
    );
  }

  static void showKanjiDialog(
    BuildContext context,
    KanjiEntry entry,
    List<String> meanings,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return KanjiDialog(entry: entry, meanings: meanings);
      },
    );
  }

  static void showKanaDialog(
      BuildContext context, KanaEntry entry, KanaType kanaType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return KanaDialog(
          assetKey: entry.assetKey,
          displayText: entry.reading,
          kanaFolder: kanaType == KanaType.hiragana
              ? t.app.scriptHiragana.toLowerCase()
              : t.app.scriptKatakana.toLowerCase(),
        );
      },
    );
  }

  static void showExpectedFormatDialog(BuildContext context) {
    final tr = context.t;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tr.app.expectedFormatTitle),
        content: Text(tr.app.expectedFormatBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(tr.app.ok),
          ),
        ],
      ),
    );
  }

  static Future<bool> showReportDrawingConfirmDialog(
      BuildContext context) async {
    final tr = context.t;
    final localizations = MaterialLocalizations.of(context);
    return await showDialog<bool>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: Text(tr.app.testReportDrawing),
            content: Text(tr.app.testReportConfirmBody),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: Text(localizations.cancelButtonLabel),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: jDarkBLue,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  minimumSize: const Size(100, 40),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(localizations.okButtonLabel),
              ),
            ],
          ),
        ) ??
        false;
  }
}
