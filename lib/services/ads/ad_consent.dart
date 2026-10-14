import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Ad consent through Google's User Messaging Platform (the GDPR message set
/// up in AdMob). The form only shows to users in regions that require it,
/// and only until they answer.
class AdConsent {
  AdConsent._();

  static final AdConsent instance = AdConsent._();

  /// Hashed ids of real devices that should see the debug geography. The SDK
  /// prints a device's id in the log the first time it asks for consent.
  static const List<String> _testDeviceIds = [];

  /// Debug builds act as if they were in the EEA, so the form can be tested
  /// from anywhere. Set to false to see the real behavior.
  static const bool _debugAsEea = true;

  /// Asks for consent if needed and completes once ads may be requested, or
  /// right away with false if consent can't be obtained.
  Future<bool> gather() async {
    final done = Completer<void>();
    ConsentInformation.instance.requestConsentInfoUpdate(
      ConsentRequestParameters(
        consentDebugSettings: kDebugMode && _debugAsEea
            ? ConsentDebugSettings(
                debugGeography: DebugGeography.debugGeographyEea,
                testIdentifiers: _testDeviceIds,
              )
            : null,
      ),
      () => ConsentForm.loadAndShowConsentFormIfRequired((error) {
        if (error != null) {
          debugPrint('Consent form error: ${error.errorCode} ${error.message}');
        }
        done.complete();
      }),
      (error) {
        debugPrint(
            'Consent update failed: ${error.errorCode} ${error.message}');
        done.complete();
      },
    );
    await done.future;
    return canRequestAds();
  }

  Future<bool> canRequestAds() => ConsentInformation.instance.canRequestAds();

  /// Whether Settings must offer a way to change the consent choice.
  Future<bool> privacyOptionsRequired() async {
    final status =
        await ConsentInformation.instance.getPrivacyOptionsRequirementStatus();
    return status == PrivacyOptionsRequirementStatus.required;
  }

  Future<void> showPrivacyOptions() {
    return ConsentForm.showPrivacyOptionsForm((error) {
      if (error != null) {
        debugPrint(
            'Privacy options error: ${error.errorCode} ${error.message}');
      }
    });
  }

  /// Debug only: forgets the consent choice so the form shows again on the
  /// next launch.
  Future<void> reset() => ConsentInformation.instance.reset();
}
