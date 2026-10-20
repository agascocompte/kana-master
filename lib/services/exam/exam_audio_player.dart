import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

/// Plays the bundled listening recordings one after another.
abstract class ExamAudioPlayer {
  /// Plays [asset] and completes when it ends, is stopped or fails.
  Future<void> play(String asset);

  Future<void> pause();

  Future<void> resume();

  Future<void> stop();

  Future<void> dispose();
}

class JustAudioExamPlayer implements ExamAudioPlayer {
  final AudioPlayer _player = AudioPlayer();
  bool _sessionReady = false;
  Completer<void>? _current;
  StreamSubscription<PlayerState>? _subscription;

  Future<void> _prepareSession() async {
    if (_sessionReady) return;
    _sessionReady = true;
    // Playback category, so the recording is heard with the silent switch on.
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
  }

  @override
  Future<void> play(String asset) async {
    await _prepareSession();
    await _finishCurrent();
    final done = Completer<void>();
    _current = done;
    try {
      await _player.setAsset(asset);
    } catch (e) {
      debugPrint('Exam audio $asset could not be loaded: $e');
      _finishCurrent();
      return;
    }
    _subscription = _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _finishCurrent();
      }
    });
    unawaited(_player.play());
    return done.future;
  }

  Future<void> _finishCurrent() async {
    await _subscription?.cancel();
    _subscription = null;
    final current = _current;
    _current = null;
    if (current != null && !current.isCompleted) current.complete();
  }

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> resume() async {
    if (_current != null) unawaited(_player.play());
  }

  @override
  Future<void> stop() async {
    await _player.stop();
    await _finishCurrent();
  }

  @override
  Future<void> dispose() async {
    await stop();
    await _player.dispose();
  }
}
