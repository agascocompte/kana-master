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
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <de>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key);

	late final TranslationsDe _root = this; // ignore: unused_field

	@override 
	TranslationsDe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDe(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$de app = _Translations$app$de._(_root);
	@override late final _Translations$exam$de exam = _Translations$exam$de._(_root);
}

// Path: app
class _Translations$app$de implements Translations$app$en {
	_Translations$app$de._(this._root);

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
	@override String get premiumSectionSubtitle => 'Schalte alle Funktionen frei und entferne Anzeigen.';
	@override String get premiumOpenButton => 'Freischalten';
	@override String get premiumLockedMessage => 'Premium-Funktion. Freischalten, um sie zu nutzen.';
	@override String get premiumTitle => 'KanaGo Premium';
	@override String get premiumSubtitle => 'Einmaliger Kauf, alle Funktionen freigeschaltet.';
	@override String get premiumHeroTitle => 'Lernen ohne Grenzen';
	@override String get premiumHeroBody => 'Hol dir das volle Erlebnis und unterstütze das Projekt.';
	@override String get premiumBenefitNoAds => 'Keine Anzeigen';
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
	@override String get testNext => 'Weiter';
	@override String testCorrectAnswerWas({required Object answer}) => 'Richtige Antwort: ${answer}';
	@override String testQuestionProgress({required Object current, required Object total}) => 'Frage ${current} von ${total}';
	@override String get testKanjiReading => 'Wie liest man dieses Kanji?';
	@override String get testTypeReading => 'Gib die Lesung ein (Kana oder Romaji)';
	@override String get sessionSummaryTitle => 'Sitzung abgeschlossen';
	@override String get sessionReviewSummaryTitle => 'Wiederholung abgeschlossen';
	@override String sessionScore({required Object correct, required Object total}) => '${correct} von ${total} richtig';
	@override String get sessionPerfect => 'Perfekt! Keine Fehler.';
	@override String get sessionMistakesTitle => 'Zum Wiederholen';
	@override String sessionReviewMistakes({required Object count}) => 'Fehler wiederholen (${count})';
	@override String get sessionNew => 'Neue Sitzung';
	@override String get sessionExit => 'Beenden';
	@override String get practiceWhat => 'Was üben';
	@override String get practiceRowsBasic => 'Grundzeichen';
	@override String get practiceRowsDakuten => 'Dakuten';
	@override String get practiceRowsCombos => 'Kombinationen';
	@override String get practiceSelectAll => 'Alle';
	@override String practiceItemsCount({required Object count}) => '${count} Zeichen';
	@override String get practiceNotDrawable => 'Kombinationen und Katakana mit Dakuten können nicht gezeichnet werden und werden im Zeichenmodus übersprungen.';
	@override String get practiceNothingToDraw => 'Keines der gewählten Zeichen kann gezeichnet werden. Wähle andere Reihen oder einen niedrigeren Schwierigkeitsgrad.';
	@override String get practiceSessionLength => 'Fragen pro Sitzung';
	@override String get practiceSource => 'Fragen aus';
	@override String get practiceSourceAll => 'Allem';
	@override String practiceSourceMistakes({required Object count}) => 'Meine Fehler (${count})';
	@override String get kanjiQuizMode => 'Abfragen nach';
	@override String get kanjiModeMeaning => 'Bedeutung';
	@override String get kanjiModeReading => 'Lesung';
	@override String get statsMasteryTitle => 'Beherrschung';
	@override String get statsMasterySubtitle => 'Ein Zeichen gilt als beherrscht nach 3 richtigen Antworten in Folge.';
	@override String statsMasteredCount({required Object mastered, required Object total}) => '${mastered} von ${total} beherrscht';
	@override String get statsLegendMastered => 'Beherrscht';
	@override String get statsLegendLearning => 'Am Lernen';
	@override String get statsLegendWeak => 'Wiederholen';
	@override String get statsLegendNew => 'Noch nicht gesehen';
	@override String get statsWeakest => 'Zum Wiederholen';
	@override String get learnDakutenTitle => 'Dakuten';
	@override String get learnCombosTitle => 'Kombinationen';
	@override String get settingsBackupImportConfirm => 'Der Import ersetzt alle deine aktuellen Statistiken. Fortfahren?';
	@override String get dictionaryEnglishNote => 'Die Ergebnisse stammen von Jisho.org und sind auf Englisch.';
	@override String get dictionaryError => 'Suche fehlgeschlagen. Prüfe deine Verbindung und versuche es erneut.';
	@override String materialsScore({required Object correct, required Object total}) => '${correct} / ${total} richtig';
	@override String get materialsClear => 'Liste entfernen';
	@override String get premiumBenefitJlpt => 'Alle JLPT-Stufen (N4–N1)';
	@override String get settingsThemeTitle => 'Darstellung';
	@override String get settingsThemeSubtitle => 'Hell, dunkel oder wie das System.';
	@override String get settingsThemeSystem => 'Automatisch';
	@override String get settingsThemeLight => 'Hell';
	@override String get settingsThemeDark => 'Dunkel';
	@override String get reminderChannelName => 'Tägliche Erinnerung';
	@override String get reminderChannelDescription => 'Eine Erinnerung um 19 Uhr, wenn du an dem Tag noch nicht geübt hast.';
	@override String get reminderStreakTitle => '🔥 Verlier deine Serie nicht!';
	@override String reminderStreakBody({required Object days}) => 'Du übst seit ${days} Tagen am Stück. Ein paar Minuten heute halten sie am Leben.';
	@override String get reminderSecondDayTitle => '🔥 Mach den zweiten Tag voll';
	@override String get reminderSecondDayBody => 'Gestern hast du geübt. Mach heute weiter und starte eine Serie.';
	@override String get reminderComebackTitle => 'Ein paar Minuten Japanisch?';
	@override String get reminderComebackBody => 'Deine Kana warten. Eine kurze Runde startet eine neue Serie.';
	@override String get reminderLastTitle => 'Wir vermissen dich 👋';
	@override String get reminderLastBody => 'Komm zurück, wann du willst: 5 Minuten Wiederholung zählen schon.';
	@override String get settingsReminderTitle => 'Tägliche Erinnerung';
	@override String get settingsReminderSubtitle => 'Erinnert dich um 19 Uhr, wenn du an dem Tag noch nicht geübt hast.';
	@override String get settingsReminderBlocked => 'Benachrichtigungen für KanaGo sind deaktiviert. Aktiviere sie in den Systemeinstellungen.';
	@override String get settingsAdPrivacyTitle => 'Werbe-Datenschutz';
	@override String get settingsAdPrivacySubtitle => 'Ändere deine Einwilligung für personalisierte Werbung.';
}

