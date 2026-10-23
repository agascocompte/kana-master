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
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	dynamic operator[](String key) => _meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$app$en app = Translations$app$en._(_root);
	late final Translations$exam$en exam = Translations$exam$en._(_root);
}

// Path: app
class Translations$app$en {
	Translations$app$en._(this._root);

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

	/// en: 'Haptics'
	String get settingsHapticsTitle => 'Haptics';

	/// en: 'Vibrate on correct and incorrect answers.'
	String get settingsHapticsSubtitle => 'Vibrate on correct and incorrect answers.';

	/// en: 'Kana size'
	String get settingsKanaSizeTitle => 'Kana size';

	/// en: 'Adjust the size of kana prompts and tiles.'
	String get settingsKanaSizeSubtitle => 'Adjust the size of kana prompts and tiles.';

	/// en: '${value}x'
	String settingsKanaSizeValue({required Object value}) => '${value}x';

	/// en: 'Kanji range'
	String get settingsKanjiJlptTitle => 'Kanji range';

	/// en: 'Limit kanji questions to a JLPT level.'
	String get settingsKanjiJlptSubtitle => 'Limit kanji questions to a JLPT level.';

	/// en: 'Hiragana AI model'
	String get settingsUseModelHiraganaTitle => 'Hiragana AI model';

	/// en: 'Use model recognition for hiragana drawing tests.'
	String get settingsUseModelHiraganaSubtitle => 'Use model recognition for hiragana drawing tests.';

	/// en: 'Katakana AI model'
	String get settingsUseModelKatakanaTitle => 'Katakana AI model';

	/// en: 'Use model recognition for katakana drawing tests.'
	String get settingsUseModelKatakanaSubtitle => 'Use model recognition for katakana drawing tests.';

	/// en: 'Kanji AI model'
	String get settingsUseModelKanjiTitle => 'Kanji AI model';

	/// en: 'Use model recognition for kanji drawing tests.'
	String get settingsUseModelKanjiSubtitle => 'Use model recognition for kanji drawing tests.';

	/// en: 'No kanji match this JLPT level.'
	String get kanjiFilterEmpty => 'No kanji match this JLPT level.';

	/// en: 'Stats backup'
	String get settingsBackupTitle => 'Stats backup';

	/// en: 'Export or import your progress as a JSON file.'
	String get settingsBackupSubtitle => 'Export or import your progress as a JSON file.';

	/// en: 'Export'
	String get settingsBackupExportButton => 'Export';

	/// en: 'Import'
	String get settingsBackupImportButton => 'Import';

	/// en: 'Backup exported to ${path}'
	String settingsBackupExported({required Object path}) => 'Backup exported to ${path}';

	/// en: 'Imported ${count} responses'
	String settingsBackupImported({required Object count}) => 'Imported ${count} responses';

	/// en: 'Backup error: ${error}'
	String settingsBackupError({required Object error}) => 'Backup error: ${error}';

	/// en: 'General'
	String get settingsGeneralSection => 'General';

	/// en: 'AI Models'
	String get settingsAiModelsSection => 'AI Models';

	/// en: 'Kanji'
	String get settingsKanjiFilterSection => 'Kanji';

	/// en: 'Data'
	String get settingsDataSection => 'Data';

	/// en: 'Show guide'
	String get testGuideShow => 'Show guide';

	/// en: 'Hide guide'
	String get testGuideHide => 'Hide guide';

	/// en: 'Report drawing'
	String get testReportDrawing => 'Report drawing';

	/// en: 'Do you want to send this report now?'
	String get testReportConfirmBody => 'Do you want to send this report now?';

	/// en: 'Thanks! Report prepared for review.'
	String get testReportThanks => 'Thanks! Report prepared for review.';

	/// en: 'Could not prepare report.'
	String get testReportError => 'Could not prepare report.';

	/// en: 'Follow stroke order. Enable guide if needed.'
	String get testKanjiTraceHint => 'Follow stroke order. Enable guide if needed.';

	/// en: 'AI models in drawing'
	String get aiInfoTitle => 'AI models in drawing';

	/// en: 'AI recognition may fail occasionally.'
	String get aiInfoLine1 => 'AI recognition may fail occasionally.';

	/// en: 'If it fails, disable the model to use stroke-based evaluation.'
	String get aiInfoLine2 => 'If it fails, disable the model to use stroke-based evaluation.';

	/// en: 'You can report false negatives to help improve it.'
	String get aiInfoLine3 => 'You can report false negatives to help improve it.';

	/// en: 'Premium'
	String get premiumSectionTitle => 'Premium';

