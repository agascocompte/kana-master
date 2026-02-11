///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsDe with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsDe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsDe _root = this; // ignore: unused_field

	@override 
	TranslationsDe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDe(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppDe app = _TranslationsAppDe._(_root);
}

// Path: app
class _TranslationsAppDe implements TranslationsAppEn {
	_TranslationsAppDe._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get studyHubTitle => 'Lernzentrum';
	@override String get studyHubSubtitle => 'Wähle deine Schrift und beginne zu lernen oder zu üben.';
	@override String get paths => 'Pfade';
	@override String get script => 'Schrift';
	@override String get difficulty => 'Schwierigkeit';
	@override String get difficultyEasy => 'Leicht';
	@override String get difficultyMedium => 'Mittel';
	@override String get difficultyHard => 'Schwer';
	@override String get difficultyEasyDesc => 'Einzelauswahl';
	@override String get difficultyMediumDesc => 'Texteingabe';
	@override String get difficultyHardDesc => 'Zeichnen';
	@override String get learn => 'Lernen';
	@override String get learnSubtitle => 'Erkunde Zeichen und Strichhinweise.';
	@override String get practice => 'Üben';
	@override String get practiceSubtitle => 'Erkennung, Schreiben und Zeichnen.';
	@override String get materials => 'Materialien';
	@override String get materialsSubtitle => 'Importiere eine CSV umit Ihren eigenen Daten.';
	@override String get dictionary => 'Wörterbuch';
	@override String get dictionarySubtitle => 'Suche sofort nach Wörtern, Kana und Bedeutungen.';
	@override String get statistics => 'Statistiken';
	@override String get statisticsSubtitle => 'Konsistenz, Genauigkeit und Tempo nach Kana-Typ.';
	@override String get settings => 'Einstellungen';
	@override String get learningDefaults => 'Lernpräferenzen';
	@override String get testDifficulty => 'Testschwierigkeit';
	@override String get testDifficultySubtitle => 'Wähle die Schwierigkeit für Übungen.';
	@override String get importCsv => 'CSV importieren';
	@override String get expectedFormatTitle => 'Erwartetes Format';
	@override String get expectedFormatBody => 'Empfohlene Überschriften:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nDu kannst jede Spalte als Frage oder Antwort zuordnen. CSV durch Kommas getrennt.';
	@override String fileLabel({required Object name, required Object count}) => 'Datei: ${name} (${count} Zeilen)';
	@override String get askWith => 'Fragen mit';
	@override String get answerWith => 'Antworten mit';
	@override String get newQuestion => 'Neue Frage';
	@override String get checkAnswer => 'Überprüfen';
	@override String get materialsEmpty => 'Importiere eine CSV und drücke „Neue Frage“, um zu starten.';
	@override String get showAnswer => 'Antwort anzeigen';
	@override String answerPrefix({required Object answer}) => 'Antwort: ${answer}';
	@override String get beginSession => 'Sitzung starten';
	@override String get practiceStartSubtitle => 'Starte eine neue Runde und halte deine Serie.';
	@override String get testStayFocused => 'Konzentriere dich und sende ab, wenn du bereit bist.';
	@override String get testSketchHint => 'Zeichne innerhalb der Leinwand';
	@override String get testTypeRomaji => 'Romaji eingeben';
	@override String get testTypeMeaning => 'Bedeutung eingeben';
	@override String get testRomajiLabel => 'Romaji-Lesung';
	@override String get testMeaningLabel => 'Bedeutung auf Spanisch';
	@override String get testTapToType => 'Tippen zum Schreiben';
	@override String testDrawThe({required Object script}) => 'Zeichne das ${script}';
	@override String testWhichIs({required Object script}) => 'Welches ist dieses ${script}?';
	@override String get testKanjiMeaning => 'Bedeutung dieses Kanji?';
	@override String get statsNoDataTitle => 'Keine Statistiken';
	@override String get statsNoDataSubtitle => 'Schließe einige Tests ab, um Serien und Grafiken freizuschalten.';
	@override String get statsReset => 'Statistiken zurücksetzen';
	@override String get statsActivity => 'Tägliche Aktivität';
	@override String get statsActivitySubtitle => 'Letzte 14 Tage';
	@override String get statsEvolution => 'Entwicklung';
	@override String get statsEvolutionSubtitle => 'Richtig vs falsch';
	@override String get statsNoEvolution => 'Keine Entwicklungsdaten.';
	@override String get statsNoActivity => 'Noch keine Aktivität.';
	@override String get statsAccuracy => 'Genauigkeit';
	@override String get statsStreak => 'Serie';
	@override String get statsLast7 => 'Letzte 7 Tage';
	@override String get statsLast30 => 'Letzte 30 Tage';
	@override String get statsSessions => 'Sitzungen';
	@override String statsBest({required Object days}) => 'Beste ${days} Tage';
	@override String statsCorrect({required Object correct, required Object total}) => '${correct} / ${total} korrekt';
	@override String get statsCorrectLabel => 'Richtig';
	@override String get statsIncorrectLabel => 'Falsch';
	@override String get statsMomentum => 'Momentum';
	@override String get statsView => 'Statistiken ansehen';
	@override String get statsStartToUnlock => 'Starte eine Übung, um deine Statistiken freizuschalten.';
	@override String get dictionaryEmpty => 'Beginne mit der Suche nach einem Wort.';
	@override String get searchHint => 'Wort, Kana, Romaji suchen...';
	@override String get correct => 'Richtig!';
	@override String get incorrect => 'Falsche Antwort';
	@override String get oops => 'Ups, Fehler...';
	@override String errorImporting({required Object error}) => 'Fehler beim Importieren: ${error}';
	@override String importedEntries({required Object count, required Object file}) => '${count} Einträge aus ${file} importiert';
	@override String get noValidRows => 'Keine gültigen Zeilen gefunden.';
	@override String get dataNotFound => 'Keine Daten in der CSV.';
	@override String get materialsNeedImport => 'Importiere eine CSV und wähle Spalten, bevor du übst.';
	@override String get materialsNeedStart => 'Starte zuerst eine Frage mit deinem Material.';
	@override String get language => 'Sprache';
	@override String get languageSubtitle => 'Wähle die App-Sprache.';
	@override String get back => 'Zurück';
	@override String get ok => 'OK';
	@override String get yourAnswer => 'Deine Antwort';
	@override String statsStreakDays({required Object days}) => 'Serie von ${days} Tagen';
	@override String get statsAttempts => 'Versuche';
	@override String get scriptHiragana => 'Hiragana';
	@override String get scriptKatakana => 'Katakana';
	@override String get scriptKanji => 'Kanji';
	@override String get testModeDrawing => 'Zeichnen';
	@override String get testModeQuiz => 'Quiz';
	@override String get dictionaryNotes => 'Notizen';
	@override String get dictionarySeeAlso => 'Siehe auch';
	@override String get confirmActionTitle => 'Aktion bestätigen';
	@override String get confirmActionBody => 'Möchtest du wirklich ALLE Statistiken löschen?';
	@override String get cancel => 'Abbrechen';
	@override String get delete => 'Löschen';
	@override String get searchByMeaning => 'Nach Bedeutung suchen';
	@override String get filterAll => 'Alle';
	@override String get tabStudy => 'Studium';
	@override String get tabStats => 'Statistiken';
	@override String get settingsHapticsTitle => 'Vibration';
	@override String get settingsHapticsSubtitle => 'Vibriert bei richtiger oder falscher Antwort.';
	@override String get settingsKanaSizeTitle => 'Kana-Größe';
	@override String get settingsKanaSizeSubtitle => 'Passe die Größe der Kana in der Oberfläche an.';
	@override String settingsKanaSizeValue({required Object value}) => '${value}x';
	@override String get settingsKanjiJlptTitle => 'JLPT-Kanji-Level';
	@override String get settingsKanjiJlptSubtitle => 'Begrenze die Kanji auf ein JLPT-Level.';
	@override String get kanjiFilterEmpty => 'Keine Kanji für dieses JLPT-Level.';
	@override String get settingsBackupTitle => 'Statistik-Sicherung';
	@override String get settingsBackupSubtitle => 'Exportiere oder importiere deinen Fortschritt als JSON-Datei.';
	@override String get settingsBackupExportButton => 'Exportieren';
	@override String get settingsBackupImportButton => 'Importieren';
	@override String settingsBackupExported({required Object path}) => 'Sicherung exportiert nach ${path}';
	@override String settingsBackupImported({required Object count}) => 'Importiert ${count} Antworten';
	@override String settingsBackupError({required Object error}) => 'Sicherungsfehler: ${error}';
}

