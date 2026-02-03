import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.mist, AppColors.sand],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 18, 16, 6),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(Icons.arrow_back),
                        color: AppColors.ink,
                        tooltip: 'Back',
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'Materials',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: AppColors.ink,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Text(
                    'Import a CSV and turn it into a personal drill deck.',
                    style: TextStyle(color: AppColors.slate, fontSize: 14),
                  ),
                ),
                Expanded(child: MaterialTab()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
