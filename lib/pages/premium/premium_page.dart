import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/pages/premium/bloc/premium_bloc.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/widgets/snackbars.dart';
import 'package:kana_master/i18n/strings.g.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    return BlocConsumer<PremiumBloc, PremiumState>(
      listener: (context, state) {
        if (state.notice == PremiumNotice.purchased) {
          Snackbars.showSuccessScaffold(context, tr.app.premiumPurchased);
          context.read<PremiumBloc>().add(const PremiumNoticeCleared());
        } else if (state.notice == PremiumNotice.restored) {
          Snackbars.showSuccessScaffold(context, tr.app.premiumRestored);
          context.read<PremiumBloc>().add(const PremiumNoticeCleared());
        } else if (state.notice == PremiumNotice.error) {
          final error = state.errorText?.trim();
          final msg = (error == null || error.isEmpty)
              ? tr.app.premiumStoreUnavailable
              : tr.app.premiumPurchaseError(error: error);
          Snackbars.showErrorScaffold(context, msg);
          context.read<PremiumBloc>().add(const PremiumNoticeCleared());
        }
      },
      builder: (context, state) {
        final product = state.product;
        final String price = product?.price ?? '0.99€';
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.ink, AppColors.teal],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      tr.app.premiumTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      tr.app.premiumSubtitle,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr.app.premiumHeroTitle,
                            style: const TextStyle(
                              color: AppColors.ink,
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            tr.app.premiumHeroBody,
                            style: const TextStyle(color: AppColors.slate),
                          ),
                          const SizedBox(height: 14),
                          _benefit(tr.app.premiumBenefitNoAds),
                          _benefit(tr.app.premiumBenefitMaterials),
                          _benefit(tr.app.premiumBenefitHard),
                          _benefit(tr.app.premiumBenefitAi),
                          _benefit(tr.app.premiumBenefitBackup),
                        ],
                      ),
                    ),
                    const Spacer(),
                    if (state.isPremium)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          tr.app.premiumOwnedBadge,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.ink,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    else ...[
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (state.purchaseBusy || !state.storeAvailable)
                              ? null
                              : () => context
                                  .read<PremiumBloc>()
                                  .add(const PremiumBuyRequested()),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppColors.ink,
                            minimumSize: const Size.fromHeight(48),
                          ),
                          child: state.purchaseBusy
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : Text(tr.app.premiumBuyButton(price: price)),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: state.purchaseBusy
                              ? null
                              : () => context
                                  .read<PremiumBloc>()
                                  .add(const PremiumRestoreRequested()),
                          child: Text(
                            tr.app.premiumRestoreButton,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _benefit(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, size: 18, color: AppColors.teal),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
