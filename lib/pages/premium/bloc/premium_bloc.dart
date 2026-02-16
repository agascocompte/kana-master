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
    on<_PremiumPurchaseStreamError>(_onPurchaseStreamError);
    on<_PremiumBusyTimeout>(_onBusyTimeout);
    on<PremiumNoticeCleared>(_onNoticeCleared);
    on<PremiumDebugSetLocal>(_onDebugSetLocal);

    _purchaseSubscription = _inAppPurchase.purchaseStream.listen(
      (updates) => add(_PremiumPurchaseUpdatesArrived(updates)),
      onError: (e) => add(_PremiumPurchaseStreamError(e)),
    );
  }

  final SettingsRepository _settingsRepository;
  final InAppPurchase _inAppPurchase;
  StreamSubscription<List<PurchaseDetails>>? _purchaseSubscription;
  Timer? _busyTimer;

  @override
  Future<void> close() async {
    _busyTimer?.cancel();
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
    _armBusyTimeout();
    final param = PurchaseParam(productDetails: product);
    final launched = await _inAppPurchase.buyNonConsumable(purchaseParam: param);
    if (!launched) {
      _clearBusyTimeout();
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
    _armBusyTimeout();
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
        _armBusyTimeout();
        continue;
      }
      if (purchase.status == PurchaseStatus.error) {
        _clearBusyTimeout();
        emit(state.copyWith(
          purchaseBusy: false,
          notice: PremiumNotice.error,
          errorText: purchase.error?.message,
        ));
      }
      if (purchase.status == PurchaseStatus.canceled) {
        _clearBusyTimeout();
        emit(state.copyWith(
          purchaseBusy: false,
          clearNotice: true,
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
        _clearBusyTimeout();
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

  Future<void> _onPurchaseStreamError(
    _PremiumPurchaseStreamError event,
    Emitter<PremiumState> emit,
  ) async {
    _clearBusyTimeout();
    emit(state.copyWith(
      purchaseBusy: false,
      notice: PremiumNotice.error,
      errorText: event.error.toString(),
    ));
  }

  Future<void> _onBusyTimeout(
    _PremiumBusyTimeout event,
    Emitter<PremiumState> emit,
  ) async {
    if (!state.purchaseBusy) return;
    _clearBusyTimeout();
    emit(state.copyWith(
      purchaseBusy: false,
      clearNotice: true,
    ));
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

  void _armBusyTimeout() {
    _busyTimer?.cancel();
    _busyTimer = Timer(
      const Duration(seconds: 20),
      () => add(const _PremiumBusyTimeout()),
    );
  }

  void _clearBusyTimeout() {
    _busyTimer?.cancel();
    _busyTimer = null;
  }
}
