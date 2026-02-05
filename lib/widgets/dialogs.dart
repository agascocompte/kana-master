import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
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
}
