import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/extensions.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/pages/settings/widgets/dropdown_tile_setting.dart';
import 'package:kana_master/pages/settings/widgets/switch_tile_setting.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: jOrange,
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchTileSetting(
                  title: "Kana settings",
                  optionText:
                      "Switch to ${state.stateData.kanaType == KanaType.hiragana ? 'Katakana' : 'Hiragana'}",
                  subtitle:
                      "Toggle between Hiragana and Katakana scripts for learning.",
                  value: state.stateData.kanaType == KanaType.katakana,
                  icon: Icons.language,
                  onChanged: (bool value) {
                    context.read<SettingsBloc>().add(ToggleKanaType());
                  },
                ),
                SizedBox(height: 20),
                DropdownTileSetting(
                  title: "Test difficulty",
                  subtitle:
                      "Choose the level of difficulty \nfor the kana test.",
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
                            style: TextStyle(fontSize: 12, color: Colors.grey),
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
          );
        },
      ),
    );
  }
}
