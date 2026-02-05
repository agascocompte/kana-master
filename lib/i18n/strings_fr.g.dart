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
class TranslationsFr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppFr app = _TranslationsAppFr._(_root);
}

// Path: app
class _TranslationsAppFr implements TranslationsAppEn {
	_TranslationsAppFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get studyHubTitle => 'Study hub';
	@override String get studyHubSubtitle => 'Choose your script, then jump into learning or practice.';
	@override String get paths => 'Paths';
	@override String get script => 'Script';
	@override String get difficulty => 'Difficulty';
	@override String get difficultyEasy => 'Easy';
	@override String get difficultyMedium => 'Medium';
	@override String get difficultyHard => 'Hard';
	@override String get difficultyEasyDesc => 'Single choice';
	@override String get difficultyMediumDesc => 'Text answer';
	@override String get difficultyHardDesc => 'Drawing';
	@override String get learn => 'Learn';
	@override String get learnSubtitle => 'Explore characters and stroke order hints.';
	@override String get practice => 'Practice';
	@override String get practiceSubtitle => 'Test recognition, typing, and drawing skills.';
	@override String get materials => 'Materials';
	@override String get materialsSubtitle => 'Import a CSV and turn it into a personal drill deck.';
	@override String get dictionary => 'Dictionary';
	@override String get dictionarySubtitle => 'Search words, kana, and meanings instantly.';
	@override String get statistics => 'Statistics';
	@override String get statisticsSubtitle => 'Consistency, accuracy, and momentum by kana type.';
	@override String get settings => 'Settings';
	@override String get learningDefaults => 'Learning defaults';
	@override String get testDifficulty => 'Test difficulty';
	@override String get testDifficultySubtitle => 'Choose the level of difficulty for practice sessions.';
	@override String get importCsv => 'Import CSV';
	@override String get expectedFormatTitle => 'Expected Format';
	@override String get expectedFormatBody => 'Recommended headers:\n\nLanguage | Romaji | Hiragana | Katakana | Kanji.\n\nYou can map any column as question or answer. Use comma-separated CSV.';
	@override String get fileLabel => 'File: {name} ({count} rows)';
	@override String get askWith => 'Ask with';
	@override String get answerWith => 'Answer with';
	@override String get newQuestion => 'New Question';
	@override String get checkAnswer => 'Check Answer';
	@override String get materialsEmpty => 'Import your CSV and press "New Question" to start.';
	@override String get showAnswer => 'Show Answer';
	@override String get answerPrefix => 'Answer: {answer}';
	@override String get beginSession => 'Begin session';
	@override String get practiceStartSubtitle => 'Start a fresh round and keep the streak alive.';
	@override String get testStayFocused => 'Stay focused. Submit when ready.';
	@override String get testSketchHint => 'Sketch inside the canvas';
	@override String get testTypeRomaji => 'Type the romaji';
	@override String get testTypeMeaning => 'Type the meaning';
	@override String get testRomajiLabel => 'Romaji reading';
	@override String get testMeaningLabel => 'Meaning in English';
	@override String get testTapToType => 'Tap to type';
	@override String get testDrawThe => 'Draw the {script}';
	@override String get testWhichIs => 'Which is this {script}?';
	@override String get testKanjiMeaning => 'Meaning of this kanji?';
	@override String get statsNoDataTitle => 'No stats yet';
	@override String get statsNoDataSubtitle => 'Complete a few tests to unlock streaks and performance graphs.';
	@override String get statsReset => 'Reset stats';
	@override String get statsActivity => 'Daily activity';
	@override String get statsActivitySubtitle => 'Last 14 days';
	@override String get statsEvolution => 'Evolution';
	@override String get statsEvolutionSubtitle => 'Correct vs incorrect';
	@override String get statsNoEvolution => 'No evolution data yet.';
	@override String get statsNoActivity => 'No activity yet.';
	@override String get statsAccuracy => 'Accuracy';
	@override String get statsStreak => 'Streak';
	@override String get statsLast7 => 'Last 7 days';
	@override String get statsLast30 => 'Last 30 days';
	@override String get statsSessions => 'sessions';
	@override String get statsBest => 'Best {days} days';
	@override String get statsCorrect => '{correct} / {total} correct';
	@override String get statsCorrectLabel => 'Correct';
	@override String get statsIncorrectLabel => 'Incorrect';
	@override String get statsMomentum => 'Momentum';
	@override String get statsView => 'View stats';
	@override String get statsStartToUnlock => 'Start a practice session to unlock your stats.';
	@override String get dictionaryEmpty => 'Begin searching for a word.';
	@override String get searchHint => 'Search word, kana, romaji...';
	@override String get correct => 'You got it right!';
	@override String get incorrect => 'Incorrect answer';
	@override String get oops => 'Oops, you failed...';
	@override String get errorImporting => 'Error importing: {error}';
	@override String get importedEntries => 'Imported {count} entries from {file}';
	@override String get noValidRows => 'No valid rows found.';
	@override String get dataNotFound => 'Data not found in CSV.';
	@override String get materialsNeedImport => 'Import a CSV and choose columns before practicing.';
	@override String get materialsNeedStart => 'First start a question from your material.';
	@override String get language => 'Language';
	@override String get languageSubtitle => 'Choose the app language.';
	@override String get back => 'Back';
	@override String get ok => 'OK';
	@override String get yourAnswer => 'Your answer';
	@override String get statsStreakDays => '{days} day streak';
	@override String get statsAttempts => 'attempts';
	@override String get scriptHiragana => 'Hiragana';
	@override String get scriptKatakana => 'Katakana';
	@override String get scriptKanji => 'Kanji';
	@override String get testModeDrawing => 'Drawing';
	@override String get testModeQuiz => 'Quiz';
	@override String get dictionaryNotes => 'Notes';
	@override String get dictionarySeeAlso => 'See also';
	@override String get confirmActionTitle => 'Confirm action';
	@override String get confirmActionBody => 'Are you sure you want to delete ALL the statistics?';
	@override String get cancel => 'Cancel';
	@override String get delete => 'Delete';
	@override String get searchByMeaning => 'Search by meaning';
	@override String get filterAll => 'All';
	@override String get tabStudy => 'Study';
	@override String get tabStats => 'Stats';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.studyHubTitle' => 'Study hub',
			'app.studyHubSubtitle' => 'Choose your script, then jump into learning or practice.',
			'app.paths' => 'Paths',
			'app.script' => 'Script',
			'app.difficulty' => 'Difficulty',
			'app.difficultyEasy' => 'Easy',
			'app.difficultyMedium' => 'Medium',
			'app.difficultyHard' => 'Hard',
			'app.difficultyEasyDesc' => 'Single choice',
			'app.difficultyMediumDesc' => 'Text answer',
			'app.difficultyHardDesc' => 'Drawing',
			'app.learn' => 'Learn',
			'app.learnSubtitle' => 'Explore characters and stroke order hints.',
			'app.practice' => 'Practice',
			'app.practiceSubtitle' => 'Test recognition, typing, and drawing skills.',
			'app.materials' => 'Materials',
			'app.materialsSubtitle' => 'Import a CSV and turn it into a personal drill deck.',
			'app.dictionary' => 'Dictionary',
			'app.dictionarySubtitle' => 'Search words, kana, and meanings instantly.',
			'app.statistics' => 'Statistics',
			'app.statisticsSubtitle' => 'Consistency, accuracy, and momentum by kana type.',
			'app.settings' => 'Settings',
			'app.learningDefaults' => 'Learning defaults',
			'app.testDifficulty' => 'Test difficulty',
			'app.testDifficultySubtitle' => 'Choose the level of difficulty for practice sessions.',
			'app.importCsv' => 'Import CSV',
			'app.expectedFormatTitle' => 'Expected Format',
			'app.expectedFormatBody' => 'Recommended headers:\n\nLanguage | Romaji | Hiragana | Katakana | Kanji.\n\nYou can map any column as question or answer. Use comma-separated CSV.',
			'app.fileLabel' => 'File: {name} ({count} rows)',
			'app.askWith' => 'Ask with',
			'app.answerWith' => 'Answer with',
			'app.newQuestion' => 'New Question',
			'app.checkAnswer' => 'Check Answer',
			'app.materialsEmpty' => 'Import your CSV and press "New Question" to start.',
			'app.showAnswer' => 'Show Answer',
			'app.answerPrefix' => 'Answer: {answer}',
			'app.beginSession' => 'Begin session',
			'app.practiceStartSubtitle' => 'Start a fresh round and keep the streak alive.',
			'app.testStayFocused' => 'Stay focused. Submit when ready.',
			'app.testSketchHint' => 'Sketch inside the canvas',
			'app.testTypeRomaji' => 'Type the romaji',
			'app.testTypeMeaning' => 'Type the meaning',
			'app.testRomajiLabel' => 'Romaji reading',
			'app.testMeaningLabel' => 'Meaning in English',
			'app.testTapToType' => 'Tap to type',
			'app.testDrawThe' => 'Draw the {script}',
			'app.testWhichIs' => 'Which is this {script}?',
			'app.testKanjiMeaning' => 'Meaning of this kanji?',
			'app.statsNoDataTitle' => 'No stats yet',
			'app.statsNoDataSubtitle' => 'Complete a few tests to unlock streaks and performance graphs.',
			'app.statsReset' => 'Reset stats',
			'app.statsActivity' => 'Daily activity',
			'app.statsActivitySubtitle' => 'Last 14 days',
			'app.statsEvolution' => 'Evolution',
			'app.statsEvolutionSubtitle' => 'Correct vs incorrect',
			'app.statsNoEvolution' => 'No evolution data yet.',
			'app.statsNoActivity' => 'No activity yet.',
			'app.statsAccuracy' => 'Accuracy',
			'app.statsStreak' => 'Streak',
			'app.statsLast7' => 'Last 7 days',
			'app.statsLast30' => 'Last 30 days',
			'app.statsSessions' => 'sessions',
			'app.statsBest' => 'Best {days} days',
			'app.statsCorrect' => '{correct} / {total} correct',
			'app.statsCorrectLabel' => 'Correct',
			'app.statsIncorrectLabel' => 'Incorrect',
			'app.statsMomentum' => 'Momentum',
			'app.statsView' => 'View stats',
			'app.statsStartToUnlock' => 'Start a practice session to unlock your stats.',
			'app.dictionaryEmpty' => 'Begin searching for a word.',
			'app.searchHint' => 'Search word, kana, romaji...',
			'app.correct' => 'You got it right!',
			'app.incorrect' => 'Incorrect answer',
			'app.oops' => 'Oops, you failed...',
			'app.errorImporting' => 'Error importing: {error}',
			'app.importedEntries' => 'Imported {count} entries from {file}',
			'app.noValidRows' => 'No valid rows found.',
			'app.dataNotFound' => 'Data not found in CSV.',
			'app.materialsNeedImport' => 'Import a CSV and choose columns before practicing.',
			'app.materialsNeedStart' => 'First start a question from your material.',
			'app.language' => 'Language',
			'app.languageSubtitle' => 'Choose the app language.',
			'app.back' => 'Back',
			'app.ok' => 'OK',
			'app.yourAnswer' => 'Your answer',
			'app.statsStreakDays' => '{days} day streak',
			'app.statsAttempts' => 'attempts',
			'app.scriptHiragana' => 'Hiragana',
			'app.scriptKatakana' => 'Katakana',
			'app.scriptKanji' => 'Kanji',
			'app.testModeDrawing' => 'Drawing',
			'app.testModeQuiz' => 'Quiz',
			'app.dictionaryNotes' => 'Notes',
			'app.dictionarySeeAlso' => 'See also',
			'app.confirmActionTitle' => 'Confirm action',
			'app.confirmActionBody' => 'Are you sure you want to delete ALL the statistics?',
			'app.cancel' => 'Cancel',
			'app.delete' => 'Delete',
			'app.searchByMeaning' => 'Search by meaning',
			'app.filterAll' => 'All',
			'app.tabStudy' => 'Study',
			'app.tabStats' => 'Stats',
			_ => null,
		};
	}
}