	/// en: 'Unlock all features and remove ads.'
	String get premiumSectionSubtitle => 'Unlock all features and remove ads.';

	/// en: 'Upgrade'
	String get premiumOpenButton => 'Upgrade';

	/// en: 'Premium feature. Upgrade to unlock it.'
	String get premiumLockedMessage => 'Premium feature. Upgrade to unlock it.';

	/// en: 'KanaGo Premium'
	String get premiumTitle => 'KanaGo Premium';

	/// en: 'One-time purchase, all features unlocked.'
	String get premiumSubtitle => 'One-time purchase, all features unlocked.';

	/// en: 'Learn without limits'
	String get premiumHeroTitle => 'Learn without limits';

	/// en: 'Get the full experience and support the project.'
	String get premiumHeroBody => 'Get the full experience and support the project.';

	/// en: 'No ads'
	String get premiumBenefitNoAds => 'No ads';

	/// en: 'Unlimited N5 exams'
	String get premiumBenefitExams => 'Unlimited N5 exams';

	/// en: 'Access Materials mode'
	String get premiumBenefitMaterials => 'Access Materials mode';

	/// en: 'Use high difficulty'
	String get premiumBenefitHard => 'Use high difficulty';

	/// en: 'Enable AI model options'
	String get premiumBenefitAi => 'Enable AI model options';

	/// en: 'Export/import statistics'
	String get premiumBenefitBackup => 'Export/import statistics';

	/// en: 'Buy for ${price}'
	String premiumBuyButton({required Object price}) => 'Buy for ${price}';

	/// en: 'Restore purchases'
	String get premiumRestoreButton => 'Restore purchases';

	/// en: 'Premium unlocked'
	String get premiumOwnedBadge => 'Premium unlocked';

	/// en: 'Store unavailable. Try again later.'
	String get premiumStoreUnavailable => 'Store unavailable. Try again later.';

	/// en: 'Purchase failed: ${error}'
	String premiumPurchaseError({required Object error}) => 'Purchase failed: ${error}';

	/// en: 'Purchase completed. Premium unlocked.'
	String get premiumPurchased => 'Purchase completed. Premium unlocked.';

	/// en: 'Purchases restored.'
	String get premiumRestored => 'Purchases restored.';

	/// en: 'Next'
	String get testNext => 'Next';

	/// en: 'Correct answer: ${answer}'
	String testCorrectAnswerWas({required Object answer}) => 'Correct answer: ${answer}';

	/// en: 'Question ${current} of ${total}'
	String testQuestionProgress({required Object current, required Object total}) => 'Question ${current} of ${total}';

	/// en: 'Reading of this kanji?'
	String get testKanjiReading => 'Reading of this kanji?';

	/// en: 'Type the reading (kana or romaji)'
	String get testTypeReading => 'Type the reading (kana or romaji)';

	/// en: 'Session complete'
	String get sessionSummaryTitle => 'Session complete';

	/// en: 'Review complete'
	String get sessionReviewSummaryTitle => 'Review complete';

	/// en: '${correct} of ${total} correct'
	String sessionScore({required Object correct, required Object total}) => '${correct} of ${total} correct';

	/// en: 'Perfect! No mistakes.'
	String get sessionPerfect => 'Perfect! No mistakes.';

	/// en: 'To review'
	String get sessionMistakesTitle => 'To review';

	/// en: 'Review mistakes (${count})'
	String sessionReviewMistakes({required Object count}) => 'Review mistakes (${count})';

	/// en: 'New session'
	String get sessionNew => 'New session';

	/// en: 'Finish'
	String get sessionExit => 'Finish';

	/// en: 'What to practice'
	String get practiceWhat => 'What to practice';

	/// en: 'Basic'
	String get practiceRowsBasic => 'Basic';

	/// en: 'Dakuten'
	String get practiceRowsDakuten => 'Dakuten';

	/// en: 'Combinations'
	String get practiceRowsCombos => 'Combinations';

	/// en: 'All'
	String get practiceSelectAll => 'All';

	/// en: '${count} characters'
	String practiceItemsCount({required Object count}) => '${count} characters';

	/// en: 'Combinations and katakana with dakuten can't be drawn, so they're skipped in drawing mode.'
	String get practiceNotDrawable => 'Combinations and katakana with dakuten can\'t be drawn, so they\'re skipped in drawing mode.';

	/// en: 'None of the selected characters can be drawn. Choose other rows or a lower difficulty.'
	String get practiceNothingToDraw => 'None of the selected characters can be drawn. Choose other rows or a lower difficulty.';

