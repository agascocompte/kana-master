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
class TranslationsZh with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key);

	late final TranslationsZh _root = this; // ignore: unused_field

	@override 
	TranslationsZh $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZh(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$zh app = _Translations$app$zh._(_root);
}

// Path: app
class _Translations$app$zh implements Translations$app$en {
	_Translations$app$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get studyHubTitle => '学习中心';
	@override String get studyHubSubtitle => '选择文字，开始学习或练习。';
	@override String get paths => '课程';
	@override String get script => '文字';
	@override String get difficulty => '难度';
	@override String get difficultyEasy => '简单';
	@override String get difficultyMedium => '中等';
	@override String get difficultyHard => '困难';
	@override String get difficultyEasyDesc => '单选';
	@override String get difficultyMediumDesc => '文本';
	@override String get difficultyHardDesc => '手写';
	@override String get learn => '学习';
	@override String get learnSubtitle => '查看字符和笔顺提示。';
	@override String get practice => '练习';
	@override String get practiceSubtitle => '识别、输入和手写练习。';
	@override String get materials => '资料';
	@override String get materialsSubtitle => '导入自己的 CSV 数据。';
	@override String get dictionary => '词典';
	@override String get dictionarySubtitle => '快速搜索单词、假名和含义。';
	@override String get statistics => '统计';
	@override String get statisticsSubtitle => '查看准确率和学习趋势。';
	@override String get settings => '设置';
	@override String get learningDefaults => '学习偏好';
	@override String get testDifficulty => '测试难度';
	@override String get testDifficultySubtitle => '选择练习难度。';
	@override String get importCsv => '导入 CSV';
	@override String get expectedFormatTitle => '推荐格式';
	@override String get expectedFormatBody => '推荐表头：\n\nIdioma | Romaji | Hiragana | Katakana | Kanji。\n\n任意列都可设为问题或答案。CSV 以逗号分隔。';
	@override String fileLabel({required Object name, required Object count}) => '文件：${name}（${count}）';
	@override String get askWith => '出题方式';
	@override String get answerWith => '回答方式';
	@override String get newQuestion => '新问题';
	@override String get checkAnswer => '检查';
	@override String get materialsEmpty => '导入 CSV 后点击“新问题”。';
	@override String get showAnswer => '查看答案';
	@override String answerPrefix({required Object answer}) => '答案：${answer}';
	@override String get beginSession => '开始';
	@override String get practiceStartSubtitle => '开启新一轮练习。';
	@override String get testStayFocused => '集中注意力，准备好后提交。';
	@override String get testSketchHint => '在区域内书写';
	@override String get testTypeRomaji => '输入罗马字';
	@override String get testTypeMeaning => '输入含义';
	@override String get testRomajiLabel => '罗马字';
	@override String get testMeaningLabel => '西班牙语含义';
	@override String get testTapToType => '点击输入';
	@override String testDrawThe({required Object script}) => '书写 ${script}';
	@override String testWhichIs({required Object script}) => '这是哪个 ${script}？';
	@override String get testKanjiMeaning => '这个汉字的含义是？';
	@override String get statsNoDataTitle => '暂无统计';
	@override String get statsNoDataSubtitle => '完成测试后查看统计数据。';
	@override String get statsReset => '重置统计';
	@override String get statsActivity => '学习记录';
	@override String get statsActivitySubtitle => '最近 14 天';
	@override String get statsEvolution => '变化趋势';
	@override String get statsEvolutionSubtitle => '正确 vs 错误';
	@override String get statsNoEvolution => '暂无数据。';
	@override String get statsNoActivity => '暂无活动。';
	@override String get statsAccuracy => '准确率';
	@override String get statsStreak => '连续天数';
	@override String get statsLast7 => '最近 7 天';
	@override String get statsLast30 => '最近 30 天';
	@override String get statsSessions => '次';
	@override String statsBest({required Object days}) => '最佳 ${days} 天';
	@override String statsCorrect({required Object correct, required Object total}) => '${correct}/${total} 正确';
	@override String get statsCorrectLabel => '正确';
	@override String get statsIncorrectLabel => '错误';
	@override String get statsMomentum => '学习节奏';
	@override String get statsView => '查看统计';
	@override String get statsStartToUnlock => '开始练习以查看统计。';
	@override String get dictionaryEmpty => '请输入要搜索的单词。';
	@override String get searchHint => '搜索单词、假名、罗马字...';
	@override String get correct => '正确！';
	@override String get incorrect => '错误';
	@override String get oops => '哎呀...';
	@override String errorImporting({required Object error}) => '导入错误：${error}';
	@override String importedEntries({required Object file, required Object count}) => '已从 ${file} 导入 ${count} 条';
	@override String get noValidRows => '未找到有效行。';
	@override String get dataNotFound => 'CSV 中无数据。';
	@override String get materialsNeedImport => '请先导入 CSV 并选择列。';
	@override String get materialsNeedStart => '请先开始一个问题。';
	@override String get language => '语言';
	@override String get languageSubtitle => '选择应用语言。';
	@override String get back => '返回';
	@override String get ok => '确定';
	@override String get yourAnswer => '你的答案';
	@override String statsStreakDays({required Object days}) => '连续 ${days} 天';
	@override String get statsAttempts => '次尝试';
	@override String get scriptHiragana => '平假名';
	@override String get scriptKatakana => '片假名';
	@override String get scriptKanji => '汉字';
	@override String get testModeDrawing => '手写';
	@override String get testModeQuiz => '测验';
	@override String get dictionaryNotes => '备注';
	@override String get dictionarySeeAlso => '相关内容';
	@override String get confirmActionTitle => '确认';
	@override String get confirmActionBody => '确定要删除所有统计数据吗？';
	@override String get cancel => '取消';
	@override String get delete => '删除';
	@override String get searchByMeaning => '按含义搜索';
	@override String get filterAll => '全部';
	@override String get tabStudy => '学习';
	@override String get tabStats => '统计';
	@override String get settingsHapticsTitle => '震动';
	@override String get settingsHapticsSubtitle => '答对或答错时震动。';
	@override String get settingsKanaSizeTitle => '假名大小';
	@override String get settingsKanaSizeSubtitle => '调整假名显示大小。';
	@override String settingsKanaSizeValue({required Object value}) => '${value}x';
	@override String get settingsKanjiJlptTitle => 'JLPT 等级';
	@override String get settingsKanjiJlptSubtitle => '按 JLPT 等级限制汉字。';
	@override String get settingsUseModelHiraganaTitle => '平假名 AI';
	@override String get settingsUseModelHiraganaSubtitle => '手写识别使用 AI。';
	@override String get settingsUseModelKatakanaTitle => '片假名 AI';
	@override String get settingsUseModelKatakanaSubtitle => '手写识别使用 AI。';
	@override String get settingsUseModelKanjiTitle => '汉字 AI';
	@override String get settingsUseModelKanjiSubtitle => '手写识别使用 AI。';
	@override String get kanjiFilterEmpty => '该 JLPT 等级暂无汉字。';
	@override String get settingsBackupTitle => '备份';
	@override String get settingsBackupSubtitle => '以 JSON 格式导出或导入进度。';
	@override String get settingsBackupExportButton => '导出';
	@override String get settingsBackupImportButton => '导入';
	@override String settingsBackupExported({required Object path}) => '已导出至 ${path}';
	@override String settingsBackupImported({required Object count}) => '已导入 ${count} 条记录';
	@override String settingsBackupError({required Object error}) => '备份错误：${error}';
	@override String get settingsGeneralSection => '通用';
	@override String get settingsAiModelsSection => 'AI 模型';
	@override String get settingsKanjiFilterSection => '汉字过滤器';
	@override String get settingsDataSection => '数据';
	@override String get testGuideShow => '显示指南';
	@override String get testGuideHide => '隐藏指南';
	@override String get testReportDrawing => '报告手写问题';
	@override String get testReportConfirmBody => '现在要发送这份报告吗？';
	@override String get testReportThanks => '感谢反馈，报告已生成。';
	@override String get testReportError => '无法生成报告。';
	@override String get testKanjiTraceHint => '请按照笔顺书写，需要时可开启指南。';
	@override String get aiInfoTitle => 'AI 模型在手写中的应用';
	@override String get aiInfoLine1 => 'AI 识别有时可能失败。';
	@override String get aiInfoLine2 => '如果失败，请禁用模型以使用基于笔画的评估。';
	@override String get aiInfoLine3 => '您可以报告误判以帮助改进 AI。';
	@override String get premiumSectionTitle => '高级版';
	@override String get premiumSectionSubtitle => '解锁全部功能并移除插屏广告。';
	@override String get premiumOpenButton => '升级';
	@override String get premiumLockedMessage => '高级功能。升级后即可解锁。';
	@override String get premiumTitle => 'KanaGo Premium';
	@override String get premiumSubtitle => '一次购买，全部功能解锁。';
	@override String get premiumHeroTitle => '无上限学习';
	@override String get premiumHeroBody => '获得完整体验并支持项目发展。';
	@override String get premiumBenefitNoAds => '无插屏广告';
	@override String get premiumBenefitMaterials => '可使用材料模式';
	@override String get premiumBenefitHard => '可使用高难度';
	@override String get premiumBenefitAi => '可启用 AI 模型选项';
	@override String get premiumBenefitBackup => '导出/导入统计数据';
	@override String premiumBuyButton({required Object price}) => '以 ${price} 购买';
	@override String get premiumRestoreButton => '恢复购买';
	@override String get premiumOwnedBadge => '高级版已解锁';
	@override String get premiumStoreUnavailable => '商店不可用，请稍后重试。';
	@override String premiumPurchaseError({required Object error}) => '购买失败：${error}';
	@override String get premiumPurchased => '购买完成，高级版已解锁。';
	@override String get premiumRestored => '购买已恢复。';
	@override String get testNext => '下一题';
	@override String testCorrectAnswerWas({required Object answer}) => '正确答案：${answer}';
	@override String testQuestionProgress({required Object current, required Object total}) => '第 ${current} 题，共 ${total} 题';
	@override String get testKanjiReading => '这个汉字怎么读？';
	@override String get testTypeReading => '输入读音（假名或罗马字）';
	@override String get sessionSummaryTitle => '练习完成';
	@override String get sessionReviewSummaryTitle => '复习完成';
	@override String sessionScore({required Object correct, required Object total}) => '答对 ${correct} / ${total}';
	@override String get sessionPerfect => '完美！全部答对。';
	@override String get sessionMistakesTitle => '需要复习';
	@override String sessionReviewMistakes({required Object count}) => '复习错题（${count}）';
	@override String get sessionNew => '新的练习';
	@override String get sessionExit => '结束';
	@override String get practiceWhat => '练习内容';
	@override String get practiceRowsBasic => '清音';
	@override String get practiceRowsDakuten => '浊音';
	@override String get practiceRowsCombos => '拗音';
	@override String get practiceSelectAll => '全部';
	@override String practiceItemsCount({required Object count}) => '${count} 个字符';
	@override String get practiceNotDrawable => '拗音和带浊点的片假名无法书写，因此在书写模式中会被跳过。';
	@override String get practiceNothingToDraw => '所选字符都无法书写。请选择其他行或较低的难度。';
	@override String get practiceSessionLength => '每次练习的题数';
	@override String get practiceSource => '题目来源';
	@override String get practiceSourceAll => '全部';
	@override String practiceSourceMistakes({required Object count}) => '我的错题（${count}）';
	@override String get kanjiQuizMode => '考查';
	@override String get kanjiModeMeaning => '意思';
	@override String get kanjiModeReading => '读音';
	@override String get statsMasteryTitle => '掌握程度';
	@override String get statsMasterySubtitle => '连续答对 3 次即算掌握该字符。';
	@override String statsMasteredCount({required Object mastered, required Object total}) => '已掌握 ${mastered} / ${total}';
	@override String get statsLegendMastered => '已掌握';
	@override String get statsLegendLearning => '学习中';
	@override String get statsLegendWeak => '需复习';
	@override String get statsLegendNew => '未出现';
	@override String get statsWeakest => '需复习';
	@override String get learnDakutenTitle => '浊音';
	@override String get learnCombosTitle => '拗音';
	@override String get settingsBackupImportConfirm => '导入将替换你当前的所有统计数据。是否继续？';
	@override String get dictionaryEnglishNote => '结果来自 Jisho.org，为英文内容。';
	@override String get dictionaryError => '搜索失败。请检查网络连接后重试。';
	@override String materialsScore({required Object correct, required Object total}) => '答对 ${correct} / ${total}';
	@override String get materialsClear => '移除列表';
	@override String get premiumBenefitJlpt => '所有 JLPT 级别（N4–N1）';
	@override String get settingsThemeTitle => '外观';
	@override String get settingsThemeSubtitle => '浅色、深色或跟随系统。';
	@override String get settingsThemeSystem => '自动';
	@override String get settingsThemeLight => '浅色';
	@override String get settingsThemeDark => '深色';
}

