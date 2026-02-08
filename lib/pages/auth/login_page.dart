import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/router/router.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.mist, AppColors.sand],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: -120,
                right: -80,
                child: Container(
                  width: 240,
                  height: 240,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.peach.withAlpha(60),
                  ),
                ),
              ),
              Positioned(
                bottom: -140,
                left: -60,
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.teal.withAlpha(50),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.app.loginTitle,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: AppColors.ink,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      t.app.loginSubtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.slate,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 420),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: -24,
                                  right: 28,
                                  child: Container(
                                    width: 52,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.peach.withAlpha(120),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 8,
                                  top: 16,
                                  bottom: 16,
                                  child: Container(
                                    width: 6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      gradient: const LinearGradient(
                                        colors: [
                                          AppColors.teal,
                                          AppColors.peach,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(26),
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.peach.withAlpha(140),
                                        AppColors.teal.withAlpha(140),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withAlpha(14),
                                        blurRadius: 20,
                                        offset: const Offset(0, 12),
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        26, 20, 20, 20),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withAlpha(235),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (Platform.isIOS) ...[
                                          SignInWithAppleButton(
                                            onPressed: () => context
                                                .go(AppRouter.homeRoute),
                                            style:
                                                SignInWithAppleButtonStyle.black,
                                          ),
                                          const SizedBox(height: 12),
                                        ],
                                        SignInButton(
                                          Buttons.Google,
                                          onPressed: () => context
                                              .go(AppRouter.homeRoute),
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          t.app.loginFooter,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: AppColors.slate,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