	/// en: 'Questions per session'
	String get practiceSessionLength => 'Questions per session';

	/// en: 'Questions from'
	String get practiceSource => 'Questions from';

	/// en: 'Everything'
	String get practiceSourceAll => 'Everything';

	/// en: 'My mistakes (${count})'
	String practiceSourceMistakes({required Object count}) => 'My mistakes (${count})';

	/// en: 'Ask for'
	String get kanjiQuizMode => 'Ask for';

	/// en: 'Meaning'
	String get kanjiModeMeaning => 'Meaning';

	/// en: 'Reading'
	String get kanjiModeReading => 'Reading';

	/// en: 'Mastery'
	String get statsMasteryTitle => 'Mastery';

	/// en: 'A character is mastered after 3 correct answers in a row.'
	String get statsMasterySubtitle => 'A character is mastered after 3 correct answers in a row.';

	/// en: '${mastered} of ${total} mastered'
	String statsMasteredCount({required Object mastered, required Object total}) => '${mastered} of ${total} mastered';

	/// en: 'Mastered'
	String get statsLegendMastered => 'Mastered';

	/// en: 'Learning'
	String get statsLegendLearning => 'Learning';

	/// en: 'Needs review'
	String get statsLegendWeak => 'Needs review';

	/// en: 'Not seen yet'
	String get statsLegendNew => 'Not seen yet';

	/// en: 'Needs review'
	String get statsWeakest => 'Needs review';

	/// en: 'Dakuten'
	String get learnDakutenTitle => 'Dakuten';

	/// en: 'Combinations'
	String get learnCombosTitle => 'Combinations';

	/// en: 'Importing replaces all your current statistics. Continue?'
	String get settingsBackupImportConfirm => 'Importing replaces all your current statistics. Continue?';

	/// en: 'Results come from Jisho.org and are in English.'
	String get dictionaryEnglishNote => 'Results come from Jisho.org and are in English.';

	/// en: 'Couldn't search. Check your connection and try again.'
	String get dictionaryError => 'Couldn\'t search. Check your connection and try again.';

	/// en: '${correct} / ${total} correct'
	String materialsScore({required Object correct, required Object total}) => '${correct} / ${total} correct';

	/// en: 'Remove list'
	String get materialsClear => 'Remove list';

	/// en: 'Every JLPT level (N4–N1)'
	String get premiumBenefitJlpt => 'Every JLPT level (N4–N1)';

	/// en: 'Appearance'
	String get settingsThemeTitle => 'Appearance';

	/// en: 'Light, dark or follow the system.'
	String get settingsThemeSubtitle => 'Light, dark or follow the system.';

	/// en: 'Automatic'
	String get settingsThemeSystem => 'Automatic';

	/// en: 'Light'
	String get settingsThemeLight => 'Light';

	/// en: 'Dark'
	String get settingsThemeDark => 'Dark';

	/// en: 'Daily reminder'
	String get reminderChannelName => 'Daily reminder';

	/// en: 'A reminder at 7 pm if you haven't practiced that day.'
	String get reminderChannelDescription => 'A reminder at 7 pm if you haven\'t practiced that day.';

	/// en: '🔥 Don't lose your streak!'
	String get reminderStreakTitle => '🔥 Don\'t lose your streak!';

	/// en: 'You're on a ${days}-day streak. Practice a few minutes today to keep it going.'
	String reminderStreakBody({required Object days}) => 'You\'re on a ${days}-day streak. Practice a few minutes today to keep it going.';

	/// en: '🔥 Make it two days'
	String get reminderSecondDayTitle => '🔥 Make it two days';

	/// en: 'You practiced yesterday. Do it again today and start a streak.'
	String get reminderSecondDayBody => 'You practiced yesterday. Do it again today and start a streak.';

	/// en: 'A few minutes of Japanese?'
	String get reminderComebackTitle => 'A few minutes of Japanese?';

	/// en: 'Your kana are waiting. One short session starts a new streak.'
	String get reminderComebackBody => 'Your kana are waiting. One short session starts a new streak.';

	/// en: 'We miss you 👋'
	String get reminderLastTitle => 'We miss you 👋';

	/// en: 'Come back whenever you like: a 5-minute review already counts.'
	String get reminderLastBody => 'Come back whenever you like: a 5-minute review already counts.';

	/// en: 'Daily reminder'
	String get settingsReminderTitle => 'Daily reminder';

	/// en: 'Reminds you at 7 pm if you haven't practiced that day.'
	String get settingsReminderSubtitle => 'Reminds you at 7 pm if you haven\'t practiced that day.';

