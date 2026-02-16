part of 'premium_bloc.dart';

abstract class PremiumEvent {
  const PremiumEvent();
}

class PremiumStarted extends PremiumEvent {
  const PremiumStarted();
}

class PremiumBuyRequested extends PremiumEvent {
  const PremiumBuyRequested();
}

class PremiumRestoreRequested extends PremiumEvent {
  const PremiumRestoreRequested();
}

class PremiumNoticeCleared extends PremiumEvent {
  const PremiumNoticeCleared();
}

class PremiumDebugSetLocal extends PremiumEvent {
  const PremiumDebugSetLocal(this.enabled);
  final bool enabled;
}

class _PremiumPurchaseUpdatesArrived extends PremiumEvent {
  const _PremiumPurchaseUpdatesArrived(this.updates);
  final List<PurchaseDetails> updates;
}

class _PremiumPurchaseStreamError extends PremiumEvent {
  const _PremiumPurchaseStreamError(this.error);
  final Object error;
}

class _PremiumBusyTimeout extends PremiumEvent {
  const _PremiumBusyTimeout();
}
