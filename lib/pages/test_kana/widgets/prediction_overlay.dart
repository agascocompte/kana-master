import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';

class PredictionOverlay extends StatelessWidget {
  const PredictionOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      color: Colors.black.withAlpha(128),
      child: const CircularProgressIndicator(
        color: jOrange,
      ),
    );
  }
}