// Path: exam
class _Translations$exam$de implements Translations$exam$en {
	_Translations$exam$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get tab => 'Prüfung';
	@override String get hubTitle => 'JLPT N5 Simulator';
	@override String get hubSubtitle => 'Tests im gleichen Format wie die echte Prüfung';
	@override String get daysLeft => 'Tage bis zur Prüfung';
	@override String get examsToday => 'Tests heute';
	@override String get questionsSeen => 'Fragen gesehen';
	@override String get fullExam => 'Komplette Prüfung';
	@override String get fullExamSubtitle => '20 + 40 + 30 Min. · 67 Fragen';
	@override String sectionCardSubtitle({required Object minutes, required Object count}) => '${minutes} Min. · ${count} Fragen';
	@override String get progressTitle => 'Verlauf (komplette Prüfung)';
	@override String get weakPoints => 'Schwachstellen';
	@override String weakPointsSubtitle({required Object count}) => 'Richtige Antworten nach Fragetyp in deinen letzten ${count} Tests';
	@override String get history => 'Verlauf';
	@override String historyFullDetail({required Object date, required Object language, required Object listening}) => '${date} · Sprache ${language}/120 · Hören ${listening}/60';
	@override late final _Translations$exam$sections$de sections = _Translations$exam$sections$de._(_root);
	@override late final _Translations$exam$mondai$de mondai = _Translations$exam$mondai$de._(_root);
	@override String get createError => 'Der Test konnte nicht erstellt werden.';
	@override String get leaveTitle => 'Test verlassen?';
	@override String get leaveBody => 'Deine Antworten in diesem Test gehen verloren.';
	@override String get keepGoing => 'Weitermachen';
	@override String get leave => 'Verlassen';
	@override String sectionOf({required Object current, required Object total}) => 'Teil ${current} von ${total}';
	@override String sectionInfo({required Object minutes, required Object count}) => '${minutes} Minuten · ${count} Fragen';
	@override String get listeningIntro => 'Das Audio startet von selbst und läuft nur einmal, wie in der Prüfung. Antworte in der Pause nach jeder Frage. Nutze Kopfhörer.';
	@override String get writtenIntro => 'Du kannst frei zwischen den Fragen wechseln. Wenn die Zeit abläuft, wird der Teil automatisch abgegeben.';
	@override String get start => 'Start';
	@override String get timeUp => 'Zeit abgelaufen';
	@override String get submitTitle => 'Teil abgeben?';
	@override String get submitAllAnswered => 'Du hast alle Fragen beantwortet.';
	@override String submitUnanswered({required Object count}) => 'Unbeantwortete Fragen: ${count}.';
	@override String get submit => 'Abgeben';
	@override String get previous => 'Zurück';
	@override String get next => 'Weiter';
	@override String questionOf({required Object current, required Object total}) => 'Frage ${current} von ${total}';
	@override String get resultTitle => 'Ergebnis';
	@override String get reviewAnswers => 'Antworten ansehen';
	@override String get back => 'Zurück';
	@override String get passed => 'Bestanden';
	@override String get failed => 'Nicht bestanden';
	@override String get scoreNote => 'Geschätzte Punktzahl: Jede Frage zählt gleich. Zum Bestehen brauchst du 80/180 und in jedem Teil mindestens 38 bzw. 19.';
	@override String correctOf({required Object correct, required Object total}) => '${correct} von ${total} richtig';
	@override String get listeningHint => 'Minimum zum Bestehen im Hörverstehen: 19/60 (32 %). Ziel sicherheitshalber über 60 %.';
	@override String get languageHint => 'Minimum im Sprachteil: 38/120 (32 %). Ziel sicherheitshalber über 60 %.';
	@override String get reviewTitle => 'Durchsicht';
	@override String get onlyMistakes => 'Nur Fehler';
	@override String get noMistakes => 'Keine Fehler!';
	@override String get unanswered => 'Nicht beantwortet';
	@override String get correct => 'Richtig';
	@override String get incorrect => 'Falsch';
	@override String get translation => 'Übersetzung';
	@override String get showTextTranslation => 'Übersetzung des Textes zeigen';
	@override String get hideTextTranslation => 'Übersetzung des Textes ausblenden';
	@override String get listen => 'Anhören';
	@override String get stop => 'Stopp';
	@override String get instructions => 'Anleitung';
	@override String get listening => 'Hören …';
	@override String answerNow({required Object seconds}) => 'Antworten · ${seconds} s';
	@override String get paused => 'Pausiert';
	@override String get resume => 'Fortsetzen';
	@override String get pause => 'Pause';
}

