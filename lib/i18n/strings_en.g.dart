///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAppEn app = TranslationsAppEn._(_root);
}

// Path: app
class TranslationsAppEn {
	TranslationsAppEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Study hub'
	String get studyHubTitle => 'Study hub';

	/// en: 'Choose your script, then jump into learning or practice.'
	String get studyHubSubtitle => 'Choose your script, then jump into learning or practice.';

	/// en: 'Paths'
	String get paths => 'Paths';

	/// en: 'Script'
	String get script => 'Script';

	/// en: 'Difficulty'
	String get difficulty => 'Difficulty';

	/// en: 'Easy'
	String get difficultyEasy => 'Easy';

	/// en: 'Medium'
	String get difficultyMedium => 'Medium';

	/// en: 'Hard'
	String get difficultyHard => 'Hard';

	/// en: 'Single choice'
	String get difficultyEasyDesc => 'Single choice';

	/// en: 'Text answer'
	String get difficultyMediumDesc => 'Text answer';

	/// en: 'Drawing'
	String get difficultyHardDesc => 'Drawing';

	/// en: 'Learn'
	String get learn => 'Learn';

	/// en: 'Explore characters and stroke order hints.'
	String get learnSubtitle => 'Explore characters and stroke order hints.';

	/// en: 'Practice'
	String get practice => 'Practice';

	/// en: 'Test recognition, typing, and drawing skills.'
	String get practiceSubtitle => 'Test recognition, typing, and drawing skills.';

	/// en: 'Materials'
	String get materials => 'Materials';

	/// en: 'Import a CSV file with your own data.'
	String get materialsSubtitle => 'Import a CSV file with your own data.';

	/// en: 'Dictionary'
	String get dictionary => 'Dictionary';

	/// en: 'Search words, kana, and meanings instantly.'
	String get dictionarySubtitle => 'Search words, kana, and meanings instantly.';

	/// en: 'Statistics'
	String get statistics => 'Statistics';

	/// en: 'Consistency, accuracy, and momentum by kana type.'
	String get statisticsSubtitle => 'Consistency, accuracy, and momentum by kana type.';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Learning defaults'
	String get learningDefaults => 'Learning defaults';

	/// en: 'Test difficulty'
	String get testDifficulty => 'Test difficulty';

	/// en: 'Choose the level of difficulty for practice sessions.'
	String get testDifficultySubtitle => 'Choose the level of difficulty for practice sessions.';

	/// en: 'Import CSV'
	String get importCsv => 'Import CSV';

	/// en: 'Expected Format'
	String get expectedFormatTitle => 'Expected Format';

	/// en: 'Recommended headers: Language | Romaji | Hiragana | Katakana | Kanji. You can map any column as question or answer. Use comma-separated CSV.'
	String get expectedFormatBody => 'Recommended headers:\n\nLanguage | Romaji | Hiragana | Katakana | Kanji.\n\nYou can map any column as question or answer. Use comma-separated CSV.';

	/// en: 'File: ${name} (${count} rows)'
	String fileLabel({required Object name, required Object count}) => 'File: ${name} (${count} rows)';

	/// en: 'Ask with'
	String get askWith => 'Ask with';

	/// en: 'Answer with'
	String get answerWith => 'Answer with';

	/// en: 'New Question'
	String get newQuestion => 'New Question';

	/// en: 'Check Answer'
	String get checkAnswer => 'Check Answer';

	/// en: 'Import your CSV and press "New Question" to start.'
	String get materialsEmpty => 'Import your CSV and press "New Question" to start.';

	/// en: 'Show Answer'
	String get showAnswer => 'Show Answer';

	/// en: 'Answer: ${answer}'
	String answerPrefix({required Object answer}) => 'Answer: ${answer}';

	/// en: 'Begin session'
	String get beginSession => 'Begin session';

	/// en: 'Start a fresh round and keep the streak alive.'
	String get practiceStartSubtitle => 'Start a fresh round and keep the streak alive.';

