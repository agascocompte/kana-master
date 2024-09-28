import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/pages/settings/bloc/settings_bloc.dart';
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
                  title: "Script settings",
                  optionText:
                      "Switch to ${state.stateData.scriptType == ScriptType.hiragana ? 'Katakana' : 'Hiragana'}",
                  subtitle:
                      "Toggle between Hiragana and Katakana scripts for learning.",
                  value: state.stateData.scriptType == ScriptType.katakana,
                  icon: Icons.language,
                  onChanged: (bool value) {
                    context.read<SettingsBloc>().add(ToggleScriptType());
                  },
                ),
                SizedBox(height: 20),
                SwitchTileSetting(
                  title: "Test settings",
                  optionText: "Enable drawing test",
                  subtitle:
                      "Activate this option to require users to draw characters during the test.",
                  value: state.stateData.isDrawingTestEnabled,
                  icon: Icons.brush,
                  onChanged: (bool value) {
                    context.read<SettingsBloc>().add(ToggleDrawingTest());
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