	/// en: 'KanaGo notifications are turned off. Turn them on in your system settings.'
	String get settingsReminderBlocked => 'KanaGo notifications are turned off. Turn them on in your system settings.';

	/// en: 'Ad privacy'
	String get settingsAdPrivacyTitle => 'Ad privacy';

	/// en: 'Change your consent for personalized ads.'
	String get settingsAdPrivacySubtitle => 'Change your consent for personalized ads.';
}

// Path: exam
class Translations$exam$en {
	Translations$exam$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Exam'
	String get tab => 'Exam';

	/// en: 'JLPT N5 Simulator'
	String get hubTitle => 'JLPT N5 Simulator';

	/// en: 'Practice tests in the same format as the real exam'
	String get hubSubtitle => 'Practice tests in the same format as the real exam';

	/// en: 'days until the exam'
	String get daysLeft => 'days until the exam';

	/// en: 'exams today'
	String get examsToday => 'exams today';

	/// en: 'questions seen'
	String get questionsSeen => 'questions seen';

	/// en: 'Full exam'
	String get fullExam => 'Full exam';

	/// en: '20 + 40 + 30 min · 67 questions'
	String get fullExamSubtitle => '20 + 40 + 30 min · 67 questions';

	/// en: '${minutes} min · ${count} questions'
	String sectionCardSubtitle({required Object minutes, required Object count}) => '${minutes} min · ${count} questions';

	/// en: 'Progress (full exam)'
	String get progressTitle => 'Progress (full exam)';

	/// en: 'Weak points'
	String get weakPoints => 'Weak points';

	/// en: 'Right answers by question type in your last ${count} exams'
	String weakPointsSubtitle({required Object count}) => 'Right answers by question type in your last ${count} exams';

	/// en: 'History'
	String get history => 'History';

	/// en: '${date} · Language ${language}/120 · Listening ${listening}/60'
	String historyFullDetail({required Object date, required Object language, required Object listening}) => '${date} · Language ${language}/120 · Listening ${listening}/60';

	late final Translations$exam$sections$en sections = Translations$exam$sections$en._(_root);
	late final Translations$exam$mondai$en mondai = Translations$exam$mondai$en._(_root);

	/// en: 'The exam could not be created.'
	String get createError => 'The exam could not be created.';

	/// en: 'Leave the exam?'
	String get leaveTitle => 'Leave the exam?';

	/// en: 'Your answers for this exam will be lost.'
	String get leaveBody => 'Your answers for this exam will be lost.';

	/// en: 'Continue'
	String get keepGoing => 'Continue';

	/// en: 'Leave'
	String get leave => 'Leave';

	/// en: 'Section ${current} of ${total}'
	String sectionOf({required Object current, required Object total}) => 'Section ${current} of ${total}';

	/// en: '${minutes} minutes · ${count} questions'
	String sectionInfo({required Object minutes, required Object count}) => '${minutes} minutes · ${count} questions';

	/// en: 'The audio plays on its own and only once, as in the exam. Answer during the pause after each question. Use headphones.'
	String get listeningIntro => 'The audio plays on its own and only once, as in the exam. Answer during the pause after each question. Use headphones.';

	/// en: 'You can move freely between questions. When time runs out, the section is handed in automatically.'
	String get writtenIntro => 'You can move freely between questions. When time runs out, the section is handed in automatically.';

	/// en: 'Start'
	String get start => 'Start';

	/// en: 'Time is up'
	String get timeUp => 'Time is up';

	/// en: 'Hand in the section?'
	String get submitTitle => 'Hand in the section?';

	/// en: 'You have answered every question.'
	String get submitAllAnswered => 'You have answered every question.';

	/// en: 'Unanswered questions: ${count}.'
	String submitUnanswered({required Object count}) => 'Unanswered questions: ${count}.';

	/// en: 'Hand in'
	String get submit => 'Hand in';

	/// en: 'Previous'
	String get previous => 'Previous';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Question ${current} of ${total}'
	String questionOf({required Object current, required Object total}) => 'Question ${current} of ${total}';

	/// en: 'Result'
	String get resultTitle => 'Result';

	/// en: 'Review answers'
	String get reviewAnswers => 'Review answers';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Pass'
	String get passed => 'Pass';

	/// en: 'Fail'
	String get failed => 'Fail';

	/// en: 'Estimated score: every question counts the same. A pass needs 80/180 and at least 38 and 19 in each part.'
	String get scoreNote => 'Estimated score: every question counts the same. A pass needs 80/180 and at least 38 and 19 in each part.';