	/// en: 'Stay focused. Submit when ready.'
	String get testStayFocused => 'Stay focused. Submit when ready.';

	/// en: 'Sketch inside the canvas'
	String get testSketchHint => 'Sketch inside the canvas';

	/// en: 'Type the romaji'
	String get testTypeRomaji => 'Type the romaji';

	/// en: 'Type the meaning'
	String get testTypeMeaning => 'Type the meaning';

	/// en: 'Romaji reading'
	String get testRomajiLabel => 'Romaji reading';

	/// en: 'Meaning in English'
	String get testMeaningLabel => 'Meaning in English';

	/// en: 'Tap to type'
	String get testTapToType => 'Tap to type';

	/// en: 'Draw the ${script}'
	String testDrawThe({required Object script}) => 'Draw the ${script}';

	/// en: 'Which is this ${script}?'
	String testWhichIs({required Object script}) => 'Which is this ${script}?';

	/// en: 'Meaning of this kanji?'
	String get testKanjiMeaning => 'Meaning of this kanji?';

	/// en: 'No stats yet'
	String get statsNoDataTitle => 'No stats yet';

	/// en: 'Complete a few tests to unlock streaks and performance graphs.'
	String get statsNoDataSubtitle => 'Complete a few tests to unlock streaks and performance graphs.';

	/// en: 'Reset stats'
	String get statsReset => 'Reset stats';

	/// en: 'Daily activity'
	String get statsActivity => 'Daily activity';

	/// en: 'Last 14 days'
	String get statsActivitySubtitle => 'Last 14 days';

	/// en: 'Evolution'
	String get statsEvolution => 'Evolution';

	/// en: 'Correct vs incorrect'
	String get statsEvolutionSubtitle => 'Correct vs incorrect';

	/// en: 'No evolution data yet.'
	String get statsNoEvolution => 'No evolution data yet.';

	/// en: 'No activity yet.'
	String get statsNoActivity => 'No activity yet.';

	/// en: 'Accuracy'
	String get statsAccuracy => 'Accuracy';

	/// en: 'Streak'
	String get statsStreak => 'Streak';

	/// en: 'Last 7 days'
	String get statsLast7 => 'Last 7 days';

	/// en: 'Last 30 days'
	String get statsLast30 => 'Last 30 days';

	/// en: 'sessions'
	String get statsSessions => 'sessions';

	/// en: 'Best ${days} days'
	String statsBest({required Object days}) => 'Best ${days} days';

	/// en: '${correct} / ${total} correct'
	String statsCorrect({required Object correct, required Object total}) => '${correct} / ${total} correct';

	/// en: 'Correct'
	String get statsCorrectLabel => 'Correct';

	/// en: 'Incorrect'
	String get statsIncorrectLabel => 'Incorrect';

	/// en: 'Momentum'
	String get statsMomentum => 'Momentum';

	/// en: 'View stats'
	String get statsView => 'View stats';

	/// en: 'Start a practice session to unlock your stats.'
	String get statsStartToUnlock => 'Start a practice session to unlock your stats.';

	/// en: 'Begin searching for a word.'
	String get dictionaryEmpty => 'Begin searching for a word.';

	/// en: 'Search word, kana, romaji...'
	String get searchHint => 'Search word, kana, romaji...';

	/// en: 'You got it right!'
	String get correct => 'You got it right!';

	/// en: 'Incorrect answer'
	String get incorrect => 'Incorrect answer';

	/// en: 'Oops, you failed...'
	String get oops => 'Oops, you failed...';

	/// en: 'Error importing: ${error}'
	String errorImporting({required Object error}) => 'Error importing: ${error}';

	/// en: 'Imported ${count} entries from ${file}'
	String importedEntries({required Object count, required Object file}) => 'Imported ${count} entries from ${file}';

	/// en: 'No valid rows found.'
	String get noValidRows => 'No valid rows found.';

