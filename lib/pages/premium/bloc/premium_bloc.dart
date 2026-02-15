import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/repositories/settings_repository.dart';

part 'premium_event.dart';
part 'premium_state.dart';

class PremiumBloc extends Bloc<PremiumEvent, PremiumState> {
  PremiumBloc({
    required SettingsRepository settingsRepository,
    InAppPurchase? inAppPurchase,
  })  : _settingsRepository = settingsRepository,
        _inAppPurchase = inAppPurchase ?? InAppPurchase.instance,
        super(const PremiumState()) {
    on<PremiumStarted>(_onStarted);
    on<PremiumBuyRequested>(_onBuyRequested);
    on<PremiumRestoreRequested>(_onRestoreRequested);
    on<_PremiumPurchaseUpdatesArrived>(_onPurchaseUpdatesArrived);
    on<PremiumNoticeCleared>(_onNoticeCleared);
    on<PremiumDebugSetLocal>(_onDebugSetLocal);

    _purchaseSubscription = _inAppPurchase.purchaseStream.listen(
      (updates) => add(_PremiumPurchaseUpdatesArrived(updates)),
      onError: (e) => add(_PremiumPurchaseUpdatesArrived(const [])),
    );
  }

  final SettingsRepository _settingsRepository;
  final InAppPurchase _inAppPurchase;
  StreamSubscription<List<PurchaseDetails>>? _purchaseSubscription;

  @override
  Future<void> close() async {
    await _purchaseSubscription?.cancel();
    return super.close();
  }

  Future<void> _onStarted(
    PremiumStarted event,
    Emitter<PremiumState> emit,
  ) async {
    emit(state.copyWith(loading: true, clearNotice: true));
    final isPremium = await _settingsRepository.getPremiumUnlocked();
    final available = await _inAppPurchase.isAvailable();
    ProductDetails? product;
    if (available) {
      final response =
          await _inAppPurchase.queryProductDetails({premiumProductId});
      if (response.productDetails.isNotEmpty) {
        product = response.productDetails.first;
      }
    }
    emit(state.copyWith(
      loading: false,
      isPremium: isPremium,
      storeAvailable: available,
      product: product,
    ));
  }

  Future<void> _onBuyRequested(
    PremiumBuyRequested event,
    Emitter<PremiumState> emit,
  ) async {
    final product = state.product;
    if (product == null || !state.storeAvailable) {
      emit(state.copyWith(
        notice: PremiumNotice.error,
      ));
      return;
    }
    emit(state.copyWith(purchaseBusy: true, clearNotice: true));
    final param = PurchaseParam(productDetails: product);
    final launched = await _inAppPurchase.buyNonConsumable(purchaseParam: param);
    if (!launched) {
      emit(state.copyWith(
        purchaseBusy: false,
        notice: PremiumNotice.error,
      ));
    }
  }

  Future<void> _onRestoreRequested(
    PremiumRestoreRequested event,
    Emitter<PremiumState> emit,
  ) async {
    emit(state.copyWith(purchaseBusy: true, clearNotice: true));
    await _inAppPurchase.restorePurchases();
  }

  Future<void> _onPurchaseUpdatesArrived(
    _PremiumPurchaseUpdatesArrived event,
    Emitter<PremiumState> emit,
  ) async {
    if (event.updates.isEmpty) return;
    for (final purchase in event.updates) {
      final bool matchesPremiumProduct = purchase.productID == premiumProductId;
      if (purchase.status == PurchaseStatus.pending) {
        emit(state.copyWith(purchaseBusy: true));
        continue;
      }
      if (purchase.status == PurchaseStatus.error) {
        emit(state.copyWith(
          purchaseBusy: false,
          notice: PremiumNotice.error,
          errorText: purchase.error?.message,
        ));
      }
      if (purchase.status == PurchaseStatus.purchased ||
          purchase.status == PurchaseStatus.restored) {
        if (!matchesPremiumProduct) {
          if (purchase.pendingCompletePurchase) {
            await _inAppPurchase.completePurchase(purchase);
          }
          continue;
        }
        await _settingsRepository.savePremiumUnlocked(true);
        emit(state.copyWith(
          purchaseBusy: false,
          isPremium: true,
          notice: purchase.status == PurchaseStatus.restored
              ? PremiumNotice.restored
              : PremiumNotice.purchased,
        ));
      }
      if (purchase.pendingCompletePurchase) {
        await _inAppPurchase.completePurchase(purchase);
      }
    }
  }

  Future<void> _onNoticeCleared(
    PremiumNoticeCleared event,
    Emitter<PremiumState> emit,
  ) async {
    emit(state.copyWith(clearNotice: true));
  }

  Future<void> _onDebugSetLocal(
    PremiumDebugSetLocal event,
    Emitter<PremiumState> emit,
  ) async {
    await _settingsRepository.savePremiumUnlocked(event.enabled);
    emit(state.copyWith(isPremium: event.enabled, clearNotice: true));
  }
}
