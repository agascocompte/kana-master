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
class TranslationsRu with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppRu app = _TranslationsAppRu._(_root);
}

// Path: app
class _TranslationsAppRu implements TranslationsAppEn {
	_TranslationsAppRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get studyHubTitle => 'Учебный центр';
	@override String get studyHubSubtitle => 'Выберите систему письма и начните учиться или практиковаться.';
	@override String get paths => 'Маршруты';
	@override String get script => 'Письменность';
	@override String get difficulty => 'Сложность';
	@override String get difficultyEasy => 'Лёгкая';
	@override String get difficultyMedium => 'Средняя';
	@override String get difficultyHard => 'Сложная';
	@override String get difficultyEasyDesc => 'Один вариант';
	@override String get difficultyMediumDesc => 'Текстовый ответ';
	@override String get difficultyHardDesc => 'Рисование';
	@override String get learn => 'Обучение';
	@override String get learnSubtitle => 'Изучайте символы и подсказки по штрихам.';
	@override String get practice => 'Практика';
	@override String get practiceSubtitle => 'Распознавание, письмо и рисование.';
	@override String get materials => 'Материалы';
	@override String get materialsSubtitle => 'импортируйте csv-файл со своими данными.';
	@override String get dictionary => 'Словарь';
	@override String get dictionarySubtitle => 'Мгновенный поиск слов, каны и значений.';
	@override String get statistics => 'Статистика';
	@override String get statisticsSubtitle => 'Последовательность, точность и темп по типу каны.';
	@override String get settings => 'Настройки';
	@override String get learningDefaults => 'Параметры обучения';
	@override String get testDifficulty => 'Сложность теста';
	@override String get testDifficultySubtitle => 'Выберите сложность для практики.';
	@override String get importCsv => 'Импорт CSV';
	@override String get expectedFormatTitle => 'Ожидаемый формат';
	@override String get expectedFormatBody => 'Рекомендуемые заголовки:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nЛюбой столбец можно назначить вопросом или ответом. CSV с разделителем запятая.';
	@override String fileLabel({required Object name, required Object count}) => 'Файл: ${name} (${count} строк)';
	@override String get askWith => 'Спрашивать через';
	@override String get answerWith => 'Отвечать через';
	@override String get newQuestion => 'Новый вопрос';
	@override String get checkAnswer => 'Проверить';
	@override String get materialsEmpty => 'Импортируйте CSV и нажмите «Новый вопрос», чтобы начать.';
	@override String get showAnswer => 'Показать ответ';
	@override String answerPrefix({required Object answer}) => 'Ответ: ${answer}';
	@override String get beginSession => 'Начать сессию';
	@override String get practiceStartSubtitle => 'Начните новый раунд и поддерживайте серию.';
	@override String get testStayFocused => 'Сконцентрируйтесь и отправьте, когда будете готовы.';
	@override String get testSketchHint => 'Рисуйте внутри холста';
	@override String get testTypeRomaji => 'Введите ромадзи';
	@override String get testTypeMeaning => 'Введите значение';
	@override String get testRomajiLabel => 'Чтение ромадзи';
	@override String get testMeaningLabel => 'Значение на испанском';
	@override String get testTapToType => 'Нажмите, чтобы ввести';
	@override String testDrawThe({required Object script}) => 'Нарисуйте ${script}';
	@override String testWhichIs({required Object script}) => 'Что это за ${script}?';
	@override String get testKanjiMeaning => 'Значение этого кандзи?';
	@override String get statsNoDataTitle => 'Нет статистики';
	@override String get statsNoDataSubtitle => 'Пройдите несколько тестов, чтобы открыть серии и графики.';
	@override String get statsReset => 'Сбросить статистику';
	@override String get statsActivity => 'Ежедневная активность';
	@override String get statsActivitySubtitle => 'Последние 14 дней';
	@override String get statsEvolution => 'Динамика';
	@override String get statsEvolutionSubtitle => 'Верные vs неверные';
	@override String get statsNoEvolution => 'Нет данных о динамике.';
	@override String get statsNoActivity => 'Пока нет активности.';
	@override String get statsAccuracy => 'Точность';
	@override String get statsStreak => 'Серия';
	@override String get statsLast7 => 'Последние 7 дней';
	@override String get statsLast30 => 'Последние 30 дней';
	@override String get statsSessions => 'сессии';
	@override String statsBest({required Object days}) => 'Лучшие ${days} дней';
	@override String statsCorrect({required Object correct, required Object total}) => '${correct} / ${total} верно';
	@override String get statsCorrectLabel => 'Верно';
	@override String get statsIncorrectLabel => 'Неверно';
	@override String get statsMomentum => 'Импульс';
	@override String get statsView => 'Посмотреть статистику';
	@override String get statsStartToUnlock => 'Начните практику, чтобы открыть статистику.';
	@override String get dictionaryEmpty => 'Начните поиск слова.';
	@override String get searchHint => 'Поиск слова, каны, ромадзи...';
	@override String get correct => 'Верно!';
	@override String get incorrect => 'Неверный ответ';
	@override String get oops => 'Упс, ошибка...';
	@override String errorImporting({required Object error}) => 'Ошибка импорта: ${error}';
	@override String importedEntries({required Object count, required Object file}) => 'Импортировано ${count} записей из ${file}';
	@override String get noValidRows => 'Не найдено допустимых строк.';
	@override String get dataNotFound => 'В CSV нет данных.';
	@override String get materialsNeedImport => 'Импортируйте CSV и выберите столбцы перед практикой.';
	@override String get materialsNeedStart => 'Сначала начните вопрос с вашим материалом.';
	@override String get language => 'Язык';
	@override String get languageSubtitle => 'Выберите язык приложения.';
	@override String get back => 'Назад';
	@override String get ok => 'ОК';
	@override String get yourAnswer => 'Ваш ответ';
	@override String statsStreakDays({required Object days}) => 'Серия ${days} дней';
	@override String get statsAttempts => 'попытки';
	@override String get scriptHiragana => 'Хирагана';
	@override String get scriptKatakana => 'Катакана';
	@override String get scriptKanji => 'Кандзи';
	@override String get testModeDrawing => 'Рисование';
	@override String get testModeQuiz => 'Викторина';
	@override String get dictionaryNotes => 'Заметки';
	@override String get dictionarySeeAlso => 'См. также';
	@override String get confirmActionTitle => 'Подтвердить действие';
	@override String get confirmActionBody => 'Вы уверены, что хотите удалить ВСЮ статистику?';
	@override String get cancel => 'Отмена';
	@override String get delete => 'Удалить';
	@override String get searchByMeaning => 'Поиск по значению';
	@override String get filterAll => 'Все';
	@override String get tabStudy => 'Обучение';
	@override String get tabStats => 'Статистика';
	@override String get settingsHapticsTitle => 'Вибрация';
	@override String get settingsHapticsSubtitle => 'Вибрация при правильном или неправильном ответе.';
	@override String get settingsKanaSizeTitle => 'Размер каны';
	@override String get settingsKanaSizeSubtitle => 'Настройте размер каны в интерфейсе.';
	@override String settingsKanaSizeValue({required Object value}) => '${value}x';
	@override String get settingsKanjiJlptTitle => 'Уровень JLPT кандзи';
	@override String get settingsKanjiJlptSubtitle => 'Ограничить кандзи уровнем JLPT.';
	@override String get kanjiFilterEmpty => 'Нет кандзи для этого уровня JLPT.';
	@override String get loginTitle => 'Войдите в Kana Master';
	@override String get loginSubtitle => 'Сохраняйте прогресс, синхронизируйте между устройствами и разблокируйте премиум-функции.';
	@override String get loginApple => 'Продолжить с Apple';
	@override String get loginGoogle => 'Продолжить с Google';
	@override String get loginOr => 'или';
	@override String get loginFooter => 'Продолжая, вы принимаете Условия и Политику конфиденциальности.';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.studyHubTitle' => 'Учебный центр',
			'app.studyHubSubtitle' => 'Выберите систему письма и начните учиться или практиковаться.',
			'app.paths' => 'Маршруты',
			'app.script' => 'Письменность',
			'app.difficulty' => 'Сложность',
			'app.difficultyEasy' => 'Лёгкая',
			'app.difficultyMedium' => 'Средняя',
			'app.difficultyHard' => 'Сложная',
			'app.difficultyEasyDesc' => 'Один вариант',
			'app.difficultyMediumDesc' => 'Текстовый ответ',
			'app.difficultyHardDesc' => 'Рисование',
			'app.learn' => 'Обучение',
			'app.learnSubtitle' => 'Изучайте символы и подсказки по штрихам.',
			'app.practice' => 'Практика',
			'app.practiceSubtitle' => 'Распознавание, письмо и рисование.',
			'app.materials' => 'Материалы',
			'app.materialsSubtitle' => 'импортируйте csv-файл со своими данными.',
			'app.dictionary' => 'Словарь',
			'app.dictionarySubtitle' => 'Мгновенный поиск слов, каны и значений.',
			'app.statistics' => 'Статистика',
			'app.statisticsSubtitle' => 'Последовательность, точность и темп по типу каны.',
			'app.settings' => 'Настройки',
			'app.learningDefaults' => 'Параметры обучения',
			'app.testDifficulty' => 'Сложность теста',
			'app.testDifficultySubtitle' => 'Выберите сложность для практики.',
			'app.importCsv' => 'Импорт CSV',
			'app.expectedFormatTitle' => 'Ожидаемый формат',
			'app.expectedFormatBody' => 'Рекомендуемые заголовки:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nЛюбой столбец можно назначить вопросом или ответом. CSV с разделителем запятая.',
			'app.fileLabel' => ({required Object name, required Object count}) => 'Файл: ${name} (${count} строк)',
			'app.askWith' => 'Спрашивать через',
			'app.answerWith' => 'Отвечать через',
			'app.newQuestion' => 'Новый вопрос',
			'app.checkAnswer' => 'Проверить',
			'app.materialsEmpty' => 'Импортируйте CSV и нажмите «Новый вопрос», чтобы начать.',
			'app.showAnswer' => 'Показать ответ',
			'app.answerPrefix' => ({required Object answer}) => 'Ответ: ${answer}',
			'app.beginSession' => 'Начать сессию',
			'app.practiceStartSubtitle' => 'Начните новый раунд и поддерживайте серию.',
			'app.testStayFocused' => 'Сконцентрируйтесь и отправьте, когда будете готовы.',
			'app.testSketchHint' => 'Рисуйте внутри холста',
			'app.testTypeRomaji' => 'Введите ромадзи',
			'app.testTypeMeaning' => 'Введите значение',
			'app.testRomajiLabel' => 'Чтение ромадзи',
			'app.testMeaningLabel' => 'Значение на испанском',
			'app.testTapToType' => 'Нажмите, чтобы ввести',
			'app.testDrawThe' => ({required Object script}) => 'Нарисуйте ${script}',
			'app.testWhichIs' => ({required Object script}) => 'Что это за ${script}?',
			'app.testKanjiMeaning' => 'Значение этого кандзи?',
			'app.statsNoDataTitle' => 'Нет статистики',
			'app.statsNoDataSubtitle' => 'Пройдите несколько тестов, чтобы открыть серии и графики.',
			'app.statsReset' => 'Сбросить статистику',
			'app.statsActivity' => 'Ежедневная активность',
			'app.statsActivitySubtitle' => 'Последние 14 дней',
			'app.statsEvolution' => 'Динамика',
			'app.statsEvolutionSubtitle' => 'Верные vs неверные',
			'app.statsNoEvolution' => 'Нет данных о динамике.',
			'app.statsNoActivity' => 'Пока нет активности.',
			'app.statsAccuracy' => 'Точность',
			'app.statsStreak' => 'Серия',
			'app.statsLast7' => 'Последние 7 дней',
			'app.statsLast30' => 'Последние 30 дней',
			'app.statsSessions' => 'сессии',
			'app.statsBest' => ({required Object days}) => 'Лучшие ${days} дней',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct} / ${total} верно',
			'app.statsCorrectLabel' => 'Верно',
			'app.statsIncorrectLabel' => 'Неверно',
			'app.statsMomentum' => 'Импульс',
			'app.statsView' => 'Посмотреть статистику',
			'app.statsStartToUnlock' => 'Начните практику, чтобы открыть статистику.',
			'app.dictionaryEmpty' => 'Начните поиск слова.',
			'app.searchHint' => 'Поиск слова, каны, ромадзи...',
			'app.correct' => 'Верно!',
			'app.incorrect' => 'Неверный ответ',
			'app.oops' => 'Упс, ошибка...',
			'app.errorImporting' => ({required Object error}) => 'Ошибка импорта: ${error}',
			'app.importedEntries' => ({required Object count, required Object file}) => 'Импортировано ${count} записей из ${file}',
			'app.noValidRows' => 'Не найдено допустимых строк.',
			'app.dataNotFound' => 'В CSV нет данных.',
			'app.materialsNeedImport' => 'Импортируйте CSV и выберите столбцы перед практикой.',
			'app.materialsNeedStart' => 'Сначала начните вопрос с вашим материалом.',
			'app.language' => 'Язык',
			'app.languageSubtitle' => 'Выберите язык приложения.',
			'app.back' => 'Назад',
			'app.ok' => 'ОК',
			'app.yourAnswer' => 'Ваш ответ',
			'app.statsStreakDays' => ({required Object days}) => 'Серия ${days} дней',
			'app.statsAttempts' => 'попытки',
			'app.scriptHiragana' => 'Хирагана',
			'app.scriptKatakana' => 'Катакана',
			'app.scriptKanji' => 'Кандзи',
			'app.testModeDrawing' => 'Рисование',
			'app.testModeQuiz' => 'Викторина',
			'app.dictionaryNotes' => 'Заметки',
			'app.dictionarySeeAlso' => 'См. также',
			'app.confirmActionTitle' => 'Подтвердить действие',
			'app.confirmActionBody' => 'Вы уверены, что хотите удалить ВСЮ статистику?',
			'app.cancel' => 'Отмена',
			'app.delete' => 'Удалить',
			'app.searchByMeaning' => 'Поиск по значению',
			'app.filterAll' => 'Все',
			'app.tabStudy' => 'Обучение',
			'app.tabStats' => 'Статистика',
			'app.settingsHapticsTitle' => 'Вибрация',
			'app.settingsHapticsSubtitle' => 'Вибрация при правильном или неправильном ответе.',
			'app.settingsKanaSizeTitle' => 'Размер каны',
			'app.settingsKanaSizeSubtitle' => 'Настройте размер каны в интерфейсе.',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'Уровень JLPT кандзи',
			'app.settingsKanjiJlptSubtitle' => 'Ограничить кандзи уровнем JLPT.',
			'app.kanjiFilterEmpty' => 'Нет кандзи для этого уровня JLPT.',
			'app.loginTitle' => 'Войдите в Kana Master',
			'app.loginSubtitle' => 'Сохраняйте прогресс, синхронизируйте между устройствами и разблокируйте премиум-функции.',
			'app.loginApple' => 'Продолжить с Apple',
			'app.loginGoogle' => 'Продолжить с Google',
			'app.loginOr' => 'или',
			'app.loginFooter' => 'Продолжая, вы принимаете Условия и Политику конфиденциальности.',
			_ => null,
		};
	}
}