	/// en: 'Data not found in CSV.'
	String get dataNotFound => 'Data not found in CSV.';

	/// en: 'Import a CSV and choose columns before practicing.'
	String get materialsNeedImport => 'Import a CSV and choose columns before practicing.';

	/// en: 'First start a question from your material.'
	String get materialsNeedStart => 'First start a question from your material.';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Choose the app language.'
	String get languageSubtitle => 'Choose the app language.';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'OK'
	String get ok => 'OK';

	/// en: 'Your answer'
	String get yourAnswer => 'Your answer';

	/// en: '${days} day streak'
	String statsStreakDays({required Object days}) => '${days} day streak';

	/// en: 'attempts'
	String get statsAttempts => 'attempts';

	/// en: 'Hiragana'
	String get scriptHiragana => 'Hiragana';

	/// en: 'Katakana'
	String get scriptKatakana => 'Katakana';

	/// en: 'Kanji'
	String get scriptKanji => 'Kanji';

	/// en: 'Drawing'
	String get testModeDrawing => 'Drawing';

	/// en: 'Quiz'
	String get testModeQuiz => 'Quiz';

	/// en: 'Notes'
	String get dictionaryNotes => 'Notes';

	/// en: 'See also'
	String get dictionarySeeAlso => 'See also';

	/// en: 'Confirm action'
	String get confirmActionTitle => 'Confirm action';

	/// en: 'Are you sure you want to delete ALL the statistics?'
	String get confirmActionBody => 'Are you sure you want to delete ALL the statistics?';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Search by meaning'
	String get searchByMeaning => 'Search by meaning';

	/// en: 'All'
	String get filterAll => 'All';

	/// en: 'Study'
	String get tabStudy => 'Study';

	/// en: 'Stats'
	String get tabStats => 'Stats';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
			'app.materialsSubtitle' => 'Import a CSV file with your own data.',
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
			'app.fileLabel' => ({required Object name, required Object count}) => 'File: ${name} (${count} rows)',
			'app.askWith' => 'Ask with',
			'app.answerWith' => 'Answer with',
			'app.newQuestion' => 'New Question',
			'app.checkAnswer' => 'Check Answer',
			'app.materialsEmpty' => 'Import your CSV and press "New Question" to start.',
			'app.showAnswer' => 'Show Answer',
			'app.answerPrefix' => ({required Object answer}) => 'Answer: ${answer}',
			'app.beginSession' => 'Begin session',
			'app.practiceStartSubtitle' => 'Start a fresh round and keep the streak alive.',
			'app.testStayFocused' => 'Stay focused. Submit when ready.',
			'app.testSketchHint' => 'Sketch inside the canvas',
			'app.testTypeRomaji' => 'Type the romaji',
			'app.testTypeMeaning' => 'Type the meaning',
			'app.testRomajiLabel' => 'Romaji reading',
			'app.testMeaningLabel' => 'Meaning in English',
			'app.testTapToType' => 'Tap to type',
			'app.testDrawThe' => ({required Object script}) => 'Draw the ${script}',
			'app.testWhichIs' => ({required Object script}) => 'Which is this ${script}?',
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
			'app.statsBest' => ({required Object days}) => 'Best ${days} days',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct} / ${total} correct',
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
			'app.errorImporting' => ({required Object error}) => 'Error importing: ${error}',
			'app.importedEntries' => ({required Object count, required Object file}) => 'Imported ${count} entries from ${file}',
			'app.noValidRows' => 'No valid rows found.',
			'app.dataNotFound' => 'Data not found in CSV.',
			'app.materialsNeedImport' => 'Import a CSV and choose columns before practicing.',
			'app.materialsNeedStart' => 'First start a question from your material.',
			'app.language' => 'Language',
			'app.languageSubtitle' => 'Choose the app language.',
			'app.back' => 'Back',
			'app.ok' => 'OK',
			'app.yourAnswer' => 'Your answer',
			'app.statsStreakDays' => ({required Object days}) => '${days} day streak',
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