	/// en: '${correct} of ${total} correct'
	String correctOf({required Object correct, required Object total}) => '${correct} of ${total} correct';

	/// en: 'Minimum to pass the listening: 19/60 (32%). To be safe, aim for more than 60%.'
	String get listeningHint => 'Minimum to pass the listening: 19/60 (32%). To be safe, aim for more than 60%.';

	/// en: 'Minimum for the language part: 38/120 (32%). To be safe, aim for more than 60%.'
	String get languageHint => 'Minimum for the language part: 38/120 (32%). To be safe, aim for more than 60%.';

	/// en: 'Review'
	String get reviewTitle => 'Review';

	/// en: 'Mistakes only'
	String get onlyMistakes => 'Mistakes only';

	/// en: 'No mistakes!'
	String get noMistakes => 'No mistakes!';

	/// en: 'Not answered'
	String get unanswered => 'Not answered';

	/// en: 'Correct'
	String get correct => 'Correct';

	/// en: 'Incorrect'
	String get incorrect => 'Incorrect';

	/// en: 'Translation'
	String get translation => 'Translation';

	/// en: 'Show translation of the text'
	String get showTextTranslation => 'Show translation of the text';

	/// en: 'Hide translation of the text'
	String get hideTextTranslation => 'Hide translation of the text';

	/// en: 'Listen'
	String get listen => 'Listen';

	/// en: 'Stop'
	String get stop => 'Stop';

	/// en: 'Instructions'
	String get instructions => 'Instructions';

	/// en: 'Listening…'
	String get listening => 'Listening…';

	/// en: 'Answer · ${seconds} s'
	String answerNow({required Object seconds}) => 'Answer · ${seconds} s';

	/// en: 'Paused'
	String get paused => 'Paused';

	/// en: 'Resume'
	String get resume => 'Resume';

	/// en: 'Pause'
	String get pause => 'Pause';

	/// en: '1 free exam a day · Unlimited with Premium'
	String get freeDaily => '1 free exam a day · Unlimited with Premium';

	/// en: 'You've done today's exam'
	String get dailyLimitTitle => 'You\'ve done today\'s exam';

	/// en: 'Without Premium you get one free exam a day. With Premium you can take as many as you like.'
	String get dailyLimitBody => 'Without Premium you get one free exam a day. With Premium you can take as many as you like.';

	/// en: 'See Premium'
	String get dailyLimitUpgrade => 'See Premium';

	/// en: 'Not now'
	String get dailyLimitLater => 'Not now';
}

// Path: exam.sections
class Translations$exam$sections$en {
	Translations$exam$sections$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Vocabulary and writing'
	String get vocabulary => 'Vocabulary and writing';

	/// en: 'Grammar and reading'
	String get grammarReading => 'Grammar and reading';

	/// en: 'Listening'
	String get listening => 'Listening';
}

// Path: exam.mondai
class Translations$exam$mondai$en {
	Translations$exam$mondai$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Kanji reading'
	String get kanjiReading => 'Kanji reading';

	/// en: 'Writing'
	String get orthography => 'Writing';

	/// en: 'Vocabulary in context'
	String get contextual => 'Vocabulary in context';

	/// en: 'Paraphrase'
	String get paraphrase => 'Paraphrase';

	/// en: 'Grammar form'
	String get grammarForm => 'Grammar form';

	/// en: 'Sentence order'
	String get sentenceOrder => 'Sentence order';

	/// en: 'Text grammar'
	String get textGrammar => 'Text grammar';

	/// en: 'Short passages'
	String get shortReading => 'Short passages';

	/// en: 'Medium passage'
	String get midReading => 'Medium passage';

	/// en: 'Information retrieval'
	String get infoSearch => 'Information retrieval';

	/// en: 'Task-based listening'
	String get taskListening => 'Task-based listening';

	/// en: 'Key-point listening'
	String get pointListening => 'Key-point listening';

	/// en: 'Verbal expressions'
	String get utterance => 'Verbal expressions';