/// The flat map containing all translations for locale <de>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsDe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.studyHubTitle' => 'Lernzentrum',
			'app.studyHubSubtitle' => 'Wähle deine Schrift und beginne zu lernen oder zu üben.',
			'app.paths' => 'Pfade',
			'app.script' => 'Schrift',
			'app.difficulty' => 'Schwierigkeit',
			'app.difficultyEasy' => 'Leicht',
			'app.difficultyMedium' => 'Mittel',
			'app.difficultyHard' => 'Schwer',
			'app.difficultyEasyDesc' => 'Einzelauswahl',
			'app.difficultyMediumDesc' => 'Texteingabe',
			'app.difficultyHardDesc' => 'Zeichnen',
			'app.learn' => 'Lernen',
			'app.learnSubtitle' => 'Erkunde Zeichen und Strichhinweise.',
			'app.practice' => 'Üben',
			'app.practiceSubtitle' => 'Erkennung, Schreiben und Zeichnen.',
			'app.materials' => 'Materialien',
			'app.materialsSubtitle' => 'Importiere eine CSV umit Ihren eigenen Daten.',
			'app.dictionary' => 'Wörterbuch',
			'app.dictionarySubtitle' => 'Suche sofort nach Wörtern, Kana und Bedeutungen.',
			'app.statistics' => 'Statistiken',
			'app.statisticsSubtitle' => 'Konsistenz, Genauigkeit und Tempo nach Kana-Typ.',
			'app.settings' => 'Einstellungen',
			'app.learningDefaults' => 'Lernpräferenzen',
			'app.testDifficulty' => 'Testschwierigkeit',
			'app.testDifficultySubtitle' => 'Wähle die Schwierigkeit für Übungen.',
			'app.importCsv' => 'CSV importieren',
			'app.expectedFormatTitle' => 'Erwartetes Format',
			'app.expectedFormatBody' => 'Empfohlene Überschriften:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nDu kannst jede Spalte als Frage oder Antwort zuordnen. CSV durch Kommas getrennt.',
			'app.fileLabel' => ({required Object name, required Object count}) => 'Datei: ${name} (${count} Zeilen)',
			'app.askWith' => 'Fragen mit',
			'app.answerWith' => 'Antworten mit',
			'app.newQuestion' => 'Neue Frage',
			'app.checkAnswer' => 'Überprüfen',
			'app.materialsEmpty' => 'Importiere eine CSV und drücke „Neue Frage“, um zu starten.',
			'app.showAnswer' => 'Antwort anzeigen',
			'app.answerPrefix' => ({required Object answer}) => 'Antwort: ${answer}',
			'app.beginSession' => 'Sitzung starten',
			'app.practiceStartSubtitle' => 'Starte eine neue Runde und halte deine Serie.',
			'app.testStayFocused' => 'Konzentriere dich und sende ab, wenn du bereit bist.',
			'app.testSketchHint' => 'Zeichne innerhalb der Leinwand',
			'app.testTypeRomaji' => 'Romaji eingeben',
			'app.testTypeMeaning' => 'Bedeutung eingeben',
			'app.testRomajiLabel' => 'Romaji-Lesung',
			'app.testMeaningLabel' => 'Bedeutung auf Spanisch',
			'app.testTapToType' => 'Tippen zum Schreiben',
			'app.testDrawThe' => ({required Object script}) => 'Zeichne das ${script}',
			'app.testWhichIs' => ({required Object script}) => 'Welches ist dieses ${script}?',
			'app.testKanjiMeaning' => 'Bedeutung dieses Kanji?',
			'app.statsNoDataTitle' => 'Keine Statistiken',
			'app.statsNoDataSubtitle' => 'Schließe einige Tests ab, um Serien und Grafiken freizuschalten.',
			'app.statsReset' => 'Statistiken zurücksetzen',
			'app.statsActivity' => 'Tägliche Aktivität',
			'app.statsActivitySubtitle' => 'Letzte 14 Tage',
			'app.statsEvolution' => 'Entwicklung',
			'app.statsEvolutionSubtitle' => 'Richtig vs falsch',
			'app.statsNoEvolution' => 'Keine Entwicklungsdaten.',
			'app.statsNoActivity' => 'Noch keine Aktivität.',
			'app.statsAccuracy' => 'Genauigkeit',
			'app.statsStreak' => 'Serie',
			'app.statsLast7' => 'Letzte 7 Tage',
			'app.statsLast30' => 'Letzte 30 Tage',
			'app.statsSessions' => 'Sitzungen',
			'app.statsBest' => ({required Object days}) => 'Beste ${days} Tage',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct} / ${total} korrekt',
			'app.statsCorrectLabel' => 'Richtig',
			'app.statsIncorrectLabel' => 'Falsch',
			'app.statsMomentum' => 'Momentum',
			'app.statsView' => 'Statistiken ansehen',
			'app.statsStartToUnlock' => 'Starte eine Übung, um deine Statistiken freizuschalten.',
			'app.dictionaryEmpty' => 'Beginne mit der Suche nach einem Wort.',
			'app.searchHint' => 'Wort, Kana, Romaji suchen...',
			'app.correct' => 'Richtig!',
			'app.incorrect' => 'Falsche Antwort',
			'app.oops' => 'Ups, Fehler...',
			'app.errorImporting' => ({required Object error}) => 'Fehler beim Importieren: ${error}',
			'app.importedEntries' => ({required Object count, required Object file}) => '${count} Einträge aus ${file} importiert',
			'app.noValidRows' => 'Keine gültigen Zeilen gefunden.',
			'app.dataNotFound' => 'Keine Daten in der CSV.',
			'app.materialsNeedImport' => 'Importiere eine CSV und wähle Spalten, bevor du übst.',
			'app.materialsNeedStart' => 'Starte zuerst eine Frage mit deinem Material.',
			'app.language' => 'Sprache',
			'app.languageSubtitle' => 'Wähle die App-Sprache.',
			'app.back' => 'Zurück',
			'app.ok' => 'OK',
			'app.yourAnswer' => 'Deine Antwort',
			'app.statsStreakDays' => ({required Object days}) => 'Serie von ${days} Tagen',
			'app.statsAttempts' => 'Versuche',
			'app.scriptHiragana' => 'Hiragana',
			'app.scriptKatakana' => 'Katakana',
			'app.scriptKanji' => 'Kanji',
			'app.testModeDrawing' => 'Zeichnen',
			'app.testModeQuiz' => 'Quiz',
			'app.dictionaryNotes' => 'Notizen',
			'app.dictionarySeeAlso' => 'Siehe auch',
			'app.confirmActionTitle' => 'Aktion bestätigen',
			'app.confirmActionBody' => 'Möchtest du wirklich ALLE Statistiken löschen?',
			'app.cancel' => 'Abbrechen',
			'app.delete' => 'Löschen',
			'app.searchByMeaning' => 'Nach Bedeutung suchen',
			'app.filterAll' => 'Alle',
			'app.tabStudy' => 'Studium',
			'app.tabStats' => 'Statistiken',
			'app.settingsHapticsTitle' => 'Vibration',
			'app.settingsHapticsSubtitle' => 'Vibriert bei richtiger oder falscher Antwort.',
			'app.settingsKanaSizeTitle' => 'Kana-Größe',
			'app.settingsKanaSizeSubtitle' => 'Passe die Größe der Kana in der Oberfläche an.',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'JLPT-Kanji-Level',
			'app.settingsKanjiJlptSubtitle' => 'Begrenze die Kanji auf ein JLPT-Level.',
			'app.kanjiFilterEmpty' => 'Keine Kanji für dieses JLPT-Level.',
			'app.settingsBackupTitle' => 'Statistik-Sicherung',
			'app.settingsBackupSubtitle' => 'Exportiere oder importiere deinen Fortschritt als JSON-Datei.',
			'app.settingsBackupExportButton' => 'Exportieren',
			'app.settingsBackupImportButton' => 'Importieren',
			'app.settingsBackupExported' => ({required Object path}) => 'Sicherung exportiert nach ${path}',
			'app.settingsBackupImported' => ({required Object count}) => 'Importiert ${count} Antworten',
			'app.settingsBackupError' => ({required Object error}) => 'Sicherungsfehler: ${error}',
			_ => null,
		};
	}
}
