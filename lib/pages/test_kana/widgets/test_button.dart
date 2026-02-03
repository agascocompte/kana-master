import 'package:flutter/material.dart';
import 'package:kana_master/theme/app_theme.dart';

class TestButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? iconColor;
  final double? opacity;
  final void Function()? onPressed;
  final Icon? icon;
  final String heroTag;

  const TestButton({
    super.key,
    required this.heroTag,
    this.backgroundColor,
    this.iconColor,
    this.opacity,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FloatingActionButton(
        backgroundColor: backgroundColor ?? AppColors.ink,
        elevation: 4.0,
        onPressed: onPressed,
        heroTag: heroTag,
        child: Opacity(
          opacity: opacity ?? 1,
          child: icon == null
              ? null
              : Icon(
                  icon!.icon,
                  color: iconColor ?? icon!.color,
                ),
        ),
      ),
    );
  }
}
