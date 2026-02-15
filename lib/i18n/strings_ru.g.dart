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
	@override String get studyHubTitle => 'Центр обучения';
	@override String get studyHubSubtitle => 'Выберите письменность и начните учиться или практиковаться.';
	@override String get paths => 'Курсы';
	@override String get script => 'Письменность';
	@override String get difficulty => 'Сложность';
	@override String get difficultyEasy => 'Лёгкая';
	@override String get difficultyMedium => 'Средняя';
	@override String get difficultyHard => 'Сложная';
	@override String get difficultyEasyDesc => 'Один вариант';
	@override String get difficultyMediumDesc => 'Текст';
	@override String get difficultyHardDesc => 'Рисование';
	@override String get learn => 'Учить';
	@override String get learnSubtitle => 'Изучайте символы и порядок штрихов.';
	@override String get practice => 'Практика';
	@override String get practiceSubtitle => 'Распознавание, ввод и рисование.';
	@override String get materials => 'Материалы';
	@override String get materialsSubtitle => 'Импортируйте CSV со своими данными.';
	@override String get dictionary => 'Словарь';
	@override String get dictionarySubtitle => 'Поиск слов, каны и значений.';
	@override String get statistics => 'Статистика';
	@override String get statisticsSubtitle => 'Точность, серия и темп обучения.';
	@override String get settings => 'Настройки';
	@override String get learningDefaults => 'Параметры обучения';
	@override String get testDifficulty => 'Сложность теста';
	@override String get testDifficultySubtitle => 'Выберите сложность практики.';
	@override String get importCsv => 'Импорт CSV';
	@override String get expectedFormatTitle => 'Ожидаемый формат';
	@override String get expectedFormatBody => 'Рекомендуемые заголовки:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nЛюбой столбец можно использовать как вопрос или ответ. CSV через запятую.';
	@override String fileLabel({required Object name, required Object count}) => 'Файл: ${name} (${count})';
	@override String get askWith => 'Вопрос';
	@override String get answerWith => 'Ответ';
	@override String get newQuestion => 'Новый вопрос';
	@override String get checkAnswer => 'Проверить';
	@override String get materialsEmpty => 'Импортируйте CSV и нажмите «Новый вопрос».';
	@override String get showAnswer => 'Показать ответ';
	@override String answerPrefix({required Object answer}) => 'Ответ: ${answer}';
	@override String get beginSession => 'Начать';
	@override String get practiceStartSubtitle => 'Начните новую сессию.';
	@override String get testStayFocused => 'Сосредоточьтесь и отправьте, когда будете готовы.';
	@override String get testSketchHint => 'Рисуйте внутри области';
	@override String get testTypeRomaji => 'Введите ромадзи';
	@override String get testTypeMeaning => 'Введите значение';
	@override String get testRomajiLabel => 'Чтение ромадзи';
	@override String get testMeaningLabel => 'Значение на испанском';
	@override String get testTapToType => 'Нажмите для ввода';
	@override String testDrawThe({required Object script}) => 'Нарисуйте ${script}';
	@override String testWhichIs({required Object script}) => 'Что это за ${script}?';
	@override String get testKanjiMeaning => 'Значение этого кандзи?';
	@override String get statsNoDataTitle => 'Нет статистики';
	@override String get statsNoDataSubtitle => 'Пройдите тесты, чтобы увидеть статистику.';
	@override String get statsReset => 'Сбросить статистику';
	@override String get statsActivity => 'Активность';
	@override String get statsActivitySubtitle => 'Последние 14 дней';
	@override String get statsEvolution => 'Динамика';
	@override String get statsEvolutionSubtitle => 'Верно vs неверно';
	@override String get statsNoEvolution => 'Нет данных.';
	@override String get statsNoActivity => 'Пока нет активности.';
	@override String get statsAccuracy => 'Точность';
	@override String get statsStreak => 'Серия';
	@override String get statsLast7 => '7 дней';
	@override String get statsLast30 => '30 дней';
	@override String get statsSessions => 'сессии';
	@override String statsBest({required Object days}) => 'Лучшие ${days} дней';
	@override String statsCorrect({required Object correct, required Object total}) => '${correct}/${total} верно';
	@override String get statsCorrectLabel => 'Верно';
	@override String get statsIncorrectLabel => 'Неверно';
	@override String get statsMomentum => 'Темп';
	@override String get statsView => 'Показать статистику';
	@override String get statsStartToUnlock => 'Начните практику, чтобы увидеть статистику.';
	@override String get dictionaryEmpty => 'Начните поиск слова.';
	@override String get searchHint => 'Поиск слова, каны, ромадзи...';
	@override String get correct => 'Верно!';
	@override String get incorrect => 'Неверно';
	@override String get oops => 'Ой...';
	@override String errorImporting({required Object error}) => 'Ошибка импорта: ${error}';
	@override String importedEntries({required Object count, required Object file}) => 'Импортировано ${count} из ${file}';
	@override String get noValidRows => 'Нет подходящих строк.';
	@override String get dataNotFound => 'Нет данных в CSV.';
	@override String get materialsNeedImport => 'Импортируйте CSV и выберите столбцы.';
	@override String get materialsNeedStart => 'Сначала начните вопрос.';
	@override String get language => 'Язык';
	@override String get languageSubtitle => 'Выберите язык приложения.';
	@override String get back => 'Назад';
	@override String get ok => 'OK';
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
	@override String get confirmActionTitle => 'Подтвердить';
	@override String get confirmActionBody => 'Удалить ВСЮ статистику?';
	@override String get cancel => 'Отмена';
	@override String get delete => 'Удалить';
	@override String get searchByMeaning => 'Поиск по значению';
	@override String get filterAll => 'Все';
	@override String get tabStudy => 'Обучение';
	@override String get tabStats => 'Статистика';
	@override String get settingsHapticsTitle => 'Вибрация';
	@override String get settingsHapticsSubtitle => 'Вибрация при верном или неверном ответе.';
	@override String get settingsKanaSizeTitle => 'Размер каны';
	@override String get settingsKanaSizeSubtitle => 'Настройте размер отображения каны.';
	@override String settingsKanaSizeValue({required Object value}) => '${value}x';
	@override String get settingsKanjiJlptTitle => 'Уровень JLPT';
	@override String get settingsKanjiJlptSubtitle => 'Ограничить кандзи по JLPT.';
	@override String get settingsUseModelHiraganaTitle => 'ИИ Хирагана';
	@override String get settingsUseModelHiraganaSubtitle => 'Использовать ИИ для распознавания рисунка.';
	@override String get settingsUseModelKatakanaTitle => 'ИИ Катакана';
	@override String get settingsUseModelKatakanaSubtitle => 'Использовать ИИ для распознавания рисунка.';
	@override String get settingsUseModelKanjiTitle => 'ИИ Кандзи';
	@override String get settingsUseModelKanjiSubtitle => 'Использовать ИИ для распознавания рисунка.';
	@override String get kanjiFilterEmpty => 'Нет кандзи для этого уровня JLPT.';
	@override String get settingsBackupTitle => 'Резервная копия';
	@override String get settingsBackupSubtitle => 'Экспорт или импорт прогресса в JSON.';
	@override String get settingsBackupExportButton => 'Экспорт';
	@override String get settingsBackupImportButton => 'Импорт';
	@override String settingsBackupExported({required Object path}) => 'Экспортировано в ${path}';
	@override String settingsBackupImported({required Object count}) => 'Импортировано ${count} ответов';
	@override String settingsBackupError({required Object error}) => 'Ошибка резервной копии: ${error}';
	@override String get settingsGeneralSection => 'Общие';
	@override String get settingsAiModelsSection => 'Модели ИИ';
	@override String get settingsKanjiFilterSection => 'Фильтр кандзи';
	@override String get settingsDataSection => 'Данные';
	@override String get testGuideShow => 'Показать гайд';
	@override String get testGuideHide => 'Скрыть гайд';
	@override String get testReportDrawing => 'Сообщить о рисунке';
	@override String get testReportConfirmBody => 'Отправить этот отчёт сейчас?';
	@override String get testReportThanks => 'Спасибо. Отчёт подготовлен.';
	@override String get testReportError => 'Не удалось создать отчёт.';
	@override String get testKanjiTraceHint => 'Следуйте порядку штрихов. При необходимости включите подсказку.';
	@override String get aiInfoTitle => 'AI модели при рисовании';
	@override String get aiInfoLine1 => 'Распознавание ИИ может иногда не срабатывать.';
	@override String get aiInfoLine2 => 'Если оно не работает, отключите модель, чтобы использовать оценку по штрихам.';
	@override String get aiInfoLine3 => 'Вы можете сообщить об ошибке, чтобы помочь улучшить ИИ.';
	@override String get premiumSectionTitle => 'Премиум';
	@override String get premiumSectionSubtitle => 'Разблокируйте все функции и удалите всплывающие объявления.';
	@override String get premiumOpenButton => 'Оформить';
	@override String get premiumLockedMessage => 'Премиум-функция. Оформите доступ, чтобы разблокировать.';
	@override String get premiumTitle => 'Kana Master Premium';
	@override String get premiumSubtitle => 'Одноразовая покупка, все функции разблокированы.';
	@override String get premiumHeroTitle => 'Учитесь без ограничений';
	@override String get premiumHeroBody => 'Получите полный опыт и поддержите проект.';
	@override String get premiumBenefitNoAds => 'Без межстраничной рекламы';
	@override String get premiumBenefitMaterials => 'Доступ к режиму «Материалы»';
	@override String get premiumBenefitHard => 'Доступна высокая сложность';
	@override String get premiumBenefitAi => 'Опции моделей ИИ';
	@override String get premiumBenefitBackup => 'Экспорт/импорт статистики';
	@override String premiumBuyButton({required Object price}) => 'Купить за ${price}';
	@override String get premiumRestoreButton => 'Восстановить покупки';
	@override String get premiumOwnedBadge => 'Премиум разблокирован';
	@override String get premiumStoreUnavailable => 'Магазин недоступен. Попробуйте позже.';
	@override String premiumPurchaseError({required Object error}) => 'Ошибка покупки: ${error}';
	@override String get premiumPurchased => 'Покупка завершена. Премиум разблокирован.';
	@override String get premiumRestored => 'Покупки восстановлены.';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.studyHubTitle' => 'Центр обучения',
			'app.studyHubSubtitle' => 'Выберите письменность и начните учиться или практиковаться.',
			'app.paths' => 'Курсы',
			'app.script' => 'Письменность',
			'app.difficulty' => 'Сложность',
			'app.difficultyEasy' => 'Лёгкая',
			'app.difficultyMedium' => 'Средняя',
			'app.difficultyHard' => 'Сложная',
			'app.difficultyEasyDesc' => 'Один вариант',
			'app.difficultyMediumDesc' => 'Текст',
			'app.difficultyHardDesc' => 'Рисование',
			'app.learn' => 'Учить',
			'app.learnSubtitle' => 'Изучайте символы и порядок штрихов.',
			'app.practice' => 'Практика',
			'app.practiceSubtitle' => 'Распознавание, ввод и рисование.',
			'app.materials' => 'Материалы',
			'app.materialsSubtitle' => 'Импортируйте CSV со своими данными.',
			'app.dictionary' => 'Словарь',
			'app.dictionarySubtitle' => 'Поиск слов, каны и значений.',
			'app.statistics' => 'Статистика',
			'app.statisticsSubtitle' => 'Точность, серия и темп обучения.',
			'app.settings' => 'Настройки',
			'app.learningDefaults' => 'Параметры обучения',
			'app.testDifficulty' => 'Сложность теста',
			'app.testDifficultySubtitle' => 'Выберите сложность практики.',
			'app.importCsv' => 'Импорт CSV',
			'app.expectedFormatTitle' => 'Ожидаемый формат',
			'app.expectedFormatBody' => 'Рекомендуемые заголовки:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nЛюбой столбец можно использовать как вопрос или ответ. CSV через запятую.',
			'app.fileLabel' => ({required Object name, required Object count}) => 'Файл: ${name} (${count})',
			'app.askWith' => 'Вопрос',
			'app.answerWith' => 'Ответ',
			'app.newQuestion' => 'Новый вопрос',
			'app.checkAnswer' => 'Проверить',
			'app.materialsEmpty' => 'Импортируйте CSV и нажмите «Новый вопрос».',
			'app.showAnswer' => 'Показать ответ',
			'app.answerPrefix' => ({required Object answer}) => 'Ответ: ${answer}',
			'app.beginSession' => 'Начать',
			'app.practiceStartSubtitle' => 'Начните новую сессию.',
			'app.testStayFocused' => 'Сосредоточьтесь и отправьте, когда будете готовы.',
			'app.testSketchHint' => 'Рисуйте внутри области',
			'app.testTypeRomaji' => 'Введите ромадзи',
			'app.testTypeMeaning' => 'Введите значение',
			'app.testRomajiLabel' => 'Чтение ромадзи',
			'app.testMeaningLabel' => 'Значение на испанском',
			'app.testTapToType' => 'Нажмите для ввода',
			'app.testDrawThe' => ({required Object script}) => 'Нарисуйте ${script}',
			'app.testWhichIs' => ({required Object script}) => 'Что это за ${script}?',
			'app.testKanjiMeaning' => 'Значение этого кандзи?',
			'app.statsNoDataTitle' => 'Нет статистики',
			'app.statsNoDataSubtitle' => 'Пройдите тесты, чтобы увидеть статистику.',
			'app.statsReset' => 'Сбросить статистику',
			'app.statsActivity' => 'Активность',
			'app.statsActivitySubtitle' => 'Последние 14 дней',
			'app.statsEvolution' => 'Динамика',
			'app.statsEvolutionSubtitle' => 'Верно vs неверно',
			'app.statsNoEvolution' => 'Нет данных.',
			'app.statsNoActivity' => 'Пока нет активности.',
			'app.statsAccuracy' => 'Точность',
			'app.statsStreak' => 'Серия',
			'app.statsLast7' => '7 дней',
			'app.statsLast30' => '30 дней',
			'app.statsSessions' => 'сессии',
			'app.statsBest' => ({required Object days}) => 'Лучшие ${days} дней',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct}/${total} верно',
			'app.statsCorrectLabel' => 'Верно',
			'app.statsIncorrectLabel' => 'Неверно',
			'app.statsMomentum' => 'Темп',
			'app.statsView' => 'Показать статистику',
			'app.statsStartToUnlock' => 'Начните практику, чтобы увидеть статистику.',
			'app.dictionaryEmpty' => 'Начните поиск слова.',
			'app.searchHint' => 'Поиск слова, каны, ромадзи...',
			'app.correct' => 'Верно!',
			'app.incorrect' => 'Неверно',
			'app.oops' => 'Ой...',
			'app.errorImporting' => ({required Object error}) => 'Ошибка импорта: ${error}',
			'app.importedEntries' => ({required Object count, required Object file}) => 'Импортировано ${count} из ${file}',
			'app.noValidRows' => 'Нет подходящих строк.',
			'app.dataNotFound' => 'Нет данных в CSV.',
			'app.materialsNeedImport' => 'Импортируйте CSV и выберите столбцы.',
			'app.materialsNeedStart' => 'Сначала начните вопрос.',
			'app.language' => 'Язык',
			'app.languageSubtitle' => 'Выберите язык приложения.',
			'app.back' => 'Назад',
			'app.ok' => 'OK',
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
			'app.confirmActionTitle' => 'Подтвердить',
			'app.confirmActionBody' => 'Удалить ВСЮ статистику?',
			'app.cancel' => 'Отмена',
			'app.delete' => 'Удалить',
			'app.searchByMeaning' => 'Поиск по значению',
			'app.filterAll' => 'Все',
			'app.tabStudy' => 'Обучение',
			'app.tabStats' => 'Статистика',
			'app.settingsHapticsTitle' => 'Вибрация',
			'app.settingsHapticsSubtitle' => 'Вибрация при верном или неверном ответе.',
			'app.settingsKanaSizeTitle' => 'Размер каны',
			'app.settingsKanaSizeSubtitle' => 'Настройте размер отображения каны.',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'Уровень JLPT',
			'app.settingsKanjiJlptSubtitle' => 'Ограничить кандзи по JLPT.',
			'app.settingsUseModelHiraganaTitle' => 'ИИ Хирагана',
			'app.settingsUseModelHiraganaSubtitle' => 'Использовать ИИ для распознавания рисунка.',
			'app.settingsUseModelKatakanaTitle' => 'ИИ Катакана',
			'app.settingsUseModelKatakanaSubtitle' => 'Использовать ИИ для распознавания рисунка.',
			'app.settingsUseModelKanjiTitle' => 'ИИ Кандзи',
			'app.settingsUseModelKanjiSubtitle' => 'Использовать ИИ для распознавания рисунка.',
			'app.kanjiFilterEmpty' => 'Нет кандзи для этого уровня JLPT.',
			'app.settingsBackupTitle' => 'Резервная копия',
			'app.settingsBackupSubtitle' => 'Экспорт или импорт прогресса в JSON.',
			'app.settingsBackupExportButton' => 'Экспорт',
			'app.settingsBackupImportButton' => 'Импорт',
			'app.settingsBackupExported' => ({required Object path}) => 'Экспортировано в ${path}',
			'app.settingsBackupImported' => ({required Object count}) => 'Импортировано ${count} ответов',
			'app.settingsBackupError' => ({required Object error}) => 'Ошибка резервной копии: ${error}',
			'app.settingsGeneralSection' => 'Общие',
			'app.settingsAiModelsSection' => 'Модели ИИ',
			'app.settingsKanjiFilterSection' => 'Фильтр кандзи',
			'app.settingsDataSection' => 'Данные',
			'app.testGuideShow' => 'Показать гайд',
			'app.testGuideHide' => 'Скрыть гайд',
			'app.testReportDrawing' => 'Сообщить о рисунке',
			'app.testReportConfirmBody' => 'Отправить этот отчёт сейчас?',
			'app.testReportThanks' => 'Спасибо. Отчёт подготовлен.',
			'app.testReportError' => 'Не удалось создать отчёт.',
			'app.testKanjiTraceHint' => 'Следуйте порядку штрихов. При необходимости включите подсказку.',
			'app.aiInfoTitle' => 'AI модели при рисовании',
			'app.aiInfoLine1' => 'Распознавание ИИ может иногда не срабатывать.',
			'app.aiInfoLine2' => 'Если оно не работает, отключите модель, чтобы использовать оценку по штрихам.',
			'app.aiInfoLine3' => 'Вы можете сообщить об ошибке, чтобы помочь улучшить ИИ.',
			'app.premiumSectionTitle' => 'Премиум',
			'app.premiumSectionSubtitle' => 'Разблокируйте все функции и удалите всплывающие объявления.',
			'app.premiumOpenButton' => 'Оформить',
			'app.premiumLockedMessage' => 'Премиум-функция. Оформите доступ, чтобы разблокировать.',
			'app.premiumTitle' => 'Kana Master Premium',
			'app.premiumSubtitle' => 'Одноразовая покупка, все функции разблокированы.',
			'app.premiumHeroTitle' => 'Учитесь без ограничений',
			'app.premiumHeroBody' => 'Получите полный опыт и поддержите проект.',
			'app.premiumBenefitNoAds' => 'Без межстраничной рекламы',
			'app.premiumBenefitMaterials' => 'Доступ к режиму «Материалы»',
			'app.premiumBenefitHard' => 'Доступна высокая сложность',
			'app.premiumBenefitAi' => 'Опции моделей ИИ',
			'app.premiumBenefitBackup' => 'Экспорт/импорт статистики',
			'app.premiumBuyButton' => ({required Object price}) => 'Купить за ${price}',
			'app.premiumRestoreButton' => 'Восстановить покупки',
			'app.premiumOwnedBadge' => 'Премиум разблокирован',
			'app.premiumStoreUnavailable' => 'Магазин недоступен. Попробуйте позже.',
			'app.premiumPurchaseError' => ({required Object error}) => 'Ошибка покупки: ${error}',
			'app.premiumPurchased' => 'Покупка завершена. Премиум разблокирован.',
			'app.premiumRestored' => 'Покупки восстановлены.',
			_ => null,
		};
	}
}
