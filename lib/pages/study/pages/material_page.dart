import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/di/dependency_injector.dart';
import 'package:kana_master/pages/study/bloc/material_bloc.dart';
import 'package:kana_master/pages/study/widgets/material_tab.dart';
import 'package:kana_master/theme/app_theme.dart';

class MaterialPage extends StatelessWidget {
  const MaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MaterialBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Materials'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.mist, AppColors.sand],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: const MaterialTab(),
        ),
      ),
    );
  }
}
