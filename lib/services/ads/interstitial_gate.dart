import 'dart:io';
import 'dart:math' as math;

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kana_master/constants.dart';

class InterstitialGate {
  InterstitialGate._();

  static final InterstitialGate instance = InterstitialGate._();

  final math.Random _random = math.Random();
  InterstitialAd? _ad;
  bool _loading = false;
  int _correctUntilNextAd = 1;

  Future<void> initialize() async {
    _scheduleNextAd();
    _loadAd();
  }

  void onCorrectAnswer({required bool isPremium}) {
    if (isPremium) return;
    _correctUntilNextAd -= 1;
    if (_correctUntilNextAd > 0) return;
    _showAdIfReady();
    _scheduleNextAd();
  }

  void _scheduleNextAd() {
    // 1/2/3 aciertos con distribución uniforme.
    _correctUntilNextAd = _random.nextInt(3) + 1;
  }

  void _showAdIfReady() {
    final ad = _ad;
    if (ad == null) {
      _loadAd();
      return;
    }
    _ad = null;
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
        onAdFailedToLoad: (_) {
          _loading = false;
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
