import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/extensions.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/pages/settings/widgets/dropdown_tile_setting.dart';
import 'package:kana_master/theme/app_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.mist, AppColors.sand],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const Text(
                  'Learning defaults',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 12),
                DropdownTileSetting(
                  title: "Test difficulty",
                  subtitle:
                      "Choose the level of difficulty for practice sessions.",
                  currentValue: state.stateData.difficultyLevel,
                  icon: Icons.speed_outlined,
                  items: DifficultyLevel.values.map((DifficultyLevel level) {
                    String description;
                    switch (level) {
                      case DifficultyLevel.low:
                        description = "Single choice";
                        break;
                      case DifficultyLevel.medium:
                        description = "Text answer";
                        break;
                      case DifficultyLevel.high:
                        description = "Drawing";
                        break;
                    }

                    return DropdownMenuItem<DifficultyLevel>(
                      value: level,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(level.toString().split('.').last.capitalize()),
                          Text(
                            description,
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (DifficultyLevel? newValue) {
                    if (newValue != null) {
                      context.read<SettingsBloc>().add(
                          ChangeDifficultyLevel(difficultyLevel: newValue));
                    }
                  },
                ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
