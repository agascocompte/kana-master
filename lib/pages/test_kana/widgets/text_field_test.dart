import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/constants.dart';

import '../bloc/test_kana_bloc.dart';

class TextFieldTest extends StatelessWidget {
  const TextFieldTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: SizedBox(
        width: 250,
        child: TextField(
          textAlign: TextAlign.center,
          cursorColor: jLightBLue,
          style: TextStyle(fontSize: 30),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: jDarkBLue)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: jLightBLue, width: 2)),
              labelText: 'Answer',
              labelStyle: TextStyle(color: jDarkBLue),
              floatingLabelBehavior: FloatingLabelBehavior.always),
          onChanged: (value) => context
              .read<TestKanaBloc>()
              .add(UpdateUserTextAnswer(userAnswer: value)),
        ),
      ),
    );
  }
}
