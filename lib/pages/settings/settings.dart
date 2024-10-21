import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/extensions.dart';
import 'package:hiragana_japanesse/pages/settings/bloc/settings_bloc.dart';
import 'package:hiragana_japanesse/pages/settings/widgets/dropdown_tile_setting.dart';
import 'package:hiragana_japanesse/pages/settings/widgets/switch_tile_setting.dart';

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
                  subtitle: "Choose the level of difficulty for the kana test.",
                  currentValue: state.stateData.difficultyLevel,
                  icon: Icons.settings,
                  items: DifficultyLevel.values.map((DifficultyLevel level) {
                    return DropdownMenuItem<DifficultyLevel>(
                      value: level,
                      child:
                          Text(level.toString().split('.').last.capitalize()),
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
