import 'dart:async';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
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

  /// iOS only: asks for App Tracking Transparency if it was never asked.
  /// The IDFA message from AdMob should already do it, but it doesn't always
  /// show, so this makes sure the system prompt appears once.
  Future<void> requestTrackingIfNeeded() async {
    if (defaultTargetPlatform != TargetPlatform.iOS) return;
    try {
      final status = await AppTrackingTransparency.trackingAuthorizationStatus;
      if (status != TrackingStatus.notDetermined) return;
      // iOS ignores the request unless the app is in the foreground.
      await _whenActive();
      await AppTrackingTransparency.requestTrackingAuthorization();
    } catch (e) {
      debugPrint('Tracking request failed: $e');
    }
  }

  Future<void> _whenActive() async {
    if (WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed) {
      return;
    }
    final active = Completer<void>();
    final listener = AppLifecycleListener(onStateChange: (state) {
      if (state == AppLifecycleState.resumed && !active.isCompleted) {
        active.complete();
      }
    });
    await active.future;
    listener.dispose();
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
