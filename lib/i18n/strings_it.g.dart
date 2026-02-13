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
class TranslationsIt with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsIt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.it,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <it>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsIt _root = this; // ignore: unused_field

	@override 
	TranslationsIt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsIt(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppIt app = _TranslationsAppIt._(_root);
}

// Path: app
class _TranslationsAppIt implements TranslationsAppEn {
	_TranslationsAppIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get studyHubTitle => 'Centro studio';
	@override String get studyHubSubtitle => 'Scegli una scrittura e inizia a imparare o praticare.';
	@override String get paths => 'Percorsi';
	@override String get script => 'Scrittura';
	@override String get difficulty => 'Difficoltà';
	@override String get difficultyEasy => 'Facile';
	@override String get difficultyMedium => 'Media';
	@override String get difficultyHard => 'Difficile';
	@override String get difficultyEasyDesc => 'Scelta singola';
	@override String get difficultyMediumDesc => 'Testo';
	@override String get difficultyHardDesc => 'Disegno';
	@override String get learn => 'Impara';
	@override String get learnSubtitle => 'Esplora caratteri e suggerimenti sui tratti.';
	@override String get practice => 'Pratica';
	@override String get practiceSubtitle => 'Riconoscimento, scrittura e disegno.';
	@override String get materials => 'Materiali';
	@override String get materialsSubtitle => 'Importa un CSV con i tuoi dati.';
	@override String get dictionary => 'Dizionario';
	@override String get dictionarySubtitle => 'Cerca parole, kana e significati.';
	@override String get statistics => 'Statistiche';
	@override String get statisticsSubtitle => 'Precisione, costanza e ritmo.';
	@override String get settings => 'Impostazioni';
	@override String get learningDefaults => 'Preferenze di studio';
	@override String get testDifficulty => 'Livello test';
	@override String get testDifficultySubtitle => 'Scegli la difficoltà per la pratica.';
	@override String get importCsv => 'Importa CSV';
	@override String get expectedFormatTitle => 'Formato previsto';
	@override String get expectedFormatBody => 'Intestazioni consigliate:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nPuoi usare qualsiasi colonna come domanda o risposta. CSV separato da virgole.';
	@override String fileLabel({required Object name, required Object count}) => 'File: ${name} (${count})';
	@override String get askWith => 'Chiedi con';
	@override String get answerWith => 'Rispondi con';
	@override String get newQuestion => 'Nuova domanda';
	@override String get checkAnswer => 'Controlla';
	@override String get materialsEmpty => 'Importa un CSV e premi "Nuova domanda".';
	@override String get showAnswer => 'Mostra risposta';
	@override String answerPrefix({required Object answer}) => 'Risposta: ${answer}';
	@override String get beginSession => 'Inizia';
	@override String get practiceStartSubtitle => 'Avvia una nuova sessione.';
	@override String get testStayFocused => 'Resta concentrato e invia quando sei pronto.';
	@override String get testSketchHint => 'Disegna nell\'area';
	@override String get testTypeRomaji => 'Scrivi il romaji';
	@override String get testTypeMeaning => 'Scrivi il significato';
	@override String get testRomajiLabel => 'Lettura romaji';
	@override String get testMeaningLabel => 'Significato in spagnolo';
	@override String get testTapToType => 'Tocca per scrivere';
	@override String testDrawThe({required Object script}) => 'Disegna ${script}';
	@override String testWhichIs({required Object script}) => 'Qual è questo ${script}?';
	@override String get testKanjiMeaning => 'Significato di questo kanji?';
	@override String get statsNoDataTitle => 'Nessuna statistica';
	@override String get statsNoDataSubtitle => 'Completa alcuni test per sbloccarle.';
	@override String get statsReset => 'Reset statistiche';
	@override String get statsActivity => 'Attività';
	@override String get statsActivitySubtitle => 'Ultimi 14 giorni';
	@override String get statsEvolution => 'Andamento';
	@override String get statsEvolutionSubtitle => 'Corrette vs errate';
	@override String get statsNoEvolution => 'Nessun dato.';
	@override String get statsNoActivity => 'Nessuna attività.';
	@override String get statsAccuracy => 'Precisione';
	@override String get statsStreak => 'Serie';
	@override String get statsLast7 => '7 giorni';
	@override String get statsLast30 => '30 giorni';
	@override String get statsSessions => 'sessioni';
	@override String statsBest({required Object days}) => 'Migliori ${days} giorni';
	@override String statsCorrect({required Object correct, required Object total}) => '${correct}/${total} corrette';
	@override String get statsCorrectLabel => 'Corrette';
	@override String get statsIncorrectLabel => 'Errate';
	@override String get statsMomentum => 'Momentum';
	@override String get statsView => 'Vedi statistiche';
	@override String get statsStartToUnlock => 'Inizia una pratica per vedere le statistiche.';
	@override String get dictionaryEmpty => 'Inizia a cercare una parola.';
	@override String get searchHint => 'Cerca parola, kana, romaji...';
	@override String get correct => 'Corretto!';
	@override String get incorrect => 'Errato';
	@override String get oops => 'Ops...';
	@override String errorImporting({required Object error}) => 'Errore importazione: ${error}';
	@override String importedEntries({required Object count, required Object file}) => '${count} elementi importati da ${file}';
	@override String get noValidRows => 'Nessuna riga valida.';
	@override String get dataNotFound => 'Nessun dato nel CSV.';
	@override String get materialsNeedImport => 'Importa un CSV e scegli le colonne.';
	@override String get materialsNeedStart => 'Avvia prima una domanda.';
	@override String get language => 'Lingua';
	@override String get languageSubtitle => 'Scegli la lingua dell\'app.';
	@override String get back => 'Indietro';
	@override String get ok => 'OK';
	@override String get yourAnswer => 'La tua risposta';
	@override String statsStreakDays({required Object days}) => 'Serie di ${days} giorni';
	@override String get statsAttempts => 'tentativi';
	@override String get scriptHiragana => 'Hiragana';
	@override String get scriptKatakana => 'Katakana';
	@override String get scriptKanji => 'Kanji';
	@override String get testModeDrawing => 'Disegno';
	@override String get testModeQuiz => 'Quiz';
	@override String get dictionaryNotes => 'Note';
	@override String get dictionarySeeAlso => 'Vedi anche';
	@override String get confirmActionTitle => 'Conferma';
	@override String get confirmActionBody => 'Vuoi davvero eliminare TUTTE le statistiche?';
	@override String get cancel => 'Annulla';
	@override String get delete => 'Elimina';
	@override String get searchByMeaning => 'Cerca per significato';
	@override String get filterAll => 'Tutto';
	@override String get tabStudy => 'Studio';
	@override String get tabStats => 'Statistiche';
	@override String get settingsHapticsTitle => 'Vibrazione';
	@override String get settingsHapticsSubtitle => 'Vibra quando giusto o sbagliato.';
	@override String get settingsKanaSizeTitle => 'Dimensione kana';
	@override String get settingsKanaSizeSubtitle => 'Regola la dimensione dei kana.';
	@override String settingsKanaSizeValue({required Object value}) => '${value}x';
	@override String get settingsKanjiJlptTitle => 'Livello JLPT';
	@override String get settingsKanjiJlptSubtitle => 'Limita i kanji per livello JLPT.';
	@override String get settingsUseModelHiraganaTitle => 'IA Hiragana';
	@override String get settingsUseModelHiraganaSubtitle => 'Usa riconoscimento IA nel disegno.';
	@override String get settingsUseModelKatakanaTitle => 'IA Katakana';
	@override String get settingsUseModelKatakanaSubtitle => 'Usa riconoscimento IA nel disegno.';
	@override String get settingsUseModelKanjiTitle => 'IA Kanji';
	@override String get settingsUseModelKanjiSubtitle => 'Usa riconoscimento IA nel disegno.';
	@override String get kanjiFilterEmpty => 'Nessun kanji per questo livello JLPT.';
	@override String get settingsBackupTitle => 'Backup';
	@override String get settingsBackupSubtitle => 'Esporta o importa i progressi JSON.';
	@override String get settingsBackupExportButton => 'Esporta';
	@override String get settingsBackupImportButton => 'Importa';
	@override String settingsBackupExported({required Object path}) => 'Esportato in ${path}';
	@override String settingsBackupImported({required Object count}) => '${count} risposte importate';
	@override String settingsBackupError({required Object error}) => 'Errore backup: ${error}';
	@override String get testGuideShow => 'Mostra guida';
	@override String get testGuideHide => 'Nascondi guida';
	@override String get testReportDrawing => 'Segnala disegno';
	@override String get testReportThanks => 'Grazie. Report pronto.';
	@override String get testReportError => 'Impossibile creare il report.';
	@override String get testKanjiTraceHint => 'Segui l\'ordine dei tratti. Attiva la guida se serve.';
}

