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
	@override String get studyHubTitle => 'Lernhub';
	@override String get studyHubSubtitle => 'Wähle eine Schrift und leg los.';
	@override String get paths => 'Pfade';
	@override String get script => 'Schrift';
	@override String get difficulty => 'Level';
	@override String get difficultyEasy => 'Leicht';
	@override String get difficultyMedium => 'Mittel';
	@override String get difficultyHard => 'Schwer';
	@override String get difficultyEasyDesc => 'Auswahl';
	@override String get difficultyMediumDesc => 'Text';
	@override String get difficultyHardDesc => 'Zeichnen';
	@override String get learn => 'Lernen';
	@override String get learnSubtitle => 'Zeichen entdecken und Striche üben.';
	@override String get practice => 'Üben';
	@override String get practiceSubtitle => 'Erkennen, schreiben, zeichnen.';
	@override String get materials => 'Material';
	@override String get materialsSubtitle => 'Eigene CSV importieren.';
	@override String get dictionary => 'Lexikon';
	@override String get dictionarySubtitle => 'Wörter, Kana und Bedeutungen finden.';
	@override String get statistics => 'Stats';
	@override String get statisticsSubtitle => 'Genauigkeit, Serie und Tempo.';
	@override String get settings => 'Optionen';
	@override String get learningDefaults => 'Lernoptionen';
	@override String get testDifficulty => 'Test-Level';
	@override String get testDifficultySubtitle => 'Schwierigkeit fürs Üben wählen.';
	@override String get importCsv => 'CSV importieren';
	@override String get expectedFormatTitle => 'Format';
	@override String get expectedFormatBody => 'Empfohlene Spalten:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nJede Spalte kann Frage oder Antwort sein. CSV mit Kommas getrennt.';
	@override String fileLabel({required Object name, required Object count}) => 'Datei: ${name} (${count})';
	@override String get askWith => 'Frage mit';
	@override String get answerWith => 'Antwort mit';
	@override String get newQuestion => 'Neue Frage';
	@override String get checkAnswer => 'Prüfen';
	@override String get materialsEmpty => 'CSV importieren und "Neue Frage" drücken.';
	@override String get showAnswer => 'Antwort zeigen';
	@override String answerPrefix({required Object answer}) => 'Antwort: ${answer}';
	@override String get beginSession => 'Start';
	@override String get practiceStartSubtitle => 'Neue Runde starten.';
	@override String get testStayFocused => 'Fokus halten und senden.';
	@override String get testSketchHint => 'Im Feld zeichnen';
	@override String get testTypeRomaji => 'Romaji eingeben';
	@override String get testTypeMeaning => 'Bedeutung eingeben';
	@override String get testRomajiLabel => 'Romaji';
	@override String get testMeaningLabel => 'Bedeutung (ES)';
	@override String get testTapToType => 'Tippen zum Schreiben';
	@override String testDrawThe({required Object script}) => '${script} zeichnen';
	@override String testWhichIs({required Object script}) => 'Welches ${script}?';
	@override String get testKanjiMeaning => 'Kanji-Bedeutung?';
	@override String get statsNoDataTitle => 'Keine Stats';
	@override String get statsNoDataSubtitle => 'Tests machen, um Stats zu sehen.';
	@override String get statsReset => 'Stats löschen';
	@override String get statsActivity => 'Aktivität';
	@override String get statsActivitySubtitle => 'Letzte 14 Tage';
	@override String get statsEvolution => 'Trend';
	@override String get statsEvolutionSubtitle => 'Richtig vs falsch';
	@override String get statsNoEvolution => 'Keine Daten.';
	@override String get statsNoActivity => 'Noch keine Aktivität.';
	@override String get statsAccuracy => 'Trefferquote';
	@override String get statsStreak => 'Serie';
	@override String get statsLast7 => '7 Tage';
	@override String get statsLast30 => '30 Tage';
	@override String get statsSessions => 'Sessions';
	@override String statsBest({required Object days}) => 'Beste ${days} Tage';
	@override String statsCorrect({required Object correct, required Object total}) => '${correct}/${total} richtig';
	@override String get statsCorrectLabel => 'Richtig';
	@override String get statsIncorrectLabel => 'Falsch';
	@override String get statsMomentum => 'Momentum';
	@override String get statsView => 'Stats ansehen';
	@override String get statsStartToUnlock => 'Übung starten, um Stats zu sehen.';
	@override String get dictionaryEmpty => 'Wort suchen…';
	@override String get searchHint => 'Wort, Kana, Romaji…';
	@override String get correct => 'Richtig!';
	@override String get incorrect => 'Falsch';
	@override String get oops => 'Ups…';
	@override String errorImporting({required Object error}) => 'Importfehler: ${error}';
	@override String importedEntries({required Object count, required Object file}) => '${count} Einträge aus ${file}';
	@override String get noValidRows => 'Keine gültigen Zeilen.';
	@override String get dataNotFound => 'Keine CSV-Daten.';
	@override String get materialsNeedImport => 'CSV importieren und Spalten wählen.';
	@override String get materialsNeedStart => 'Erst eine Frage starten.';
	@override String get language => 'Sprache';
	@override String get languageSubtitle => 'App-Sprache wählen.';
	@override String get back => 'Zurück';
	@override String get ok => 'OK';
	@override String get yourAnswer => 'Deine Antwort';
	@override String statsStreakDays({required Object days}) => '${days}-Tage-Serie';
	@override String get statsAttempts => 'Versuche';
	@override String get scriptHiragana => 'Hiragana';
	@override String get scriptKatakana => 'Katakana';
	@override String get scriptKanji => 'Kanji';
	@override String get testModeDrawing => 'Zeichnen';
	@override String get testModeQuiz => 'Quiz';
	@override String get dictionaryNotes => 'Notizen';
	@override String get dictionarySeeAlso => 'Siehe auch';
	@override String get confirmActionTitle => 'Bestätigen';
	@override String get confirmActionBody => 'Alle Statistiken wirklich löschen?';
	@override String get cancel => 'Abbrechen';
	@override String get delete => 'Löschen';
	@override String get searchByMeaning => 'Nach Bedeutung';
	@override String get filterAll => 'Alle';
	@override String get tabStudy => 'Lernen';
	@override String get tabStats => 'Stats';
	@override String get settingsHapticsTitle => 'Vibration';
	@override String get settingsHapticsSubtitle => 'Vibriert bei richtig/falsch.';
	@override String get settingsKanaSizeTitle => 'Kana-Größe';
	@override String get settingsKanaSizeSubtitle => 'Größe der Kana anpassen.';
	@override String settingsKanaSizeValue({required Object value}) => '${value}x';
	@override String get settingsKanjiJlptTitle => 'JLPT-Level';
	@override String get settingsKanjiJlptSubtitle => 'Kanji nach JLPT filtern.';
	@override String get settingsUseModelHiraganaTitle => 'KI Hiragana';
	@override String get settingsUseModelHiraganaSubtitle => 'KI-Erkennung beim Zeichnen.';
	@override String get settingsUseModelKatakanaTitle => 'KI Katakana';
	@override String get settingsUseModelKatakanaSubtitle => 'KI-Erkennung beim Zeichnen.';
	@override String get settingsUseModelKanjiTitle => 'KI Kanji';
	@override String get settingsUseModelKanjiSubtitle => 'KI-Erkennung beim Zeichnen.';
	@override String get kanjiFilterEmpty => 'Keine Kanji für dieses JLPT-Level.';
	@override String get settingsBackupTitle => 'Backup';
	@override String get settingsBackupSubtitle => 'Fortschritt als JSON exportieren/importieren.';
	@override String get settingsBackupExportButton => 'Export';
	@override String get settingsBackupImportButton => 'Import';
	@override String settingsBackupExported({required Object path}) => 'Exportiert: ${path}';
	@override String settingsBackupImported({required Object count}) => '${count} Antworten importiert';
	@override String settingsBackupError({required Object error}) => 'Backup-Fehler: ${error}';
	@override String get settingsGeneralSection => 'Allgemein';
	@override String get settingsAiModelsSection => 'KI-Modelle';
	@override String get settingsKanjiFilterSection => 'Kanji';
	@override String get settingsDataSection => 'Daten';
	@override String get testGuideShow => 'Guide zeigen';
	@override String get testGuideHide => 'Guide aus';
	@override String get testReportDrawing => 'Zeichnung melden';
	@override String get testReportConfirmBody => 'Möchtest du diesen Bericht jetzt senden?';
	@override String get testReportThanks => 'Danke! Bericht erstellt.';
	@override String get testReportError => 'Bericht fehlgeschlagen.';
	@override String get testKanjiTraceHint => 'Strichfolge folgen. Guide aktivieren wenn nötig.';
	@override String get aiInfoTitle => 'KI-Modelle beim Zeichnen';
	@override String get aiInfoLine1 => 'KI-Erkennung kann gelegentlich fehlschlagen.';
	@override String get aiInfoLine2 => 'Falls sie fehlschlägt, deaktiviere das Modell zur Verwendung einer auf Strichen basierenden Bewertung.';
	@override String get aiInfoLine3 => 'Du kannst falsche Negativwerte melden, um uns bei der Verbesserung zu helfen.';
	@override String get premiumSectionTitle => 'Premium';
	@override String get premiumSectionSubtitle => 'Schalte alle Funktionen frei und entferne Interstitial-Anzeigen.';
	@override String get premiumOpenButton => 'Freischalten';
	@override String get premiumLockedMessage => 'Premium-Funktion. Freischalten, um sie zu nutzen.';
	@override String get premiumTitle => 'Kana Master Premium';
	@override String get premiumSubtitle => 'Einmaliger Kauf, alle Funktionen freigeschaltet.';
	@override String get premiumHeroTitle => 'Lernen ohne Grenzen';
	@override String get premiumHeroBody => 'Hol dir das volle Erlebnis und unterstütze das Projekt.';
	@override String get premiumBenefitNoAds => 'Keine Interstitial-Anzeigen';
	@override String get premiumBenefitMaterials => 'Zugang zum Material-Modus';
	@override String get premiumBenefitHard => 'Schwierigkeit „Schwer“ freischalten';
	@override String get premiumBenefitAi => 'KI-Modelloptionen aktivieren';
	@override String get premiumBenefitBackup => 'Statistiken exportieren/importieren';
	@override String premiumBuyButton({required Object price}) => 'Kaufen für ${price}';
	@override String get premiumRestoreButton => 'Käufe wiederherstellen';
	@override String get premiumOwnedBadge => 'Premium freigeschaltet';
	@override String get premiumStoreUnavailable => 'Store nicht verfügbar. Später erneut versuchen.';
	@override String premiumPurchaseError({required Object error}) => 'Kauf fehlgeschlagen: ${error}';
	@override String get premiumPurchased => 'Kauf abgeschlossen. Premium freigeschaltet.';
	@override String get premiumRestored => 'Käufe wiederhergestellt.';
}

