import 'package:flutter/material.dart';

class Snackbars {
  static OverlayEntry? _currentEntry;

  static void showSuccessScaffold(BuildContext context, String message) {
    showSnackBar(
      context,
      message,
      const Color(0xFF1B9A59),
      icon: Icons.check_circle_outline,
    );
  }

  static void showWarningScaffold(BuildContext context, String message) {
    showSnackBar(
      context,
      message,
      const Color(0xFFE6942A),
      icon: Icons.warning_amber_outlined,
    );
  }

  static void showErrorScaffold(BuildContext context, String message) {
    showSnackBar(
      context,
      message,
      const Color(0xFFC44444),
      icon: Icons.error_outline,
    );
  }

  static void showSnackBar(
    BuildContext context,
    String message,
    Color color, {
    IconData? icon,
  }) {
    final overlay = Overlay.of(context, rootOverlay: true);

    _currentEntry?.remove();
    _currentEntry = null;

    final view = View.of(context);
    final safeTop = view.padding.top / view.devicePixelRatio;
    final topOffset = safeTop + 12.0;

    const animationDuration = Duration(milliseconds: 220);
    const visibleDuration = Duration(milliseconds: 1550);

    bool isVisible = false;

    final entry = OverlayEntry(
      builder: (overlayContext) => Positioned(
        left: 16,
        right: 16,
        top: topOffset,
        child: Material(
          type: MaterialType.transparency,
          child: AnimatedSlide(
            duration: animationDuration,
            curve: Curves.easeOutCubic,
            offset: isVisible ? Offset.zero : const Offset(0, -0.35),
            child: AnimatedOpacity(
              duration: animationDuration,
              curve: Curves.easeOut,
              opacity: isVisible ? 1 : 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color.withAlpha(245), color.withAlpha(215)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withAlpha(60),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(38),
                      blurRadius: 18,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(50),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(icon, color: Colors.white, size: 15),
                      ),
                      const SizedBox(width: 10),
                    ],
                    Expanded(
                      child: Text(
                        message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13.5,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);
    _currentEntry = entry;

    Future.delayed(Duration.zero, () {
      isVisible = true;
      entry.markNeedsBuild();
    });

    Future.delayed(visibleDuration, () {
      if (_currentEntry != entry) return;
      isVisible = false;
      entry.markNeedsBuild();

      Future.delayed(animationDuration, () {
        if (_currentEntry != entry) return;
        _currentEntry = null;
        entry.markNeedsBuild();
        entry.remove();
      });
    });
  }
}
