import 'package:flutter/material.dart';

class Snackbars {
  static void showSuccessScaffold(BuildContext context, String message) {
    showSnackBar(context, message, Colors.green);
  }

  static void showWarningScaffold(BuildContext context, String message) {
    showSnackBar(context, message, Colors.orange);
  }

  static void showErrorScaffold(BuildContext context, String message) {
    showSnackBar(context, message, Colors.red);
  }

  static void showSnackBar(BuildContext context, String message, Color color) {
    final overlay = Overlay.of(context);

    const snackBarHeight = 50.0;
    const duration = Duration(milliseconds: 250);

    // Variables para controlar la animación
    double bottomPosition = 0;
    double opacity = 0.0;

    // Crear el OverlayEntry para el SnackBar
    final entry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: bottomPosition,
        left: 0,
        right: 0,
        child: Material(
          elevation: 6.0,
          child: AnimatedOpacity(
            duration: duration,
            opacity: opacity,
            child: Container(
              color: color,
              height: snackBarHeight,
              child: Center(child: Text(message)),
            ),
          ),
        ),
      ),
    );

    // Agregar el OverlayEntry al Overlay
    overlay.insert(entry);

    // Iniciar la animación
    Future.delayed(Duration.zero, () {
      bottomPosition = 0;
      opacity = 1.0;
      entry.markNeedsBuild();

      // Esperar durante la duración del SnackBar
      Future.delayed(const Duration(seconds: 3) + duration, () {
        // Completar la animación de salida
        bottomPosition = -snackBarHeight;
        opacity = 0.0;
        entry.markNeedsBuild();

        // Remover el SnackBar del Overlay después de completar la animación
        Future.delayed(duration, () {
          entry.remove();
        });
      });
    });
  }
}