/// The flat map containing all translations for locale <it>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsIt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.studyHubTitle' => 'Centro studio',
			'app.studyHubSubtitle' => 'Scegli una scrittura e inizia a imparare o praticare.',
			'app.paths' => 'Percorsi',
			'app.script' => 'Scrittura',
			'app.difficulty' => 'Difficoltà',
			'app.difficultyEasy' => 'Facile',
			'app.difficultyMedium' => 'Media',
			'app.difficultyHard' => 'Difficile',
			'app.difficultyEasyDesc' => 'Scelta singola',
			'app.difficultyMediumDesc' => 'Testo',
			'app.difficultyHardDesc' => 'Disegno',
			'app.learn' => 'Impara',
			'app.learnSubtitle' => 'Esplora caratteri e suggerimenti sui tratti.',
			'app.practice' => 'Pratica',
			'app.practiceSubtitle' => 'Riconoscimento, scrittura e disegno.',
			'app.materials' => 'Materiali',
			'app.materialsSubtitle' => 'Importa un CSV con i tuoi dati.',
			'app.dictionary' => 'Dizionario',
			'app.dictionarySubtitle' => 'Cerca parole, kana e significati.',
			'app.statistics' => 'Statistiche',
			'app.statisticsSubtitle' => 'Precisione, costanza e ritmo.',
			'app.settings' => 'Impostazioni',
			'app.learningDefaults' => 'Preferenze di studio',
			'app.testDifficulty' => 'Livello test',
			'app.testDifficultySubtitle' => 'Scegli la difficoltà per la pratica.',
			'app.importCsv' => 'Importa CSV',
			'app.expectedFormatTitle' => 'Formato previsto',
			'app.expectedFormatBody' => 'Intestazioni consigliate:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nPuoi usare qualsiasi colonna come domanda o risposta. CSV separato da virgole.',
			'app.fileLabel' => ({required Object name, required Object count}) => 'File: ${name} (${count})',
			'app.askWith' => 'Chiedi con',
			'app.answerWith' => 'Rispondi con',
			'app.newQuestion' => 'Nuova domanda',
			'app.checkAnswer' => 'Controlla',
			'app.materialsEmpty' => 'Importa un CSV e premi "Nuova domanda".',
			'app.showAnswer' => 'Mostra risposta',
			'app.answerPrefix' => ({required Object answer}) => 'Risposta: ${answer}',
			'app.beginSession' => 'Inizia',
			'app.practiceStartSubtitle' => 'Avvia una nuova sessione.',
			'app.testStayFocused' => 'Resta concentrato e invia quando sei pronto.',
			'app.testSketchHint' => 'Disegna nell\'area',
			'app.testTypeRomaji' => 'Scrivi il romaji',
			'app.testTypeMeaning' => 'Scrivi il significato',
			'app.testRomajiLabel' => 'Lettura romaji',
			'app.testMeaningLabel' => 'Significato in spagnolo',
			'app.testTapToType' => 'Tocca per scrivere',
			'app.testDrawThe' => ({required Object script}) => 'Disegna ${script}',
			'app.testWhichIs' => ({required Object script}) => 'Qual è questo ${script}?',
			'app.testKanjiMeaning' => 'Significato di questo kanji?',
			'app.statsNoDataTitle' => 'Nessuna statistica',
			'app.statsNoDataSubtitle' => 'Completa alcuni test per sbloccarle.',
			'app.statsReset' => 'Reset statistiche',
			'app.statsActivity' => 'Attività',
			'app.statsActivitySubtitle' => 'Ultimi 14 giorni',
			'app.statsEvolution' => 'Andamento',
			'app.statsEvolutionSubtitle' => 'Corrette vs errate',
			'app.statsNoEvolution' => 'Nessun dato.',
			'app.statsNoActivity' => 'Nessuna attività.',
			'app.statsAccuracy' => 'Precisione',
			'app.statsStreak' => 'Serie',
			'app.statsLast7' => '7 giorni',
			'app.statsLast30' => '30 giorni',
			'app.statsSessions' => 'sessioni',
			'app.statsBest' => ({required Object days}) => 'Migliori ${days} giorni',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct}/${total} corrette',
			'app.statsCorrectLabel' => 'Corrette',
			'app.statsIncorrectLabel' => 'Errate',
			'app.statsMomentum' => 'Momentum',
			'app.statsView' => 'Vedi statistiche',
			'app.statsStartToUnlock' => 'Inizia una pratica per vedere le statistiche.',
			'app.dictionaryEmpty' => 'Inizia a cercare una parola.',
			'app.searchHint' => 'Cerca parola, kana, romaji...',
			'app.correct' => 'Corretto!',
			'app.incorrect' => 'Errato',
			'app.oops' => 'Ops...',
			'app.errorImporting' => ({required Object error}) => 'Errore importazione: ${error}',
			'app.importedEntries' => ({required Object count, required Object file}) => '${count} elementi importati da ${file}',
			'app.noValidRows' => 'Nessuna riga valida.',
			'app.dataNotFound' => 'Nessun dato nel CSV.',
			'app.materialsNeedImport' => 'Importa un CSV e scegli le colonne.',
			'app.materialsNeedStart' => 'Avvia prima una domanda.',
			'app.language' => 'Lingua',
			'app.languageSubtitle' => 'Scegli la lingua dell\'app.',
			'app.back' => 'Indietro',
			'app.ok' => 'OK',
			'app.yourAnswer' => 'La tua risposta',
			'app.statsStreakDays' => ({required Object days}) => 'Serie di ${days} giorni',
			'app.statsAttempts' => 'tentativi',
			'app.scriptHiragana' => 'Hiragana',
			'app.scriptKatakana' => 'Katakana',
			'app.scriptKanji' => 'Kanji',
			'app.testModeDrawing' => 'Disegno',
			'app.testModeQuiz' => 'Quiz',
			'app.dictionaryNotes' => 'Note',
			'app.dictionarySeeAlso' => 'Vedi anche',
			'app.confirmActionTitle' => 'Conferma',
			'app.confirmActionBody' => 'Vuoi davvero eliminare TUTTE le statistiche?',
			'app.cancel' => 'Annulla',
			'app.delete' => 'Elimina',
			'app.searchByMeaning' => 'Cerca per significato',
			'app.filterAll' => 'Tutto',
			'app.tabStudy' => 'Studio',
			'app.tabStats' => 'Statistiche',
			'app.settingsHapticsTitle' => 'Vibrazione',
			'app.settingsHapticsSubtitle' => 'Vibra quando giusto o sbagliato.',
			'app.settingsKanaSizeTitle' => 'Dimensione kana',
			'app.settingsKanaSizeSubtitle' => 'Regola la dimensione dei kana.',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'Livello JLPT',
			'app.settingsKanjiJlptSubtitle' => 'Limita i kanji per livello JLPT.',
			'app.settingsUseModelHiraganaTitle' => 'IA Hiragana',
			'app.settingsUseModelHiraganaSubtitle' => 'Usa riconoscimento IA nel disegno.',
			'app.settingsUseModelKatakanaTitle' => 'IA Katakana',
			'app.settingsUseModelKatakanaSubtitle' => 'Usa riconoscimento IA nel disegno.',
			'app.settingsUseModelKanjiTitle' => 'IA Kanji',
			'app.settingsUseModelKanjiSubtitle' => 'Usa riconoscimento IA nel disegno.',
			'app.kanjiFilterEmpty' => 'Nessun kanji per questo livello JLPT.',
			'app.settingsBackupTitle' => 'Backup',
			'app.settingsBackupSubtitle' => 'Esporta o importa i progressi JSON.',
			'app.settingsBackupExportButton' => 'Esporta',
			'app.settingsBackupImportButton' => 'Importa',
			'app.settingsBackupExported' => ({required Object path}) => 'Esportato in ${path}',
			'app.settingsBackupImported' => ({required Object count}) => '${count} risposte importate',
			'app.settingsBackupError' => ({required Object error}) => 'Errore backup: ${error}',
			'app.testGuideShow' => 'Mostra guida',
			'app.testGuideHide' => 'Nascondi guida',
			'app.testReportDrawing' => 'Segnala disegno',
			'app.testReportThanks' => 'Grazie. Report pronto.',
			'app.testReportError' => 'Impossibile creare il report.',
			'app.testKanjiTraceHint' => 'Segui l\'ordine dei tratti. Attiva la guida se serve.',
			_ => null,
		};
	}
}
