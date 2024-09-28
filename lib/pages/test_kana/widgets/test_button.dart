import 'package:flutter/material.dart';
import 'package:hiragana_japanesse/constants.dart';

class TestButton extends StatelessWidget {
  final Color? backgroundColor;
  final double? opacity;
  final void Function()? onPressed;
  final Icon? icon;
  final String heroTag;

  const TestButton({
    super.key,
    required this.heroTag,
    this.backgroundColor,
    this.opacity,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FloatingActionButton(
        backgroundColor: backgroundColor ?? jOrange,
        elevation: 4.0,
        onPressed: onPressed,
        heroTag: heroTag,
        child: Opacity(opacity: opacity ?? 1, child: icon),
      ),
    );
  }
}