/// The flat map containing all translations for locale <zh>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZh {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.studyHubTitle' => '学习中心',
			'app.studyHubSubtitle' => '选择文字，开始学习或练习。',
			'app.paths' => '课程',
			'app.script' => '文字',
			'app.difficulty' => '难度',
			'app.difficultyEasy' => '简单',
			'app.difficultyMedium' => '中等',
			'app.difficultyHard' => '困难',
			'app.difficultyEasyDesc' => '单选',
			'app.difficultyMediumDesc' => '文本',
			'app.difficultyHardDesc' => '手写',
			'app.learn' => '学习',
			'app.learnSubtitle' => '查看字符和笔顺提示。',
			'app.practice' => '练习',
			'app.practiceSubtitle' => '识别、输入和手写练习。',
			'app.materials' => '资料',
			'app.materialsSubtitle' => '导入自己的 CSV 数据。',
			'app.dictionary' => '词典',
			'app.dictionarySubtitle' => '快速搜索单词、假名和含义。',
			'app.statistics' => '统计',
			'app.statisticsSubtitle' => '查看准确率和学习趋势。',
			'app.settings' => '设置',
			'app.learningDefaults' => '学习偏好',
			'app.testDifficulty' => '测试难度',
			'app.testDifficultySubtitle' => '选择练习难度。',
			'app.importCsv' => '导入 CSV',
			'app.expectedFormatTitle' => '推荐格式',
			'app.expectedFormatBody' => '推荐表头：\n\nIdioma | Romaji | Hiragana | Katakana | Kanji。\n\n任意列都可设为问题或答案。CSV 以逗号分隔。',
			'app.fileLabel' => ({required Object name, required Object count}) => '文件：${name}（${count}）',
			'app.askWith' => '出题方式',
			'app.answerWith' => '回答方式',
			'app.newQuestion' => '新问题',
			'app.checkAnswer' => '检查',
			'app.materialsEmpty' => '导入 CSV 后点击“新问题”。',
			'app.showAnswer' => '查看答案',
			'app.answerPrefix' => ({required Object answer}) => '答案：${answer}',
			'app.beginSession' => '开始',
			'app.practiceStartSubtitle' => '开启新一轮练习。',
			'app.testStayFocused' => '集中注意力，准备好后提交。',
			'app.testSketchHint' => '在区域内书写',
			'app.testTypeRomaji' => '输入罗马字',
			'app.testTypeMeaning' => '输入含义',
			'app.testRomajiLabel' => '罗马字',
			'app.testMeaningLabel' => '西班牙语含义',
			'app.testTapToType' => '点击输入',
			'app.testDrawThe' => ({required Object script}) => '书写 ${script}',
			'app.testWhichIs' => ({required Object script}) => '这是哪个 ${script}？',
			'app.testKanjiMeaning' => '这个汉字的含义是？',
			'app.statsNoDataTitle' => '暂无统计',
			'app.statsNoDataSubtitle' => '完成测试后查看统计数据。',
			'app.statsReset' => '重置统计',
			'app.statsActivity' => '学习记录',
			'app.statsActivitySubtitle' => '最近 14 天',
			'app.statsEvolution' => '变化趋势',
			'app.statsEvolutionSubtitle' => '正确 vs 错误',
			'app.statsNoEvolution' => '暂无数据。',
			'app.statsNoActivity' => '暂无活动。',
			'app.statsAccuracy' => '准确率',
			'app.statsStreak' => '连续天数',
			'app.statsLast7' => '最近 7 天',
			'app.statsLast30' => '最近 30 天',
			'app.statsSessions' => '次',
			'app.statsBest' => ({required Object days}) => '最佳 ${days} 天',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct}/${total} 正确',
			'app.statsCorrectLabel' => '正确',
			'app.statsIncorrectLabel' => '错误',
			'app.statsMomentum' => '学习节奏',
			'app.statsView' => '查看统计',
			'app.statsStartToUnlock' => '开始练习以查看统计。',
			'app.dictionaryEmpty' => '请输入要搜索的单词。',
			'app.searchHint' => '搜索单词、假名、罗马字...',
			'app.correct' => '正确！',
			'app.incorrect' => '错误',
			'app.oops' => '哎呀...',
			'app.errorImporting' => ({required Object error}) => '导入错误：${error}',
			'app.importedEntries' => ({required Object file, required Object count}) => '已从 ${file} 导入 ${count} 条',
			'app.noValidRows' => '未找到有效行。',
			'app.dataNotFound' => 'CSV 中无数据。',
			'app.materialsNeedImport' => '请先导入 CSV 并选择列。',
			'app.materialsNeedStart' => '请先开始一个问题。',
			'app.language' => '语言',
			'app.languageSubtitle' => '选择应用语言。',
			'app.back' => '返回',
			'app.ok' => '确定',
			'app.yourAnswer' => '你的答案',
			'app.statsStreakDays' => ({required Object days}) => '连续 ${days} 天',
			'app.statsAttempts' => '次尝试',
			'app.scriptHiragana' => '平假名',
			'app.scriptKatakana' => '片假名',
			'app.scriptKanji' => '汉字',
			'app.testModeDrawing' => '手写',
			'app.testModeQuiz' => '测验',
			'app.dictionaryNotes' => '备注',
			'app.dictionarySeeAlso' => '相关内容',
			'app.confirmActionTitle' => '确认',
			'app.confirmActionBody' => '确定要删除所有统计数据吗？',
			'app.cancel' => '取消',
			'app.delete' => '删除',
			'app.searchByMeaning' => '按含义搜索',
			'app.filterAll' => '全部',
			'app.tabStudy' => '学习',
			'app.tabStats' => '统计',
			'app.settingsHapticsTitle' => '震动',
			'app.settingsHapticsSubtitle' => '答对或答错时震动。',
			'app.settingsKanaSizeTitle' => '假名大小',
			'app.settingsKanaSizeSubtitle' => '调整假名显示大小。',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'JLPT 等级',
			'app.settingsKanjiJlptSubtitle' => '按 JLPT 等级限制汉字。',
			'app.settingsUseModelHiraganaTitle' => '平假名 AI',
			'app.settingsUseModelHiraganaSubtitle' => '手写识别使用 AI。',
			'app.settingsUseModelKatakanaTitle' => '片假名 AI',
			'app.settingsUseModelKatakanaSubtitle' => '手写识别使用 AI。',
			'app.settingsUseModelKanjiTitle' => '汉字 AI',
			'app.settingsUseModelKanjiSubtitle' => '手写识别使用 AI。',
			'app.kanjiFilterEmpty' => '该 JLPT 等级暂无汉字。',
			'app.settingsBackupTitle' => '备份',
			'app.settingsBackupSubtitle' => '以 JSON 格式导出或导入进度。',
			'app.settingsBackupExportButton' => '导出',
			'app.settingsBackupImportButton' => '导入',
			'app.settingsBackupExported' => ({required Object path}) => '已导出至 ${path}',
			'app.settingsBackupImported' => ({required Object count}) => '已导入 ${count} 条记录',
			'app.settingsBackupError' => ({required Object error}) => '备份错误：${error}',
			'app.settingsGeneralSection' => '通用',
			'app.settingsAiModelsSection' => 'AI 模型',
			'app.settingsKanjiFilterSection' => '汉字过滤器',
			'app.settingsDataSection' => '数据',
			'app.testGuideShow' => '显示指南',
			'app.testGuideHide' => '隐藏指南',
			'app.testReportDrawing' => '报告手写问题',
			'app.testReportConfirmBody' => '现在要发送这份报告吗？',
			'app.testReportThanks' => '感谢反馈，报告已生成。',
			'app.testReportError' => '无法生成报告。',
			'app.testKanjiTraceHint' => '请按照笔顺书写，需要时可开启指南。',
			'app.aiInfoTitle' => 'AI 模型在手写中的应用',
			'app.aiInfoLine1' => 'AI 识别有时可能失败。',
			'app.aiInfoLine2' => '如果失败，请禁用模型以使用基于笔画的评估。',
			'app.aiInfoLine3' => '您可以报告误判以帮助改进 AI。',
			'app.premiumSectionTitle' => '高级版',
			'app.premiumSectionSubtitle' => '解锁全部功能并移除插屏广告。',
			'app.premiumOpenButton' => '升级',
			'app.premiumLockedMessage' => '高级功能。升级后即可解锁。',
			'app.premiumTitle' => 'KanaGo Premium',
			'app.premiumSubtitle' => '一次购买，全部功能解锁。',
			'app.premiumHeroTitle' => '无上限学习',
			'app.premiumHeroBody' => '获得完整体验并支持项目发展。',
			'app.premiumBenefitNoAds' => '无插屏广告',
			'app.premiumBenefitMaterials' => '可使用材料模式',
			'app.premiumBenefitHard' => '可使用高难度',
			'app.premiumBenefitAi' => '可启用 AI 模型选项',
			'app.premiumBenefitBackup' => '导出/导入统计数据',
			'app.premiumBuyButton' => ({required Object price}) => '以 ${price} 购买',
			'app.premiumRestoreButton' => '恢复购买',
			'app.premiumOwnedBadge' => '高级版已解锁',
			'app.premiumStoreUnavailable' => '商店不可用，请稍后重试。',
			'app.premiumPurchaseError' => ({required Object error}) => '购买失败：${error}',
			'app.premiumPurchased' => '购买完成，高级版已解锁。',
			'app.premiumRestored' => '购买已恢复。',
			'app.testNext' => '下一题',
			'app.testCorrectAnswerWas' => ({required Object answer}) => '正确答案：${answer}',
			'app.testQuestionProgress' => ({required Object current, required Object total}) => '第 ${current} 题，共 ${total} 题',
			'app.testKanjiReading' => '这个汉字怎么读？',
			'app.testTypeReading' => '输入读音（假名或罗马字）',
			'app.sessionSummaryTitle' => '练习完成',
			'app.sessionReviewSummaryTitle' => '复习完成',
			'app.sessionScore' => ({required Object correct, required Object total}) => '答对 ${correct} / ${total}',
			'app.sessionPerfect' => '完美！全部答对。',
			'app.sessionMistakesTitle' => '需要复习',
			'app.sessionReviewMistakes' => ({required Object count}) => '复习错题（${count}）',
			'app.sessionNew' => '新的练习',
			'app.sessionExit' => '结束',
			'app.practiceWhat' => '练习内容',
			'app.practiceRowsBasic' => '清音',
			'app.practiceRowsDakuten' => '浊音',
			'app.practiceRowsCombos' => '拗音',
			'app.practiceSelectAll' => '全部',
			'app.practiceItemsCount' => ({required Object count}) => '${count} 个字符',
			'app.practiceNotDrawable' => '拗音和带浊点的片假名无法书写，因此在书写模式中会被跳过。',
			'app.practiceNothingToDraw' => '所选字符都无法书写。请选择其他行或较低的难度。',
			'app.practiceSessionLength' => '每次练习的题数',
			'app.practiceSource' => '题目来源',
			'app.practiceSourceAll' => '全部',
			'app.practiceSourceMistakes' => ({required Object count}) => '我的错题（${count}）',
			'app.kanjiQuizMode' => '考查',
			'app.kanjiModeMeaning' => '意思',
			'app.kanjiModeReading' => '读音',
			'app.statsMasteryTitle' => '掌握程度',
			'app.statsMasterySubtitle' => '连续答对 3 次即算掌握该字符。',
			'app.statsMasteredCount' => ({required Object mastered, required Object total}) => '已掌握 ${mastered} / ${total}',
			'app.statsLegendMastered' => '已掌握',
			'app.statsLegendLearning' => '学习中',
			'app.statsLegendWeak' => '需复习',
			'app.statsLegendNew' => '未出现',
			'app.statsWeakest' => '需复习',
			'app.learnDakutenTitle' => '浊音',
			'app.learnCombosTitle' => '拗音',
			'app.settingsBackupImportConfirm' => '导入将替换你当前的所有统计数据。是否继续？',
			'app.dictionaryEnglishNote' => '结果来自 Jisho.org，为英文内容。',
			'app.dictionaryError' => '搜索失败。请检查网络连接后重试。',
			'app.materialsScore' => ({required Object correct, required Object total}) => '答对 ${correct} / ${total}',
			'app.materialsClear' => '移除列表',
			'app.premiumBenefitJlpt' => '所有 JLPT 级别（N4–N1）',
			'app.settingsThemeTitle' => '外观',
			'app.settingsThemeSubtitle' => '浅色、深色或跟随系统。',
			'app.settingsThemeSystem' => '自动',
			'app.settingsThemeLight' => '浅色',
			'app.settingsThemeDark' => '深色',
			_ => null,
		};
	}
}
