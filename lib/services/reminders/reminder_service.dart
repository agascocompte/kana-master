import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:kana_master/di/dependency_injector.dart';
import 'package:kana_master/domain/repositories/score_repository.dart';
import 'package:kana_master/domain/repositories/settings_repository.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/router/router.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// Daily practice reminder, shown at [reminderHour] only on days without
/// practice.
///
/// Everything is local: every time the user practices, the pending reminders
/// are replaced by new ones for the following days, so a reminder never fires
/// on a day with practice. Reminders stop [daysAfterLastPractice] days after
/// the last practice.
class ReminderService {
  ReminderService._();

  static final ReminderService instance = ReminderService._();

  static const int reminderHour = 19;
  static const int daysAfterLastPractice = 3;
  static const int _debugId = 99;

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  bool _ready = false;

  /// Last practice day the pending reminders were scheduled for.
  DateTime? _scheduledFor;

  SettingsRepository get _settings => sl<SettingsRepository>();

  Future<void> initialize() async {
    try {
      tz_data.initializeTimeZones();
      try {
        final zone = await FlutterTimezone.getLocalTimezone();
        tz.setLocalLocation(tz.getLocation(zone.identifier));
      } catch (e) {
        debugPrint('Reminder: unknown time zone, using UTC: $e');
      }
      await _plugin.initialize(
        settings: const InitializationSettings(
          android: AndroidInitializationSettings('ic_notification'),
          iOS: DarwinInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
          ),
        ),
        onDidReceiveNotificationResponse: (_) => _openPractice(),
      );
      _ready = true;
      final launch = await _plugin.getNotificationAppLaunchDetails();
      if (launch?.didNotificationLaunchApp ?? false) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _openPractice());
      }
    } catch (e) {
      debugPrint('Reminder: initialization failed: $e');
    }
  }

  /// Whether reminders are on and the system lets them through.
  Future<bool> isEnabled() async {
    if (!await _settings.getReminderEnabled()) return false;
    if (!_ready || !await _settings.getReminderPermissionAsked()) return true;
    return await _hasPermission();
  }

  /// Asks for the notification permission after the first finished session.
  /// Returns true if it was asked now, so the caller can skip the ad.
  Future<bool> askPermissionOnce() async {
    if (!_ready || await _settings.getReminderPermissionAsked()) return false;
    await _settings.saveReminderPermissionAsked();
    if (!await _settings.getReminderEnabled()) return false;
    if (!await _requestPermission()) {
      await _settings.saveReminderEnabled(false);
    }
    await reschedule(force: true);
    return true;
  }

  /// Turns reminders on or off from Settings. Returns false if they can't be
  /// turned on because the system blocks notifications for the app.
  Future<bool> setEnabled(bool enabled) async {
    if (enabled && _ready) {
      await _settings.saveReminderPermissionAsked();
      if (!await _requestPermission()) return false;
    }
    await _settings.saveReminderEnabled(enabled);
    await reschedule(force: true);
    return true;
  }

  Future<void> openSystemSettings() async {
    if (!_ready) return;
    await _plugin.openAppNotificationSettings();
  }

  /// Replaces the pending reminders according to the last practice day.
  /// Without [force], does nothing if they are already scheduled for it, so
  /// it is cheap to call after every answer.
  Future<void> reschedule({bool force = false}) async {
    if (!_ready) return;
    try {
      final streak = await sl<ScoreRepository>().getOverallStreak();
      final DateTime? lastDay = streak.lastDay;
      if (!force && lastDay != null && lastDay == _scheduledFor) return;
      _scheduledFor = lastDay;
      await _plugin.cancelAll();
      if (lastDay == null || !await _settings.getReminderEnabled()) return;

      final now = tz.TZDateTime.now(tz.local);
      for (int gap = 1; gap <= daysAfterLastPractice; gap++) {
        final at = tz.TZDateTime(tz.local, lastDay.year, lastDay.month,
            lastDay.day + gap, reminderHour);
        if (!at.isAfter(now)) continue;
        final message = _message(gap, streak.days);
        await _plugin.zonedSchedule(
          id: gap,
          scheduledDate: at,
          title: message.title,
          body: message.body,
          notificationDetails: _details(),
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        );
      }
    } catch (e) {
      debugPrint('Reminder: scheduling failed: $e');
    }
  }

  /// Debug only: shows tomorrow's reminder in a few seconds.
  Future<void> scheduleDebugReminder() async {
    if (!_ready) return;
    final streak = await sl<ScoreRepository>().getOverallStreak();
    final message = _message(1, streak.days);
    await _plugin.zonedSchedule(
      id: _debugId,
      scheduledDate:
          tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
      title: message.title,
      body: message.body,
      notificationDetails: _details(),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  /// Text for the reminder sent [gap] days after the last practice, when the
  /// streak up to that day was [streakDays].
  ({String title, String body}) _message(int gap, int streakDays) {
    if (gap == 1 && streakDays >= 2) {
      return (
        title: t.app.reminderStreakTitle,
        body: t.app.reminderStreakBody(days: streakDays),
      );
    }
    if (gap == 1) {
      return (
        title: t.app.reminderSecondDayTitle,
        body: t.app.reminderSecondDayBody,
      );
    }
    if (gap == 2) {
      return (
        title: t.app.reminderComebackTitle,
        body: t.app.reminderComebackBody,
      );
    }
    return (title: t.app.reminderLastTitle, body: t.app.reminderLastBody);
  }

  NotificationDetails _details() {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_reminder',
        t.app.reminderChannelName,
        channelDescription: t.app.reminderChannelDescription,
        icon: 'ic_notification',
        color: const Color(0xFFB85C45),
        // Gone before the next day's reminder, so they don't pile up.
        timeoutAfter: const Duration(hours: 20).inMilliseconds,
      ),
      iOS: const DarwinNotificationDetails(),
    );
  }

  Future<bool> _requestPermission() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      final android = _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      if (await android?.areNotificationsEnabled() ?? false) return true;
      return await android?.requestNotificationsPermission() ?? false;
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return await _plugin
              .resolvePlatformSpecificImplementation<
                  IOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(alert: true, sound: true) ??
          false;
    }
    return false;
  }

  Future<bool> _hasPermission() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return await _plugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final options = await _plugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.checkPermissions();
      return options?.isEnabled ?? false;
    }
    return false;
  }

  void _openPractice() {
    final router = AppRouter.router;
    if (router.state.matchedLocation == AppRouter.practiceRoute) return;
    router.push(AppRouter.practiceRoute);
  }
}