/// The flat map containing all translations for locale <de>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsDe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.studyHubTitle' => 'Lernhub',
			'app.studyHubSubtitle' => 'Wähle eine Schrift und leg los.',
			'app.paths' => 'Pfade',
			'app.script' => 'Schrift',
			'app.difficulty' => 'Level',
			'app.difficultyEasy' => 'Leicht',
			'app.difficultyMedium' => 'Mittel',
			'app.difficultyHard' => 'Schwer',
			'app.difficultyEasyDesc' => 'Auswahl',
			'app.difficultyMediumDesc' => 'Text',
			'app.difficultyHardDesc' => 'Zeichnen',
			'app.learn' => 'Lernen',
			'app.learnSubtitle' => 'Zeichen entdecken und Striche üben.',
			'app.practice' => 'Üben',
			'app.practiceSubtitle' => 'Erkennen, schreiben, zeichnen.',
			'app.materials' => 'Material',
			'app.materialsSubtitle' => 'Eigene CSV importieren.',
			'app.dictionary' => 'Lexikon',
			'app.dictionarySubtitle' => 'Wörter, Kana und Bedeutungen finden.',
			'app.statistics' => 'Stats',
			'app.statisticsSubtitle' => 'Genauigkeit, Serie und Tempo.',
			'app.settings' => 'Optionen',
			'app.learningDefaults' => 'Lernoptionen',
			'app.testDifficulty' => 'Test-Level',
			'app.testDifficultySubtitle' => 'Schwierigkeit fürs Üben wählen.',
			'app.importCsv' => 'CSV importieren',
			'app.expectedFormatTitle' => 'Format',
			'app.expectedFormatBody' => 'Empfohlene Spalten:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nJede Spalte kann Frage oder Antwort sein. CSV mit Kommas getrennt.',
			'app.fileLabel' => ({required Object name, required Object count}) => 'Datei: ${name} (${count})',
			'app.askWith' => 'Frage mit',
			'app.answerWith' => 'Antwort mit',
			'app.newQuestion' => 'Neue Frage',
			'app.checkAnswer' => 'Prüfen',
			'app.materialsEmpty' => 'CSV importieren und "Neue Frage" drücken.',
			'app.showAnswer' => 'Antwort zeigen',
			'app.answerPrefix' => ({required Object answer}) => 'Antwort: ${answer}',
			'app.beginSession' => 'Start',
			'app.practiceStartSubtitle' => 'Neue Runde starten.',
			'app.testStayFocused' => 'Fokus halten und senden.',
			'app.testSketchHint' => 'Im Feld zeichnen',
			'app.testTypeRomaji' => 'Romaji eingeben',
			'app.testTypeMeaning' => 'Bedeutung eingeben',
			'app.testRomajiLabel' => 'Romaji',
			'app.testMeaningLabel' => 'Bedeutung (ES)',
			'app.testTapToType' => 'Tippen zum Schreiben',
			'app.testDrawThe' => ({required Object script}) => '${script} zeichnen',
			'app.testWhichIs' => ({required Object script}) => 'Welches ${script}?',
			'app.testKanjiMeaning' => 'Kanji-Bedeutung?',
			'app.statsNoDataTitle' => 'Keine Stats',
			'app.statsNoDataSubtitle' => 'Tests machen, um Stats zu sehen.',
			'app.statsReset' => 'Stats löschen',
			'app.statsActivity' => 'Aktivität',
			'app.statsActivitySubtitle' => 'Letzte 14 Tage',
			'app.statsEvolution' => 'Trend',
			'app.statsEvolutionSubtitle' => 'Richtig vs falsch',
			'app.statsNoEvolution' => 'Keine Daten.',
			'app.statsNoActivity' => 'Noch keine Aktivität.',
			'app.statsAccuracy' => 'Trefferquote',
			'app.statsStreak' => 'Serie',
			'app.statsLast7' => '7 Tage',
			'app.statsLast30' => '30 Tage',
			'app.statsSessions' => 'Sessions',
			'app.statsBest' => ({required Object days}) => 'Beste ${days} Tage',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct}/${total} richtig',
			'app.statsCorrectLabel' => 'Richtig',
			'app.statsIncorrectLabel' => 'Falsch',
			'app.statsMomentum' => 'Momentum',
			'app.statsView' => 'Stats ansehen',
			'app.statsStartToUnlock' => 'Übung starten, um Stats zu sehen.',
			'app.dictionaryEmpty' => 'Wort suchen…',
			'app.searchHint' => 'Wort, Kana, Romaji…',
			'app.correct' => 'Richtig!',
			'app.incorrect' => 'Falsch',
			'app.oops' => 'Ups…',
			'app.errorImporting' => ({required Object error}) => 'Importfehler: ${error}',
			'app.importedEntries' => ({required Object count, required Object file}) => '${count} Einträge aus ${file}',
			'app.noValidRows' => 'Keine gültigen Zeilen.',
			'app.dataNotFound' => 'Keine CSV-Daten.',
			'app.materialsNeedImport' => 'CSV importieren und Spalten wählen.',
			'app.materialsNeedStart' => 'Erst eine Frage starten.',
			'app.language' => 'Sprache',
			'app.languageSubtitle' => 'App-Sprache wählen.',
			'app.back' => 'Zurück',
			'app.ok' => 'OK',
			'app.yourAnswer' => 'Deine Antwort',
			'app.statsStreakDays' => ({required Object days}) => '${days}-Tage-Serie',
			'app.statsAttempts' => 'Versuche',
			'app.scriptHiragana' => 'Hiragana',
			'app.scriptKatakana' => 'Katakana',
			'app.scriptKanji' => 'Kanji',
			'app.testModeDrawing' => 'Zeichnen',
			'app.testModeQuiz' => 'Quiz',
			'app.dictionaryNotes' => 'Notizen',
			'app.dictionarySeeAlso' => 'Siehe auch',
			'app.confirmActionTitle' => 'Bestätigen',
			'app.confirmActionBody' => 'Alle Statistiken wirklich löschen?',
			'app.cancel' => 'Abbrechen',
			'app.delete' => 'Löschen',
			'app.searchByMeaning' => 'Nach Bedeutung',
			'app.filterAll' => 'Alle',
			'app.tabStudy' => 'Lernen',
			'app.tabStats' => 'Stats',
			'app.settingsHapticsTitle' => 'Vibration',
			'app.settingsHapticsSubtitle' => 'Vibriert bei richtig/falsch.',
			'app.settingsKanaSizeTitle' => 'Kana-Größe',
			'app.settingsKanaSizeSubtitle' => 'Größe der Kana anpassen.',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'JLPT-Level',
			'app.settingsKanjiJlptSubtitle' => 'Kanji nach JLPT filtern.',
			'app.settingsUseModelHiraganaTitle' => 'KI Hiragana',
			'app.settingsUseModelHiraganaSubtitle' => 'KI-Erkennung beim Zeichnen.',
			'app.settingsUseModelKatakanaTitle' => 'KI Katakana',
			'app.settingsUseModelKatakanaSubtitle' => 'KI-Erkennung beim Zeichnen.',
			'app.settingsUseModelKanjiTitle' => 'KI Kanji',
			'app.settingsUseModelKanjiSubtitle' => 'KI-Erkennung beim Zeichnen.',
			'app.kanjiFilterEmpty' => 'Keine Kanji für dieses JLPT-Level.',
			'app.settingsBackupTitle' => 'Backup',
			'app.settingsBackupSubtitle' => 'Fortschritt als JSON exportieren/importieren.',
			'app.settingsBackupExportButton' => 'Export',
			'app.settingsBackupImportButton' => 'Import',
			'app.settingsBackupExported' => ({required Object path}) => 'Exportiert: ${path}',
			'app.settingsBackupImported' => ({required Object count}) => '${count} Antworten importiert',
			'app.settingsBackupError' => ({required Object error}) => 'Backup-Fehler: ${error}',
			'app.settingsGeneralSection' => 'Allgemein',
			'app.settingsAiModelsSection' => 'KI-Modelle',
			'app.settingsKanjiFilterSection' => 'Kanji',
			'app.settingsDataSection' => 'Daten',
			'app.testGuideShow' => 'Guide zeigen',
			'app.testGuideHide' => 'Guide aus',
			'app.testReportDrawing' => 'Zeichnung melden',
			'app.testReportConfirmBody' => 'Möchtest du diesen Bericht jetzt senden?',
			'app.testReportThanks' => 'Danke! Bericht erstellt.',
			'app.testReportError' => 'Bericht fehlgeschlagen.',
			'app.testKanjiTraceHint' => 'Strichfolge folgen. Guide aktivieren wenn nötig.',
			'app.aiInfoTitle' => 'KI-Modelle beim Zeichnen',
			'app.aiInfoLine1' => 'KI-Erkennung kann gelegentlich fehlschlagen.',
			'app.aiInfoLine2' => 'Falls sie fehlschlägt, deaktiviere das Modell zur Verwendung einer auf Strichen basierenden Bewertung.',
			'app.aiInfoLine3' => 'Du kannst falsche Negativwerte melden, um uns bei der Verbesserung zu helfen.',
			'app.premiumSectionTitle' => 'Premium',
			'app.premiumSectionSubtitle' => 'Schalte alle Funktionen frei und entferne Interstitial-Anzeigen.',
			'app.premiumOpenButton' => 'Freischalten',
			'app.premiumLockedMessage' => 'Premium-Funktion. Freischalten, um sie zu nutzen.',
			'app.premiumTitle' => 'Kana Master Premium',
			'app.premiumSubtitle' => 'Einmaliger Kauf, alle Funktionen freigeschaltet.',
			'app.premiumHeroTitle' => 'Lernen ohne Grenzen',
			'app.premiumHeroBody' => 'Hol dir das volle Erlebnis und unterstütze das Projekt.',
			'app.premiumBenefitNoAds' => 'Keine Interstitial-Anzeigen',
			'app.premiumBenefitMaterials' => 'Zugang zum Material-Modus',
			'app.premiumBenefitHard' => 'Schwierigkeit „Schwer“ freischalten',
			'app.premiumBenefitAi' => 'KI-Modelloptionen aktivieren',
			'app.premiumBenefitBackup' => 'Statistiken exportieren/importieren',
			'app.premiumBuyButton' => ({required Object price}) => 'Kaufen für ${price}',
			'app.premiumRestoreButton' => 'Käufe wiederherstellen',
			'app.premiumOwnedBadge' => 'Premium freigeschaltet',
			'app.premiumStoreUnavailable' => 'Store nicht verfügbar. Später erneut versuchen.',
			'app.premiumPurchaseError' => ({required Object error}) => 'Kauf fehlgeschlagen: ${error}',
			'app.premiumPurchased' => 'Kauf abgeschlossen. Premium freigeschaltet.',
			'app.premiumRestored' => 'Käufe wiederhergestellt.',
			_ => null,
		};
	}
}