	/// en: 'Quick response'
	String get quickResponse => 'Quick response';
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
			'app.settingsHapticsTitle' => 'Haptics',
			'app.settingsHapticsSubtitle' => 'Vibrate on correct and incorrect answers.',
			'app.settingsKanaSizeTitle' => 'Kana size',
			'app.settingsKanaSizeSubtitle' => 'Adjust the size of kana prompts and tiles.',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'Kanji range',
			'app.settingsKanjiJlptSubtitle' => 'Limit kanji questions to a JLPT level.',
			'app.settingsUseModelHiraganaTitle' => 'Hiragana AI model',
			'app.settingsUseModelHiraganaSubtitle' => 'Use model recognition for hiragana drawing tests.',
			'app.settingsUseModelKatakanaTitle' => 'Katakana AI model',
			'app.settingsUseModelKatakanaSubtitle' => 'Use model recognition for katakana drawing tests.',
			'app.settingsUseModelKanjiTitle' => 'Kanji AI model',
			'app.settingsUseModelKanjiSubtitle' => 'Use model recognition for kanji drawing tests.',
			'app.kanjiFilterEmpty' => 'No kanji match this JLPT level.',
			'app.settingsBackupTitle' => 'Stats backup',
			'app.settingsBackupSubtitle' => 'Export or import your progress as a JSON file.',
			'app.settingsBackupExportButton' => 'Export',
			'app.settingsBackupImportButton' => 'Import',
			'app.settingsBackupExported' => ({required Object path}) => 'Backup exported to ${path}',
			'app.settingsBackupImported' => ({required Object count}) => 'Imported ${count} responses',
			'app.settingsBackupError' => ({required Object error}) => 'Backup error: ${error}',
			'app.settingsGeneralSection' => 'General',
			'app.settingsAiModelsSection' => 'AI Models',
			'app.settingsKanjiFilterSection' => 'Kanji',
			'app.settingsDataSection' => 'Data',
			'app.testGuideShow' => 'Show guide',
			'app.testGuideHide' => 'Hide guide',
			'app.testReportDrawing' => 'Report drawing',
			'app.testReportConfirmBody' => 'Do you want to send this report now?',
			'app.testReportThanks' => 'Thanks! Report prepared for review.',
			'app.testReportError' => 'Could not prepare report.',
			'app.testKanjiTraceHint' => 'Follow stroke order. Enable guide if needed.',
			'app.aiInfoTitle' => 'AI models in drawing',
			'app.aiInfoLine1' => 'AI recognition may fail occasionally.',
			'app.aiInfoLine2' => 'If it fails, disable the model to use stroke-based evaluation.',
			'app.aiInfoLine3' => 'You can report false negatives to help improve it.',
			'app.premiumSectionTitle' => 'Premium',
			'app.premiumSectionSubtitle' => 'Unlock all features and remove ads.',
			'app.premiumOpenButton' => 'Upgrade',
			'app.premiumLockedMessage' => 'Premium feature. Upgrade to unlock it.',
			'app.premiumTitle' => 'KanaGo Premium',
			'app.premiumSubtitle' => 'One-time purchase, all features unlocked.',
			'app.premiumHeroTitle' => 'Learn without limits',
			'app.premiumHeroBody' => 'Get the full experience and support the project.',
			'app.premiumBenefitNoAds' => 'No ads',
			'app.premiumBenefitExams' => 'Unlimited N5 exams',
			'app.premiumBenefitMaterials' => 'Access Materials mode',
			'app.premiumBenefitHard' => 'Use high difficulty',
			'app.premiumBenefitAi' => 'Enable AI model options',
			'app.premiumBenefitBackup' => 'Export/import statistics',
			'app.premiumBuyButton' => ({required Object price}) => 'Buy for ${price}',
			'app.premiumRestoreButton' => 'Restore purchases',
			'app.premiumOwnedBadge' => 'Premium unlocked',
			'app.premiumStoreUnavailable' => 'Store unavailable. Try again later.',
			'app.premiumPurchaseError' => ({required Object error}) => 'Purchase failed: ${error}',
			'app.premiumPurchased' => 'Purchase completed. Premium unlocked.',
			'app.premiumRestored' => 'Purchases restored.',
			'app.testNext' => 'Next',
			'app.testCorrectAnswerWas' => ({required Object answer}) => 'Correct answer: ${answer}',
			'app.testQuestionProgress' => ({required Object current, required Object total}) => 'Question ${current} of ${total}',
			'app.testKanjiReading' => 'Reading of this kanji?',
			'app.testTypeReading' => 'Type the reading (kana or romaji)',
			'app.sessionSummaryTitle' => 'Session complete',
			'app.sessionReviewSummaryTitle' => 'Review complete',
			'app.sessionScore' => ({required Object correct, required Object total}) => '${correct} of ${total} correct',
			'app.sessionPerfect' => 'Perfect! No mistakes.',
			'app.sessionMistakesTitle' => 'To review',
			'app.sessionReviewMistakes' => ({required Object count}) => 'Review mistakes (${count})',
			'app.sessionNew' => 'New session',
			'app.sessionExit' => 'Finish',
			'app.practiceWhat' => 'What to practice',
			'app.practiceRowsBasic' => 'Basic',
			'app.practiceRowsDakuten' => 'Dakuten',
			'app.practiceRowsCombos' => 'Combinations',
			'app.practiceSelectAll' => 'All',
			'app.practiceItemsCount' => ({required Object count}) => '${count} characters',
			'app.practiceNotDrawable' => 'Combinations and katakana with dakuten can\'t be drawn, so they\'re skipped in drawing mode.',
			'app.practiceNothingToDraw' => 'None of the selected characters can be drawn. Choose other rows or a lower difficulty.',
			'app.practiceSessionLength' => 'Questions per session',
			'app.practiceSource' => 'Questions from',
			'app.practiceSourceAll' => 'Everything',
			'app.practiceSourceMistakes' => ({required Object count}) => 'My mistakes (${count})',
			'app.kanjiQuizMode' => 'Ask for',
			'app.kanjiModeMeaning' => 'Meaning',
			'app.kanjiModeReading' => 'Reading',
			'app.statsMasteryTitle' => 'Mastery',
			'app.statsMasterySubtitle' => 'A character is mastered after 3 correct answers in a row.',
			'app.statsMasteredCount' => ({required Object mastered, required Object total}) => '${mastered} of ${total} mastered',
			'app.statsLegendMastered' => 'Mastered',
			'app.statsLegendLearning' => 'Learning',
			'app.statsLegendWeak' => 'Needs review',
			'app.statsLegendNew' => 'Not seen yet',
			'app.statsWeakest' => 'Needs review',
			'app.learnDakutenTitle' => 'Dakuten',
			'app.learnCombosTitle' => 'Combinations',
			'app.settingsBackupImportConfirm' => 'Importing replaces all your current statistics. Continue?',
			'app.dictionaryEnglishNote' => 'Results come from Jisho.org and are in English.',
			'app.dictionaryError' => 'Couldn\'t search. Check your connection and try again.',
			'app.materialsScore' => ({required Object correct, required Object total}) => '${correct} / ${total} correct',
			'app.materialsClear' => 'Remove list',
			'app.premiumBenefitJlpt' => 'Every JLPT level (N4–N1)',
			'app.settingsThemeTitle' => 'Appearance',
			'app.settingsThemeSubtitle' => 'Light, dark or follow the system.',
			'app.settingsThemeSystem' => 'Automatic',
			'app.settingsThemeLight' => 'Light',
			'app.settingsThemeDark' => 'Dark',
			'app.reminderChannelName' => 'Daily reminder',
			'app.reminderChannelDescription' => 'A reminder at 7 pm if you haven\'t practiced that day.',
			'app.reminderStreakTitle' => '🔥 Don\'t lose your streak!',
			'app.reminderStreakBody' => ({required Object days}) => 'You\'re on a ${days}-day streak. Practice a few minutes today to keep it going.',
			'app.reminderSecondDayTitle' => '🔥 Make it two days',
			'app.reminderSecondDayBody' => 'You practiced yesterday. Do it again today and start a streak.',
			'app.reminderComebackTitle' => 'A few minutes of Japanese?',
			'app.reminderComebackBody' => 'Your kana are waiting. One short session starts a new streak.',
			'app.reminderLastTitle' => 'We miss you 👋',
			'app.reminderLastBody' => 'Come back whenever you like: a 5-minute review already counts.',
			'app.settingsReminderTitle' => 'Daily reminder',
			'app.settingsReminderSubtitle' => 'Reminds you at 7 pm if you haven\'t practiced that day.',
			'app.settingsReminderBlocked' => 'KanaGo notifications are turned off. Turn them on in your system settings.',
			'app.settingsAdPrivacyTitle' => 'Ad privacy',
			'app.settingsAdPrivacySubtitle' => 'Change your consent for personalized ads.',
			'exam.tab' => 'Exam',
			'exam.hubTitle' => 'JLPT N5 Simulator',
			'exam.hubSubtitle' => 'Practice tests in the same format as the real exam',
			'exam.daysLeft' => 'days until the exam',
			'exam.examsToday' => 'exams today',
			'exam.questionsSeen' => 'questions seen',
			'exam.fullExam' => 'Full exam',
			'exam.fullExamSubtitle' => '20 + 40 + 30 min · 67 questions',
			'exam.sectionCardSubtitle' => ({required Object minutes, required Object count}) => '${minutes} min · ${count} questions',
			'exam.progressTitle' => 'Progress (full exam)',
			'exam.weakPoints' => 'Weak points',
			'exam.weakPointsSubtitle' => ({required Object count}) => 'Right answers by question type in your last ${count} exams',
			'exam.history' => 'History',
			'exam.historyFullDetail' => ({required Object date, required Object language, required Object listening}) => '${date} · Language ${language}/120 · Listening ${listening}/60',
			'exam.sections.vocabulary' => 'Vocabulary and writing',
			'exam.sections.grammarReading' => 'Grammar and reading',
			'exam.sections.listening' => 'Listening',
			'exam.mondai.kanjiReading' => 'Kanji reading',
			'exam.mondai.orthography' => 'Writing',
			'exam.mondai.contextual' => 'Vocabulary in context',
			'exam.mondai.paraphrase' => 'Paraphrase',
			'exam.mondai.grammarForm' => 'Grammar form',
			'exam.mondai.sentenceOrder' => 'Sentence order',
			'exam.mondai.textGrammar' => 'Text grammar',
			'exam.mondai.shortReading' => 'Short passages',
			'exam.mondai.midReading' => 'Medium passage',
			'exam.mondai.infoSearch' => 'Information retrieval',
			'exam.mondai.taskListening' => 'Task-based listening',
			'exam.mondai.pointListening' => 'Key-point listening',
			'exam.mondai.utterance' => 'Verbal expressions',
			'exam.mondai.quickResponse' => 'Quick response',
			'exam.createError' => 'The exam could not be created.',
			'exam.leaveTitle' => 'Leave the exam?',
			'exam.leaveBody' => 'Your answers for this exam will be lost.',
			'exam.keepGoing' => 'Continue',
			'exam.leave' => 'Leave',
			'exam.sectionOf' => ({required Object current, required Object total}) => 'Section ${current} of ${total}',
			'exam.sectionInfo' => ({required Object minutes, required Object count}) => '${minutes} minutes · ${count} questions',
			'exam.listeningIntro' => 'The audio plays on its own and only once, as in the exam. Answer during the pause after each question. Use headphones.',
			'exam.writtenIntro' => 'You can move freely between questions. When time runs out, the section is handed in automatically.',
			'exam.start' => 'Start',
			'exam.timeUp' => 'Time is up',
			'exam.submitTitle' => 'Hand in the section?',
			'exam.submitAllAnswered' => 'You have answered every question.',
			'exam.submitUnanswered' => ({required Object count}) => 'Unanswered questions: ${count}.',
			'exam.submit' => 'Hand in',
			'exam.previous' => 'Previous',
			'exam.next' => 'Next',
			'exam.questionOf' => ({required Object current, required Object total}) => 'Question ${current} of ${total}',
			'exam.resultTitle' => 'Result',
			'exam.reviewAnswers' => 'Review answers',
			'exam.back' => 'Back',
			'exam.passed' => 'Pass',
			'exam.failed' => 'Fail',
			'exam.scoreNote' => 'Estimated score: every question counts the same. A pass needs 80/180 and at least 38 and 19 in each part.',
			'exam.correctOf' => ({required Object correct, required Object total}) => '${correct} of ${total} correct',
			'exam.listeningHint' => 'Minimum to pass the listening: 19/60 (32%). To be safe, aim for more than 60%.',
			'exam.languageHint' => 'Minimum for the language part: 38/120 (32%). To be safe, aim for more than 60%.',
			'exam.reviewTitle' => 'Review',
			'exam.onlyMistakes' => 'Mistakes only',
			'exam.noMistakes' => 'No mistakes!',
			'exam.unanswered' => 'Not answered',
			'exam.correct' => 'Correct',
			'exam.incorrect' => 'Incorrect',
			'exam.translation' => 'Translation',
			'exam.showTextTranslation' => 'Show translation of the text',
			'exam.hideTextTranslation' => 'Hide translation of the text',
			'exam.listen' => 'Listen',
			'exam.stop' => 'Stop',
			'exam.instructions' => 'Instructions',
			'exam.listening' => 'Listening…',
			'exam.answerNow' => ({required Object seconds}) => 'Answer · ${seconds} s',
			'exam.paused' => 'Paused',
			'exam.resume' => 'Resume',
			'exam.pause' => 'Pause',
			'exam.freeDaily' => '1 free exam a day · Unlimited with Premium',
			'exam.dailyLimitTitle' => 'You\'ve done today\'s exam',
			'exam.dailyLimitBody' => 'Without Premium you get one free exam a day. With Premium you can take as many as you like.',
			'exam.dailyLimitUpgrade' => 'See Premium',
			'exam.dailyLimitLater' => 'Not now',
			_ => null,
		};
	}
}
