import 'package:shared_preferences/shared_preferences.dart';

class ScoreRepository {
  static const _correctHiraganaCountKey = 'correctHiraganaCount';
  static const _incorrectHiraganaCountKey = 'incorrectHiraganaCount';

  Future<int> getCorrectHiraganaCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_correctHiraganaCountKey) ?? 0;
  }

  Future<int> getIncorrectHiraganaCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_incorrectHiraganaCountKey) ?? 0;
  }

  Future<void> incrementCorrectHiraganaCount() async {
    final prefs = await SharedPreferences.getInstance();
    final currentCount = prefs.getInt(_correctHiraganaCountKey) ?? 0;
    await prefs.setInt(_correctHiraganaCountKey, currentCount + 1);
  }

  Future<void> incrementIncorrectHiraganaCount() async {
    final prefs = await SharedPreferences.getInstance();
    final currentCount = prefs.getInt(_incorrectHiraganaCountKey) ?? 0;
    await prefs.setInt(_incorrectHiraganaCountKey, currentCount + 1);
  }

  Future<void> resetCorrectHiraganaCount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_correctHiraganaCountKey, 0);
  }

  Future<void> resetIncorrectHiraganaCount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_incorrectHiraganaCountKey, 0);
  }
}
