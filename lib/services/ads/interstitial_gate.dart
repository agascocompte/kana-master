import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kana_master/constants.dart';

class InterstitialGate {
  InterstitialGate._();

  static final InterstitialGate instance = InterstitialGate._();

  InterstitialAd? _ad;
  bool _loading = false;
  DateTime? _lastShownAt;

  /// Minimum time between two interstitials.
  static const Duration minInterval = Duration(minutes: 3);

  Future<void> initialize() async {
    _loadAd();
  }

  /// Shows an interstitial at the end of a practice session, at most once
  /// every [minInterval]. If no ad is ready, the session ends without one.
  void onSessionFinished({required bool isPremium}) {
    if (isPremium) return;
    final last = _lastShownAt;
    if (last != null && DateTime.now().difference(last) < minInterval) return;
    _showAdIfReady();
  }

  void _showAdIfReady() {
    final ad = _ad;
    if (ad == null) {
      _loadAd();
      return;
    }
    _ad = null;
    _lastShownAt = DateTime.now();
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _loadAd();
      },
      onAdFailedToShowFullScreenContent: (ad, _) {
        ad.dispose();
        _loadAd();
      },
    );
    ad.show();
  }

  void _loadAd() {
    if (_loading || _ad != null) return;
    final unitId = _interstitialUnitId();
    if (unitId == null) return;
    _loading = true;
    InterstitialAd.load(
      adUnitId: unitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _loading = false;
          _ad = ad;
        },
        onAdFailedToLoad: (error) {
          _loading = false;
          debugPrint(
            'Interstitial failed to load: ${error.code} - ${error.message}',
          );
        },
      ),
    );
  }

  String? _interstitialUnitId() {
    if (Platform.isAndroid) return admobInterstitialAndroidId;
    if (Platform.isIOS) return admobInterstitialIosId;
    return null;
  }
}
