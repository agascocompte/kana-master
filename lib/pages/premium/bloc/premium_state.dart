part of 'premium_bloc.dart';

enum PremiumNotice { purchased, restored, error }

class PremiumState {
  const PremiumState({
    this.loading = false,
    this.purchaseBusy = false,
    this.isPremium = false,
    this.storeAvailable = false,
    this.product,
    this.notice,
    this.errorText,
  });

  final bool loading;
  final bool purchaseBusy;
  final bool isPremium;
  final bool storeAvailable;
  final ProductDetails? product;
  final PremiumNotice? notice;
  final String? errorText;

  PremiumState copyWith({
    bool? loading,
    bool? purchaseBusy,
    bool? isPremium,
    bool? storeAvailable,
    ProductDetails? product,
    PremiumNotice? notice,
    String? errorText,
    bool clearNotice = false,
  }) {
    return PremiumState(
      loading: loading ?? this.loading,
      purchaseBusy: purchaseBusy ?? this.purchaseBusy,
      isPremium: isPremium ?? this.isPremium,
      storeAvailable: storeAvailable ?? this.storeAvailable,
      product: product ?? this.product,
      notice: clearNotice ? null : (notice ?? this.notice),
      errorText: errorText ?? this.errorText,
    );
  }
}