// Path: exam.sections
class _Translations$exam$sections$de implements Translations$exam$sections$en {
	_Translations$exam$sections$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get vocabulary => 'Wortschatz und Schrift';
	@override String get grammarReading => 'Grammatik und Lesen';
	@override String get listening => 'Hörverstehen';
}

// Path: exam.mondai
class _Translations$exam$mondai$de implements Translations$exam$mondai$en {
	_Translations$exam$mondai$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get kanjiReading => 'Kanji lesen';
	@override String get orthography => 'Schreibweise';
	@override String get contextual => 'Wortschatz im Kontext';
	@override String get paraphrase => 'Umschreibung';
	@override String get grammarForm => 'Grammatikform';
	@override String get sentenceOrder => 'Satzbau';
	@override String get textGrammar => 'Textgrammatik';
	@override String get shortReading => 'Kurze Texte';
	@override String get midReading => 'Mittellanger Text';
	@override String get infoSearch => 'Informationssuche';
	@override String get taskListening => 'Aufgaben verstehen';
	@override String get pointListening => 'Kernpunkte verstehen';
	@override String get utterance => 'Sprachliche Ausdrücke';
	@override String get quickResponse => 'Schnelle Reaktion';
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
			'app.premiumSectionSubtitle' => 'Schalte alle Funktionen frei und entferne Anzeigen.',
			'app.premiumOpenButton' => 'Freischalten',
			'app.premiumLockedMessage' => 'Premium-Funktion. Freischalten, um sie zu nutzen.',
			'app.premiumTitle' => 'KanaGo Premium',
			'app.premiumSubtitle' => 'Einmaliger Kauf, alle Funktionen freigeschaltet.',
			'app.premiumHeroTitle' => 'Lernen ohne Grenzen',
			'app.premiumHeroBody' => 'Hol dir das volle Erlebnis und unterstütze das Projekt.',
			'app.premiumBenefitNoAds' => 'Keine Anzeigen',
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
			'app.testNext' => 'Weiter',
			'app.testCorrectAnswerWas' => ({required Object answer}) => 'Richtige Antwort: ${answer}',
			'app.testQuestionProgress' => ({required Object current, required Object total}) => 'Frage ${current} von ${total}',
			'app.testKanjiReading' => 'Wie liest man dieses Kanji?',
			'app.testTypeReading' => 'Gib die Lesung ein (Kana oder Romaji)',
			'app.sessionSummaryTitle' => 'Sitzung abgeschlossen',
			'app.sessionReviewSummaryTitle' => 'Wiederholung abgeschlossen',
			'app.sessionScore' => ({required Object correct, required Object total}) => '${correct} von ${total} richtig',
			'app.sessionPerfect' => 'Perfekt! Keine Fehler.',
			'app.sessionMistakesTitle' => 'Zum Wiederholen',
			'app.sessionReviewMistakes' => ({required Object count}) => 'Fehler wiederholen (${count})',
			'app.sessionNew' => 'Neue Sitzung',
			'app.sessionExit' => 'Beenden',
			'app.practiceWhat' => 'Was üben',
			'app.practiceRowsBasic' => 'Grundzeichen',
			'app.practiceRowsDakuten' => 'Dakuten',
			'app.practiceRowsCombos' => 'Kombinationen',
			'app.practiceSelectAll' => 'Alle',
			'app.practiceItemsCount' => ({required Object count}) => '${count} Zeichen',
			'app.practiceNotDrawable' => 'Kombinationen und Katakana mit Dakuten können nicht gezeichnet werden und werden im Zeichenmodus übersprungen.',
			'app.practiceNothingToDraw' => 'Keines der gewählten Zeichen kann gezeichnet werden. Wähle andere Reihen oder einen niedrigeren Schwierigkeitsgrad.',
			'app.practiceSessionLength' => 'Fragen pro Sitzung',
			'app.practiceSource' => 'Fragen aus',
			'app.practiceSourceAll' => 'Allem',
			'app.practiceSourceMistakes' => ({required Object count}) => 'Meine Fehler (${count})',
			'app.kanjiQuizMode' => 'Abfragen nach',
			'app.kanjiModeMeaning' => 'Bedeutung',
			'app.kanjiModeReading' => 'Lesung',
			'app.statsMasteryTitle' => 'Beherrschung',
			'app.statsMasterySubtitle' => 'Ein Zeichen gilt als beherrscht nach 3 richtigen Antworten in Folge.',
			'app.statsMasteredCount' => ({required Object mastered, required Object total}) => '${mastered} von ${total} beherrscht',
			'app.statsLegendMastered' => 'Beherrscht',
			'app.statsLegendLearning' => 'Am Lernen',
			'app.statsLegendWeak' => 'Wiederholen',
			'app.statsLegendNew' => 'Noch nicht gesehen',
			'app.statsWeakest' => 'Zum Wiederholen',
			'app.learnDakutenTitle' => 'Dakuten',
			'app.learnCombosTitle' => 'Kombinationen',
			'app.settingsBackupImportConfirm' => 'Der Import ersetzt alle deine aktuellen Statistiken. Fortfahren?',
			'app.dictionaryEnglishNote' => 'Die Ergebnisse stammen von Jisho.org und sind auf Englisch.',
			'app.dictionaryError' => 'Suche fehlgeschlagen. Prüfe deine Verbindung und versuche es erneut.',
			'app.materialsScore' => ({required Object correct, required Object total}) => '${correct} / ${total} richtig',
			'app.materialsClear' => 'Liste entfernen',
			'app.premiumBenefitJlpt' => 'Alle JLPT-Stufen (N4–N1)',
			'app.settingsThemeTitle' => 'Darstellung',
			'app.settingsThemeSubtitle' => 'Hell, dunkel oder wie das System.',
			'app.settingsThemeSystem' => 'Automatisch',
			'app.settingsThemeLight' => 'Hell',
			'app.settingsThemeDark' => 'Dunkel',
			'app.reminderChannelName' => 'Tägliche Erinnerung',
			'app.reminderChannelDescription' => 'Eine Erinnerung um 19 Uhr, wenn du an dem Tag noch nicht geübt hast.',
			'app.reminderStreakTitle' => '🔥 Verlier deine Serie nicht!',
			'app.reminderStreakBody' => ({required Object days}) => 'Du übst seit ${days} Tagen am Stück. Ein paar Minuten heute halten sie am Leben.',
			'app.reminderSecondDayTitle' => '🔥 Mach den zweiten Tag voll',
			'app.reminderSecondDayBody' => 'Gestern hast du geübt. Mach heute weiter und starte eine Serie.',
			'app.reminderComebackTitle' => 'Ein paar Minuten Japanisch?',
			'app.reminderComebackBody' => 'Deine Kana warten. Eine kurze Runde startet eine neue Serie.',
			'app.reminderLastTitle' => 'Wir vermissen dich 👋',
			'app.reminderLastBody' => 'Komm zurück, wann du willst: 5 Minuten Wiederholung zählen schon.',
			'app.settingsReminderTitle' => 'Tägliche Erinnerung',
			'app.settingsReminderSubtitle' => 'Erinnert dich um 19 Uhr, wenn du an dem Tag noch nicht geübt hast.',
			'app.settingsReminderBlocked' => 'Benachrichtigungen für KanaGo sind deaktiviert. Aktiviere sie in den Systemeinstellungen.',
			'app.settingsAdPrivacyTitle' => 'Werbe-Datenschutz',
			'app.settingsAdPrivacySubtitle' => 'Ändere deine Einwilligung für personalisierte Werbung.',
			'exam.tab' => 'Prüfung',
			'exam.hubTitle' => 'JLPT N5 Simulator',
			'exam.hubSubtitle' => 'Tests im gleichen Format wie die echte Prüfung',
			'exam.daysLeft' => 'Tage bis zur Prüfung',
			'exam.examsToday' => 'Tests heute',
			'exam.questionsSeen' => 'Fragen gesehen',
			'exam.fullExam' => 'Komplette Prüfung',
			'exam.fullExamSubtitle' => '20 + 40 + 30 Min. · 67 Fragen',
			'exam.sectionCardSubtitle' => ({required Object minutes, required Object count}) => '${minutes} Min. · ${count} Fragen',
			'exam.progressTitle' => 'Verlauf (komplette Prüfung)',
			'exam.weakPoints' => 'Schwachstellen',
			'exam.weakPointsSubtitle' => ({required Object count}) => 'Richtige Antworten nach Fragetyp in deinen letzten ${count} Tests',
			'exam.history' => 'Verlauf',
			'exam.historyFullDetail' => ({required Object date, required Object language, required Object listening}) => '${date} · Sprache ${language}/120 · Hören ${listening}/60',
			'exam.sections.vocabulary' => 'Wortschatz und Schrift',
			'exam.sections.grammarReading' => 'Grammatik und Lesen',
			'exam.sections.listening' => 'Hörverstehen',
			'exam.mondai.kanjiReading' => 'Kanji lesen',
			'exam.mondai.orthography' => 'Schreibweise',
			'exam.mondai.contextual' => 'Wortschatz im Kontext',
			'exam.mondai.paraphrase' => 'Umschreibung',
			'exam.mondai.grammarForm' => 'Grammatikform',
			'exam.mondai.sentenceOrder' => 'Satzbau',
			'exam.mondai.textGrammar' => 'Textgrammatik',
			'exam.mondai.shortReading' => 'Kurze Texte',
			'exam.mondai.midReading' => 'Mittellanger Text',
			'exam.mondai.infoSearch' => 'Informationssuche',
			'exam.mondai.taskListening' => 'Aufgaben verstehen',
			'exam.mondai.pointListening' => 'Kernpunkte verstehen',
			'exam.mondai.utterance' => 'Sprachliche Ausdrücke',
			'exam.mondai.quickResponse' => 'Schnelle Reaktion',
			'exam.createError' => 'Der Test konnte nicht erstellt werden.',
			'exam.leaveTitle' => 'Test verlassen?',
			'exam.leaveBody' => 'Deine Antworten in diesem Test gehen verloren.',
			'exam.keepGoing' => 'Weitermachen',
			'exam.leave' => 'Verlassen',
			'exam.sectionOf' => ({required Object current, required Object total}) => 'Teil ${current} von ${total}',
			'exam.sectionInfo' => ({required Object minutes, required Object count}) => '${minutes} Minuten · ${count} Fragen',
			'exam.listeningIntro' => 'Das Audio startet von selbst und läuft nur einmal, wie in der Prüfung. Antworte in der Pause nach jeder Frage. Nutze Kopfhörer.',
			'exam.writtenIntro' => 'Du kannst frei zwischen den Fragen wechseln. Wenn die Zeit abläuft, wird der Teil automatisch abgegeben.',
			'exam.start' => 'Start',
			'exam.timeUp' => 'Zeit abgelaufen',
			'exam.submitTitle' => 'Teil abgeben?',
			'exam.submitAllAnswered' => 'Du hast alle Fragen beantwortet.',
			'exam.submitUnanswered' => ({required Object count}) => 'Unbeantwortete Fragen: ${count}.',
			'exam.submit' => 'Abgeben',
			'exam.previous' => 'Zurück',
			'exam.next' => 'Weiter',
			'exam.questionOf' => ({required Object current, required Object total}) => 'Frage ${current} von ${total}',
			'exam.resultTitle' => 'Ergebnis',
			'exam.reviewAnswers' => 'Antworten ansehen',
			'exam.back' => 'Zurück',
			'exam.passed' => 'Bestanden',
			'exam.failed' => 'Nicht bestanden',
			'exam.scoreNote' => 'Geschätzte Punktzahl: Jede Frage zählt gleich. Zum Bestehen brauchst du 80/180 und in jedem Teil mindestens 38 bzw. 19.',
			'exam.correctOf' => ({required Object correct, required Object total}) => '${correct} von ${total} richtig',
			'exam.listeningHint' => 'Minimum zum Bestehen im Hörverstehen: 19/60 (32 %). Ziel sicherheitshalber über 60 %.',
			'exam.languageHint' => 'Minimum im Sprachteil: 38/120 (32 %). Ziel sicherheitshalber über 60 %.',
			'exam.reviewTitle' => 'Durchsicht',
			'exam.onlyMistakes' => 'Nur Fehler',
			'exam.noMistakes' => 'Keine Fehler!',
			'exam.unanswered' => 'Nicht beantwortet',
			'exam.correct' => 'Richtig',
			'exam.incorrect' => 'Falsch',
			'exam.translation' => 'Übersetzung',
			'exam.showTextTranslation' => 'Übersetzung des Textes zeigen',
			'exam.hideTextTranslation' => 'Übersetzung des Textes ausblenden',
			'exam.listen' => 'Anhören',
			'exam.stop' => 'Stopp',
			'exam.instructions' => 'Anleitung',
			'exam.listening' => 'Hören …',
			'exam.answerNow' => ({required Object seconds}) => 'Antworten · ${seconds} s',
			'exam.paused' => 'Pausiert',
			'exam.resume' => 'Fortsetzen',
			'exam.pause' => 'Pause',
			_ => null,
		};
	}
}
