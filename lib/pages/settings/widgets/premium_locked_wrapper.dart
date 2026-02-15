import 'package:flutter/material.dart';
import 'package:kana_master/theme/app_theme.dart';

class PremiumLockedWrapper extends StatelessWidget {
  final bool locked;
  final VoidCallback onTapLocked;
  final Widget child;

  const PremiumLockedWrapper({
    super.key,
    required this.locked,
    required this.onTapLocked,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (!locked) return child;
    return Stack(
      children: [
        Opacity(opacity: 0.52, child: child),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: onTapLocked,
            ),
          ),
        ),
        const Positioned(
          top: 8,
          right: 10,
          child: Icon(
            Icons.lock_outline,
            color: AppColors.slate,
            size: 16,
          ),
        ),
      ],
    );
  }
}
