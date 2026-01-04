import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';

class Dialogs {
  static void showResetStatsAlert(
    BuildContext context,
  ) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: const Center(child: Text("Confirm action")),
          content: const Text("Are you sure to delete ALL the statistics?"),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: jDarkBLue,
                  ),
                )),
            TextButton(
                onPressed: () {
                  context.read<StatsBloc>().add(ResetStats());
                  Navigator.pop(context);
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                )),
          ],
        );
      },
    );
  }
}
