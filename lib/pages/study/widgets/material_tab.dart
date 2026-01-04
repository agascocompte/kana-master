import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';

class MaterialTab extends StatelessWidget {
  const MaterialTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: jLightBLue,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: const Text(
          "Aquí podrás añadir tu material (Excel/PDF) y practicar sobre él. Próximamente.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: jDarkBLue,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
