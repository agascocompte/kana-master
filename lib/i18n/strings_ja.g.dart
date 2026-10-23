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
class TranslationsJa with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsJa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key);

	late final TranslationsJa _root = this; // ignore: unused_field

	@override 
	TranslationsJa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsJa(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$ja app = _Translations$app$ja._(_root);
	@override late final _Translations$exam$ja exam = _Translations$exam$ja._(_root);
}

// Path: app
class _Translations$app$ja implements Translations$app$en {
	_Translations$app$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get studyHubTitle => '学習ハブ';
	@override String get studyHubSubtitle => '文字を選んで学習や練習を始めましょう。';
	@override String get paths => 'コース';
	@override String get script => '文字';
	@override String get difficulty => '難易度';
	@override String get difficultyEasy => 'かんたん';
	@override String get difficultyMedium => 'ふつう';
	@override String get difficultyHard => 'むずかしい';
	@override String get difficultyEasyDesc => '単一選択';
	@override String get difficultyMediumDesc => 'テキスト';
	@override String get difficultyHardDesc => '手書き';
	@override String get learn => '学ぶ';
	@override String get learnSubtitle => '文字と書き順のヒントを確認。';
	@override String get practice => '練習';
	@override String get practiceSubtitle => '認識・入力・手書き練習。';
	@override String get materials => '教材';
	@override String get materialsSubtitle => 'CSVをインポートできます。';
	@override String get dictionary => '辞書';
	@override String get dictionarySubtitle => '単語・かな・意味をすぐ検索。';
	@override String get statistics => '統計';
	@override String get statisticsSubtitle => '正答率や継続日数を確認。';
	@override String get settings => '設定';
	@override String get learningDefaults => '学習設定';
	@override String get testDifficulty => 'テスト難易度';
	@override String get testDifficultySubtitle => '練習の難易度を選択。';
	@override String get importCsv => 'CSVインポート';
	@override String get expectedFormatTitle => '推奨フォーマット';
	@override String get expectedFormatBody => '推奨ヘッダー:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji。\n\n任意の列を問題や回答に設定できます。CSVはカンマ区切り。';
	@override String fileLabel({required Object name, required Object count}) => 'ファイル: ${name} (${count})';
	@override String get askWith => '出題';
	@override String get answerWith => '回答形式';
	@override String get newQuestion => '新しい問題';
	@override String get checkAnswer => '確認';
	@override String get materialsEmpty => 'CSVを読み込んで「新しい問題」を押してください。';
	@override String get showAnswer => '答えを見る';
	@override String answerPrefix({required Object answer}) => '答え: ${answer}';
	@override String get beginSession => '開始';
	@override String get practiceStartSubtitle => '新しいラウンドを始めましょう。';
	@override String get testStayFocused => '集中して準備ができたら送信。';
	@override String get testSketchHint => '枠内に描いてください';
	@override String get testTypeRomaji => 'ローマ字を入力';
	@override String get testTypeMeaning => '意味を入力';
	@override String get testRomajiLabel => 'ローマ字';
	@override String get testMeaningLabel => 'スペイン語の意味';
	@override String get testTapToType => 'タップして入力';
	@override String testDrawThe({required Object script}) => '${script}を書いてください';
	@override String testWhichIs({required Object script}) => 'この${script}はどれ？';
	@override String get testKanjiMeaning => 'この漢字の意味は？';
	@override String get statsNoDataTitle => '統計データなし';
	@override String get statsNoDataSubtitle => 'テストをして統計を解放しましょう。';
	@override String get statsReset => '統計をリセット';
	@override String get statsActivity => '学習履歴';
	@override String get statsActivitySubtitle => '過去14日間';
	@override String get statsEvolution => '推移';
	@override String get statsEvolutionSubtitle => '正解 vs 不正解';
	@override String get statsNoEvolution => 'データがありません。';
	@override String get statsNoActivity => 'まだ記録がありません。';
	@override String get statsAccuracy => '正答率';
	@override String get statsStreak => '連続日数';
	@override String get statsLast7 => '7日間';
	@override String get statsLast30 => '30日間';
	@override String get statsSessions => 'セッション';
	@override String statsBest({required Object days}) => '最高 ${days} 日';
	@override String statsCorrect({required Object correct, required Object total}) => '${correct}/${total} 正解';
	@override String get statsCorrectLabel => '正解';
	@override String get statsIncorrectLabel => '不正解';
	@override String get statsMomentum => '勢い';
	@override String get statsView => '統計を見る';
	@override String get statsStartToUnlock => '練習を始めて統計を表示。';
	@override String get dictionaryEmpty => '単語を検索してください。';
	@override String get searchHint => '単語・かな・ローマ字を検索...';
	@override String get correct => '正解！';
	@override String get incorrect => '不正解';
	@override String get oops => 'おっと…';
	@override String errorImporting({required Object error}) => 'インポートエラー: ${error}';
	@override String importedEntries({required Object file, required Object count}) => '${file} から ${count} 件インポート';
	@override String get noValidRows => '有効な行がありません。';
	@override String get dataNotFound => 'CSVにデータがありません。';
	@override String get materialsNeedImport => 'CSVを読み込んで列を選択してください。';
	@override String get materialsNeedStart => '先に問題を開始してください。';
	@override String get language => '言語';
	@override String get languageSubtitle => 'アプリの言語を選択。';
	@override String get back => '戻る';
	@override String get ok => 'OK';
	@override String get yourAnswer => 'あなたの答え';
	@override String statsStreakDays({required Object days}) => '${days}日連続';
	@override String get statsAttempts => '回';
	@override String get scriptHiragana => 'ひらがな';
	@override String get scriptKatakana => 'カタカナ';
	@override String get scriptKanji => '漢字';
	@override String get testModeDrawing => '手書き';
	@override String get testModeQuiz => 'クイズ';
	@override String get dictionaryNotes => 'メモ';
	@override String get dictionarySeeAlso => '関連項目';
	@override String get confirmActionTitle => '確認';
	@override String get confirmActionBody => 'すべての統計を削除しますか？';
	@override String get cancel => 'キャンセル';
	@override String get delete => '削除';
	@override String get searchByMeaning => '意味で検索';
	@override String get filterAll => 'すべて';
	@override String get tabStudy => '学習';
	@override String get tabStats => '統計';
	@override String get settingsHapticsTitle => 'バイブ';
	@override String get settingsHapticsSubtitle => '正解・不正解で振動。';
	@override String get settingsKanaSizeTitle => 'かなサイズ';
	@override String get settingsKanaSizeSubtitle => 'かなの表示サイズを調整。';
	@override String settingsKanaSizeValue({required Object value}) => '${value}x';
	@override String get settingsKanjiJlptTitle => 'JLPTレベル';
	@override String get settingsKanjiJlptSubtitle => 'JLPTで漢字を制限。';
	@override String get settingsUseModelHiraganaTitle => 'ひらがなAI';
	@override String get settingsUseModelHiraganaSubtitle => '手書き認識にAIを使用。';
	@override String get settingsUseModelKatakanaTitle => 'カタカナAI';
	@override String get settingsUseModelKatakanaSubtitle => '手書き認識にAIを使用。';
	@override String get settingsUseModelKanjiTitle => '漢字AI';
	@override String get settingsUseModelKanjiSubtitle => '手書き認識にAIを使用。';
	@override String get kanjiFilterEmpty => 'このJLPTレベルに漢字がありません。';
	@override String get settingsBackupTitle => 'バックアップ';
	@override String get settingsBackupSubtitle => 'JSONで進捗を保存・読み込み。';
	@override String get settingsBackupExportButton => 'エクスポート';
	@override String get settingsBackupImportButton => 'インポート';
	@override String settingsBackupExported({required Object path}) => '${path} に保存しました';
	@override String settingsBackupImported({required Object count}) => '${count} 件を読み込み';
	@override String settingsBackupError({required Object error}) => 'バックアップエラー: ${error}';
	@override String get settingsGeneralSection => '一般';
	@override String get settingsAiModelsSection => 'AIモデル';
	@override String get settingsKanjiFilterSection => '漢字フィルター';
	@override String get settingsDataSection => 'データ';
	@override String get testGuideShow => 'ガイド表示';
	@override String get testGuideHide => 'ガイド非表示';
	@override String get testReportDrawing => '手書きを報告';
	@override String get testReportConfirmBody => 'このレポートを今送信しますか？';
	@override String get testReportThanks => 'ありがとうございます。レポートを作成しました。';
	@override String get testReportError => 'レポート作成に失敗しました。';
	@override String get testKanjiTraceHint => '書き順に沿って描きましょう。必要ならガイドを表示。';
	@override String get aiInfoTitle => 'AIモデルによる描画';
	@override String get aiInfoLine1 => 'AI認識は時々失敗することがあります。';
	@override String get aiInfoLine2 => '失敗した場合は、モデルを無効にしてストロークベースの評価を使用してください。';
	@override String get aiInfoLine3 => '誤検出を報告して改善にご協力ください。';
	@override String get premiumSectionTitle => 'Premium';
	@override String get premiumSectionSubtitle => 'すべての機能を解放し、インタースティシャル広告を削除します。';
	@override String get premiumOpenButton => 'アップグレード';
	@override String get premiumLockedMessage => 'プレミアム機能です。アップグレードして解放してください。';
	@override String get premiumTitle => 'KanaGo Premium';
	@override String get premiumSubtitle => '一度の購入で、すべての機能が解放されます。';
	@override String get premiumHeroTitle => '制限なく学習';
	@override String get premiumHeroBody => 'フル機能を利用して、プロジェクトを応援してください。';
	@override String get premiumBenefitNoAds => 'インタースティシャル広告なし';
	@override String get premiumBenefitMaterials => 'マテリアルモードにアクセス';
	@override String get premiumBenefitHard => '高難易度を利用可能';
	@override String get premiumBenefitAi => 'AIモデル設定を有効化';
	@override String get premiumBenefitBackup => '統計のエクスポート/インポート';
	@override String premiumBuyButton({required Object price}) => '${price} で購入';
	@override String get premiumRestoreButton => '購入を復元';
	@override String get premiumOwnedBadge => 'プレミアム解放済み';
	@override String get premiumStoreUnavailable => 'ストアを利用できません。後でもう一度お試しください。';
	@override String premiumPurchaseError({required Object error}) => '購入に失敗しました: ${error}';
	@override String get premiumPurchased => '購入が完了しました。プレミアムが解放されました。';
	@override String get premiumRestored => '購入を復元しました。';
	@override String get testNext => '次へ';
	@override String testCorrectAnswerWas({required Object answer}) => '正解：${answer}';
	@override String testQuestionProgress({required Object total, required Object current}) => '${total}問中${current}問目';
	@override String get testKanjiReading => 'この漢字の読みは？';
	@override String get testTypeReading => '読みを入力（かなまたはローマ字）';
	@override String get sessionSummaryTitle => 'セッション完了';
	@override String get sessionReviewSummaryTitle => '復習完了';
	@override String sessionScore({required Object total, required Object correct}) => '${total}問中${correct}問正解';
	@override String get sessionPerfect => '完璧！ミスなし。';
	@override String get sessionMistakesTitle => '復習する文字';
	@override String sessionReviewMistakes({required Object count}) => '間違いを復習（${count}）';
	@override String get sessionNew => '新しいセッション';
	@override String get sessionExit => '終了';
	@override String get practiceWhat => '練習する文字';
	@override String get practiceRowsBasic => '基本';
	@override String get practiceRowsDakuten => '濁音・半濁音';
	@override String get practiceRowsCombos => '拗音';
	@override String get practiceSelectAll => 'すべて';
	@override String practiceItemsCount({required Object count}) => '${count}文字';
	@override String get practiceNotDrawable => '拗音と濁点付きのカタカナは書けないため、書き取りモードでは除外されます。';
	@override String get practiceNothingToDraw => '選んだ文字はどれも書き取りできません。別の行か、低い難易度を選んでください。';
	@override String get practiceSessionLength => '1セッションの問題数';
	@override String get practiceSource => '出題範囲';
	@override String get practiceSourceAll => 'すべて';
	@override String practiceSourceMistakes({required Object count}) => '間違えた文字（${count}）';
	@override String get kanjiQuizMode => '出題内容';
	@override String get kanjiModeMeaning => '意味';
	@override String get kanjiModeReading => '読み';
	@override String get statsMasteryTitle => '習得状況';
	@override String get statsMasterySubtitle => '3回連続で正解すると習得済みになります。';
	@override String statsMasteredCount({required Object total, required Object mastered}) => '${total}文字中${mastered}文字を習得';
	@override String get statsLegendMastered => '習得済み';
	@override String get statsLegendLearning => '学習中';
	@override String get statsLegendWeak => '要復習';
	@override String get statsLegendNew => '未出題';
	@override String get statsWeakest => '要復習';
	@override String get learnDakutenTitle => '濁音・半濁音';
	@override String get learnCombosTitle => '拗音';
	@override String get settingsBackupImportConfirm => 'インポートすると現在の統計がすべて置き換えられます。続けますか？';
	@override String get dictionaryEnglishNote => '結果はJisho.orgからの英語の情報です。';
	@override String get dictionaryError => '検索できませんでした。接続を確認して、もう一度お試しください。';
	@override String materialsScore({required Object total, required Object correct}) => '${total}問中${correct}問正解';
	@override String get materialsClear => 'リストを削除';
	@override String get premiumBenefitJlpt => 'すべてのJLPTレベル（N4〜N1）';
	@override String get settingsThemeTitle => '外観';
	@override String get settingsThemeSubtitle => 'ライト、ダーク、またはシステムに合わせる。';
	@override String get settingsThemeSystem => '自動';
	@override String get settingsThemeLight => 'ライト';
	@override String get settingsThemeDark => 'ダーク';
	@override String get reminderChannelName => '毎日のリマインダー';
	@override String get reminderChannelDescription => 'その日にまだ練習していなければ19時にお知らせします。';
	@override String get reminderStreakTitle => '🔥 連続記録を途切れさせないで！';
	@override String reminderStreakBody({required Object days}) => '${days}日連続で練習中です。今日も数分練習して記録を伸ばしましょう。';
	@override String get reminderSecondDayTitle => '🔥 2日目に挑戦';
	@override String get reminderSecondDayBody => '昨日は練習しました。今日も続けて連続記録を始めましょう。';
	@override String get reminderComebackTitle => '少しだけ日本語を練習しませんか？';
	@override String get reminderComebackBody => 'かなが待っています。短いセッションで新しい連続記録を始めましょう。';
	@override String get reminderLastTitle => 'お久しぶりです 👋';
	@override String get reminderLastBody => 'いつでも戻ってきてください。5分の復習でも記録になります。';
	@override String get settingsReminderTitle => '毎日のリマインダー';
	@override String get settingsReminderSubtitle => 'その日にまだ練習していなければ19時にお知らせします。';
	@override String get settingsReminderBlocked => 'KanaGoの通知がオフになっています。システム設定でオンにしてください。';
	@override String get settingsAdPrivacyTitle => '広告のプライバシー';
	@override String get settingsAdPrivacySubtitle => 'パーソナライズ広告への同意を変更します。';
}

// Path: exam
class _Translations$exam$ja implements Translations$exam$en {
	_Translations$exam$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get tab => '試験';
	@override String get hubTitle => 'JLPT N5 模擬試験';
	@override String get hubSubtitle => '本番と同じ形式で練習しよう';
	@override String get daysLeft => '試験までの日数';
	@override String get examsToday => '今日の受験回数';
	@override String get questionsSeen => '解いた問題数';
	@override String get fullExam => '全科目';
	@override String get fullExamSubtitle => '20 + 40 + 30分 · 67問';
	@override String sectionCardSubtitle({required Object minutes, required Object count}) => '${minutes}分 · ${count}問';
	@override String get progressTitle => '成績の推移（全科目）';
	@override String get weakPoints => '苦手な問題';
	@override String weakPointsSubtitle({required Object count}) => '直近${count}回の試験での問題形式別の正答率';
	@override String get history => '履歴';
	@override String historyFullDetail({required Object date, required Object language, required Object listening}) => '${date} · 言語知識・読解 ${language}/120 · 聴解 ${listening}/60';
	@override late final _Translations$exam$sections$ja sections = _Translations$exam$sections$ja._(_root);
	@override late final _Translations$exam$mondai$ja mondai = _Translations$exam$mondai$ja._(_root);
	@override String get createError => '試験を作成できませんでした。';
	@override String get leaveTitle => '試験を終了しますか？';
	@override String get leaveBody => 'この試験の解答はすべて失われます。';
	@override String get keepGoing => '続ける';
	@override String get leave => '終了する';
	@override String sectionOf({required Object current, required Object total}) => 'セクション ${current}/${total}';
	@override String sectionInfo({required Object minutes, required Object count}) => '${minutes}分 · ${count}問';
	@override String get listeningIntro => '音声は本番と同じように自動で一度だけ流れます。各問題のあとのポーズの間に答えてください。イヤホンの使用をおすすめします。';
	@override String get writtenIntro => '問題は自由に行き来できます。時間になると、セクションは自動的に提出されます。';
	@override String get start => '開始';
	@override String get timeUp => '時間切れです';
	@override String get submitTitle => 'このセクションを提出しますか？';
	@override String get submitAllAnswered => 'すべての問題に解答しました。';
	@override String submitUnanswered({required Object count}) => '未解答の問題：${count}問';
	@override String get submit => '提出する';
	@override String get previous => '前へ';
	@override String get next => '次へ';
	@override String questionOf({required Object current, required Object total}) => '問題 ${current}/${total}';
	@override String get resultTitle => '結果';
	@override String get reviewAnswers => '解答を確認する';
	@override String get back => '戻る';
	@override String get passed => '合格';
	@override String get failed => '不合格';
	@override String get scoreNote => '推定スコアです（全問同じ配点）。合格には総合80/180点以上、かつ各パートで38点・19点以上が必要です。';
	@override String correctOf({required Object total, required Object correct}) => '${total}問中${correct}問正解';
	@override String get listeningHint => '聴解の合格最低点：19/60（32%）。安心のため、60%以上を目指しましょう。';
	@override String get languageHint => '言語知識・読解の合格最低点：38/120（32%）。安心のため、60%以上を目指しましょう。';
	@override String get reviewTitle => '見直し';
	@override String get onlyMistakes => '間違いのみ';
	@override String get noMistakes => '間違いはありません！';
	@override String get unanswered => '未解答';
	@override String get correct => '正解';
	@override String get incorrect => '不正解';
	@override String get translation => '訳';
	@override String get showTextTranslation => '本文の訳を表示';
	@override String get hideTextTranslation => '本文の訳を隠す';
	@override String get listen => '聞く';
	@override String get stop => '停止';
	@override String get instructions => '指示';
	@override String get listening => '再生中…';
	@override String answerNow({required Object seconds}) => '解答してください · ${seconds}秒';
	@override String get paused => '一時停止中';
	@override String get resume => '再開';
	@override String get pause => '一時停止';
}

// Path: exam.sections
class _Translations$exam$sections$ja implements Translations$exam$sections$en {
	_Translations$exam$sections$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get vocabulary => '言語知識（文字・語彙）';
	@override String get grammarReading => '言語知識（文法）・読解';
	@override String get listening => '聴解';
}

// Path: exam.mondai
class _Translations$exam$mondai$ja implements Translations$exam$mondai$en {
	_Translations$exam$mondai$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get kanjiReading => '漢字読み';
	@override String get orthography => '表記';
	@override String get contextual => '文脈規定';
	@override String get paraphrase => '言い換え類義';
	@override String get grammarForm => '文法形式の判断';
	@override String get sentenceOrder => '文の組み立て';
	@override String get textGrammar => '文章の文法';
	@override String get shortReading => '内容理解（短文）';
	@override String get midReading => '内容理解（中文）';
	@override String get infoSearch => '情報検索';
	@override String get taskListening => '課題理解';
	@override String get pointListening => 'ポイント理解';
	@override String get utterance => '発話表現';
	@override String get quickResponse => '即時応答';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.studyHubTitle' => '学習ハブ',
			'app.studyHubSubtitle' => '文字を選んで学習や練習を始めましょう。',
			'app.paths' => 'コース',
			'app.script' => '文字',
			'app.difficulty' => '難易度',
			'app.difficultyEasy' => 'かんたん',
			'app.difficultyMedium' => 'ふつう',
			'app.difficultyHard' => 'むずかしい',
			'app.difficultyEasyDesc' => '単一選択',
			'app.difficultyMediumDesc' => 'テキスト',
			'app.difficultyHardDesc' => '手書き',
			'app.learn' => '学ぶ',
			'app.learnSubtitle' => '文字と書き順のヒントを確認。',
			'app.practice' => '練習',
			'app.practiceSubtitle' => '認識・入力・手書き練習。',
			'app.materials' => '教材',
			'app.materialsSubtitle' => 'CSVをインポートできます。',
			'app.dictionary' => '辞書',
			'app.dictionarySubtitle' => '単語・かな・意味をすぐ検索。',
			'app.statistics' => '統計',
			'app.statisticsSubtitle' => '正答率や継続日数を確認。',
			'app.settings' => '設定',
			'app.learningDefaults' => '学習設定',
			'app.testDifficulty' => 'テスト難易度',
			'app.testDifficultySubtitle' => '練習の難易度を選択。',
			'app.importCsv' => 'CSVインポート',
			'app.expectedFormatTitle' => '推奨フォーマット',
			'app.expectedFormatBody' => '推奨ヘッダー:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji。\n\n任意の列を問題や回答に設定できます。CSVはカンマ区切り。',
			'app.fileLabel' => ({required Object name, required Object count}) => 'ファイル: ${name} (${count})',
			'app.askWith' => '出題',
			'app.answerWith' => '回答形式',
			'app.newQuestion' => '新しい問題',
			'app.checkAnswer' => '確認',
			'app.materialsEmpty' => 'CSVを読み込んで「新しい問題」を押してください。',
			'app.showAnswer' => '答えを見る',
			'app.answerPrefix' => ({required Object answer}) => '答え: ${answer}',
			'app.beginSession' => '開始',
			'app.practiceStartSubtitle' => '新しいラウンドを始めましょう。',
			'app.testStayFocused' => '集中して準備ができたら送信。',
			'app.testSketchHint' => '枠内に描いてください',
			'app.testTypeRomaji' => 'ローマ字を入力',
			'app.testTypeMeaning' => '意味を入力',
			'app.testRomajiLabel' => 'ローマ字',
			'app.testMeaningLabel' => 'スペイン語の意味',
			'app.testTapToType' => 'タップして入力',
			'app.testDrawThe' => ({required Object script}) => '${script}を書いてください',
			'app.testWhichIs' => ({required Object script}) => 'この${script}はどれ？',
			'app.testKanjiMeaning' => 'この漢字の意味は？',
			'app.statsNoDataTitle' => '統計データなし',
			'app.statsNoDataSubtitle' => 'テストをして統計を解放しましょう。',
			'app.statsReset' => '統計をリセット',
			'app.statsActivity' => '学習履歴',
			'app.statsActivitySubtitle' => '過去14日間',
			'app.statsEvolution' => '推移',
			'app.statsEvolutionSubtitle' => '正解 vs 不正解',
			'app.statsNoEvolution' => 'データがありません。',
			'app.statsNoActivity' => 'まだ記録がありません。',
			'app.statsAccuracy' => '正答率',
			'app.statsStreak' => '連続日数',
			'app.statsLast7' => '7日間',
			'app.statsLast30' => '30日間',
			'app.statsSessions' => 'セッション',
			'app.statsBest' => ({required Object days}) => '最高 ${days} 日',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct}/${total} 正解',
			'app.statsCorrectLabel' => '正解',
			'app.statsIncorrectLabel' => '不正解',
			'app.statsMomentum' => '勢い',
			'app.statsView' => '統計を見る',
			'app.statsStartToUnlock' => '練習を始めて統計を表示。',
			'app.dictionaryEmpty' => '単語を検索してください。',
			'app.searchHint' => '単語・かな・ローマ字を検索...',
			'app.correct' => '正解！',
			'app.incorrect' => '不正解',
			'app.oops' => 'おっと…',
			'app.errorImporting' => ({required Object error}) => 'インポートエラー: ${error}',
			'app.importedEntries' => ({required Object file, required Object count}) => '${file} から ${count} 件インポート',
			'app.noValidRows' => '有効な行がありません。',
			'app.dataNotFound' => 'CSVにデータがありません。',
			'app.materialsNeedImport' => 'CSVを読み込んで列を選択してください。',
			'app.materialsNeedStart' => '先に問題を開始してください。',
			'app.language' => '言語',
			'app.languageSubtitle' => 'アプリの言語を選択。',
			'app.back' => '戻る',
			'app.ok' => 'OK',
			'app.yourAnswer' => 'あなたの答え',
			'app.statsStreakDays' => ({required Object days}) => '${days}日連続',
			'app.statsAttempts' => '回',
			'app.scriptHiragana' => 'ひらがな',
			'app.scriptKatakana' => 'カタカナ',
			'app.scriptKanji' => '漢字',
			'app.testModeDrawing' => '手書き',
			'app.testModeQuiz' => 'クイズ',
			'app.dictionaryNotes' => 'メモ',
			'app.dictionarySeeAlso' => '関連項目',
			'app.confirmActionTitle' => '確認',
			'app.confirmActionBody' => 'すべての統計を削除しますか？',
			'app.cancel' => 'キャンセル',
			'app.delete' => '削除',
			'app.searchByMeaning' => '意味で検索',
			'app.filterAll' => 'すべて',
			'app.tabStudy' => '学習',
			'app.tabStats' => '統計',
			'app.settingsHapticsTitle' => 'バイブ',
			'app.settingsHapticsSubtitle' => '正解・不正解で振動。',
			'app.settingsKanaSizeTitle' => 'かなサイズ',
			'app.settingsKanaSizeSubtitle' => 'かなの表示サイズを調整。',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'JLPTレベル',
			'app.settingsKanjiJlptSubtitle' => 'JLPTで漢字を制限。',
			'app.settingsUseModelHiraganaTitle' => 'ひらがなAI',
			'app.settingsUseModelHiraganaSubtitle' => '手書き認識にAIを使用。',
			'app.settingsUseModelKatakanaTitle' => 'カタカナAI',
			'app.settingsUseModelKatakanaSubtitle' => '手書き認識にAIを使用。',
			'app.settingsUseModelKanjiTitle' => '漢字AI',
			'app.settingsUseModelKanjiSubtitle' => '手書き認識にAIを使用。',
			'app.kanjiFilterEmpty' => 'このJLPTレベルに漢字がありません。',
			'app.settingsBackupTitle' => 'バックアップ',
			'app.settingsBackupSubtitle' => 'JSONで進捗を保存・読み込み。',
			'app.settingsBackupExportButton' => 'エクスポート',
			'app.settingsBackupImportButton' => 'インポート',
			'app.settingsBackupExported' => ({required Object path}) => '${path} に保存しました',
			'app.settingsBackupImported' => ({required Object count}) => '${count} 件を読み込み',
			'app.settingsBackupError' => ({required Object error}) => 'バックアップエラー: ${error}',
			'app.settingsGeneralSection' => '一般',
			'app.settingsAiModelsSection' => 'AIモデル',
			'app.settingsKanjiFilterSection' => '漢字フィルター',
			'app.settingsDataSection' => 'データ',
			'app.testGuideShow' => 'ガイド表示',
			'app.testGuideHide' => 'ガイド非表示',
			'app.testReportDrawing' => '手書きを報告',
			'app.testReportConfirmBody' => 'このレポートを今送信しますか？',
			'app.testReportThanks' => 'ありがとうございます。レポートを作成しました。',
			'app.testReportError' => 'レポート作成に失敗しました。',
			'app.testKanjiTraceHint' => '書き順に沿って描きましょう。必要ならガイドを表示。',
			'app.aiInfoTitle' => 'AIモデルによる描画',
			'app.aiInfoLine1' => 'AI認識は時々失敗することがあります。',
			'app.aiInfoLine2' => '失敗した場合は、モデルを無効にしてストロークベースの評価を使用してください。',
			'app.aiInfoLine3' => '誤検出を報告して改善にご協力ください。',
			'app.premiumSectionTitle' => 'Premium',
			'app.premiumSectionSubtitle' => 'すべての機能を解放し、インタースティシャル広告を削除します。',
			'app.premiumOpenButton' => 'アップグレード',
			'app.premiumLockedMessage' => 'プレミアム機能です。アップグレードして解放してください。',
			'app.premiumTitle' => 'KanaGo Premium',
			'app.premiumSubtitle' => '一度の購入で、すべての機能が解放されます。',
			'app.premiumHeroTitle' => '制限なく学習',
			'app.premiumHeroBody' => 'フル機能を利用して、プロジェクトを応援してください。',
			'app.premiumBenefitNoAds' => 'インタースティシャル広告なし',
			'app.premiumBenefitMaterials' => 'マテリアルモードにアクセス',
			'app.premiumBenefitHard' => '高難易度を利用可能',
			'app.premiumBenefitAi' => 'AIモデル設定を有効化',
			'app.premiumBenefitBackup' => '統計のエクスポート/インポート',
			'app.premiumBuyButton' => ({required Object price}) => '${price} で購入',
			'app.premiumRestoreButton' => '購入を復元',
			'app.premiumOwnedBadge' => 'プレミアム解放済み',
			'app.premiumStoreUnavailable' => 'ストアを利用できません。後でもう一度お試しください。',
			'app.premiumPurchaseError' => ({required Object error}) => '購入に失敗しました: ${error}',
			'app.premiumPurchased' => '購入が完了しました。プレミアムが解放されました。',
			'app.premiumRestored' => '購入を復元しました。',
			'app.testNext' => '次へ',
			'app.testCorrectAnswerWas' => ({required Object answer}) => '正解：${answer}',
			'app.testQuestionProgress' => ({required Object total, required Object current}) => '${total}問中${current}問目',
			'app.testKanjiReading' => 'この漢字の読みは？',
			'app.testTypeReading' => '読みを入力（かなまたはローマ字）',
			'app.sessionSummaryTitle' => 'セッション完了',
			'app.sessionReviewSummaryTitle' => '復習完了',
			'app.sessionScore' => ({required Object total, required Object correct}) => '${total}問中${correct}問正解',
			'app.sessionPerfect' => '完璧！ミスなし。',
			'app.sessionMistakesTitle' => '復習する文字',
			'app.sessionReviewMistakes' => ({required Object count}) => '間違いを復習（${count}）',
			'app.sessionNew' => '新しいセッション',
			'app.sessionExit' => '終了',
			'app.practiceWhat' => '練習する文字',
			'app.practiceRowsBasic' => '基本',
			'app.practiceRowsDakuten' => '濁音・半濁音',
			'app.practiceRowsCombos' => '拗音',
			'app.practiceSelectAll' => 'すべて',
			'app.practiceItemsCount' => ({required Object count}) => '${count}文字',
			'app.practiceNotDrawable' => '拗音と濁点付きのカタカナは書けないため、書き取りモードでは除外されます。',
			'app.practiceNothingToDraw' => '選んだ文字はどれも書き取りできません。別の行か、低い難易度を選んでください。',
			'app.practiceSessionLength' => '1セッションの問題数',
			'app.practiceSource' => '出題範囲',
			'app.practiceSourceAll' => 'すべて',
			'app.practiceSourceMistakes' => ({required Object count}) => '間違えた文字（${count}）',
			'app.kanjiQuizMode' => '出題内容',
			'app.kanjiModeMeaning' => '意味',
			'app.kanjiModeReading' => '読み',
			'app.statsMasteryTitle' => '習得状況',
			'app.statsMasterySubtitle' => '3回連続で正解すると習得済みになります。',
			'app.statsMasteredCount' => ({required Object total, required Object mastered}) => '${total}文字中${mastered}文字を習得',
			'app.statsLegendMastered' => '習得済み',
			'app.statsLegendLearning' => '学習中',
			'app.statsLegendWeak' => '要復習',
			'app.statsLegendNew' => '未出題',
			'app.statsWeakest' => '要復習',
			'app.learnDakutenTitle' => '濁音・半濁音',
			'app.learnCombosTitle' => '拗音',
			'app.settingsBackupImportConfirm' => 'インポートすると現在の統計がすべて置き換えられます。続けますか？',
			'app.dictionaryEnglishNote' => '結果はJisho.orgからの英語の情報です。',
			'app.dictionaryError' => '検索できませんでした。接続を確認して、もう一度お試しください。',
			'app.materialsScore' => ({required Object total, required Object correct}) => '${total}問中${correct}問正解',
			'app.materialsClear' => 'リストを削除',
			'app.premiumBenefitJlpt' => 'すべてのJLPTレベル（N4〜N1）',
			'app.settingsThemeTitle' => '外観',
			'app.settingsThemeSubtitle' => 'ライト、ダーク、またはシステムに合わせる。',
			'app.settingsThemeSystem' => '自動',
			'app.settingsThemeLight' => 'ライト',
			'app.settingsThemeDark' => 'ダーク',
			'app.reminderChannelName' => '毎日のリマインダー',
			'app.reminderChannelDescription' => 'その日にまだ練習していなければ19時にお知らせします。',
			'app.reminderStreakTitle' => '🔥 連続記録を途切れさせないで！',
			'app.reminderStreakBody' => ({required Object days}) => '${days}日連続で練習中です。今日も数分練習して記録を伸ばしましょう。',
			'app.reminderSecondDayTitle' => '🔥 2日目に挑戦',
			'app.reminderSecondDayBody' => '昨日は練習しました。今日も続けて連続記録を始めましょう。',
			'app.reminderComebackTitle' => '少しだけ日本語を練習しませんか？',
			'app.reminderComebackBody' => 'かなが待っています。短いセッションで新しい連続記録を始めましょう。',
			'app.reminderLastTitle' => 'お久しぶりです 👋',
			'app.reminderLastBody' => 'いつでも戻ってきてください。5分の復習でも記録になります。',
			'app.settingsReminderTitle' => '毎日のリマインダー',
			'app.settingsReminderSubtitle' => 'その日にまだ練習していなければ19時にお知らせします。',
			'app.settingsReminderBlocked' => 'KanaGoの通知がオフになっています。システム設定でオンにしてください。',
			'app.settingsAdPrivacyTitle' => '広告のプライバシー',
			'app.settingsAdPrivacySubtitle' => 'パーソナライズ広告への同意を変更します。',
			'exam.tab' => '試験',
			'exam.hubTitle' => 'JLPT N5 模擬試験',
			'exam.hubSubtitle' => '本番と同じ形式で練習しよう',
			'exam.daysLeft' => '試験までの日数',
			'exam.examsToday' => '今日の受験回数',
			'exam.questionsSeen' => '解いた問題数',
			'exam.fullExam' => '全科目',
			'exam.fullExamSubtitle' => '20 + 40 + 30分 · 67問',
			'exam.sectionCardSubtitle' => ({required Object minutes, required Object count}) => '${minutes}分 · ${count}問',
			'exam.progressTitle' => '成績の推移（全科目）',
			'exam.weakPoints' => '苦手な問題',
			'exam.weakPointsSubtitle' => ({required Object count}) => '直近${count}回の試験での問題形式別の正答率',
			'exam.history' => '履歴',
			'exam.historyFullDetail' => ({required Object date, required Object language, required Object listening}) => '${date} · 言語知識・読解 ${language}/120 · 聴解 ${listening}/60',
			'exam.sections.vocabulary' => '言語知識（文字・語彙）',
			'exam.sections.grammarReading' => '言語知識（文法）・読解',
			'exam.sections.listening' => '聴解',
			'exam.mondai.kanjiReading' => '漢字読み',
			'exam.mondai.orthography' => '表記',
			'exam.mondai.contextual' => '文脈規定',
			'exam.mondai.paraphrase' => '言い換え類義',
			'exam.mondai.grammarForm' => '文法形式の判断',
			'exam.mondai.sentenceOrder' => '文の組み立て',
			'exam.mondai.textGrammar' => '文章の文法',
			'exam.mondai.shortReading' => '内容理解（短文）',
			'exam.mondai.midReading' => '内容理解（中文）',
			'exam.mondai.infoSearch' => '情報検索',
			'exam.mondai.taskListening' => '課題理解',
			'exam.mondai.pointListening' => 'ポイント理解',
			'exam.mondai.utterance' => '発話表現',
			'exam.mondai.quickResponse' => '即時応答',
			'exam.createError' => '試験を作成できませんでした。',
			'exam.leaveTitle' => '試験を終了しますか？',
			'exam.leaveBody' => 'この試験の解答はすべて失われます。',
			'exam.keepGoing' => '続ける',
			'exam.leave' => '終了する',
			'exam.sectionOf' => ({required Object current, required Object total}) => 'セクション ${current}/${total}',
			'exam.sectionInfo' => ({required Object minutes, required Object count}) => '${minutes}分 · ${count}問',
			'exam.listeningIntro' => '音声は本番と同じように自動で一度だけ流れます。各問題のあとのポーズの間に答えてください。イヤホンの使用をおすすめします。',
			'exam.writtenIntro' => '問題は自由に行き来できます。時間になると、セクションは自動的に提出されます。',
			'exam.start' => '開始',
			'exam.timeUp' => '時間切れです',
			'exam.submitTitle' => 'このセクションを提出しますか？',
			'exam.submitAllAnswered' => 'すべての問題に解答しました。',
			'exam.submitUnanswered' => ({required Object count}) => '未解答の問題：${count}問',
			'exam.submit' => '提出する',
			'exam.previous' => '前へ',
			'exam.next' => '次へ',
			'exam.questionOf' => ({required Object current, required Object total}) => '問題 ${current}/${total}',
			'exam.resultTitle' => '結果',
			'exam.reviewAnswers' => '解答を確認する',
			'exam.back' => '戻る',
			'exam.passed' => '合格',
			'exam.failed' => '不合格',
			'exam.scoreNote' => '推定スコアです（全問同じ配点）。合格には総合80/180点以上、かつ各パートで38点・19点以上が必要です。',
			'exam.correctOf' => ({required Object total, required Object correct}) => '${total}問中${correct}問正解',
			'exam.listeningHint' => '聴解の合格最低点：19/60（32%）。安心のため、60%以上を目指しましょう。',
			'exam.languageHint' => '言語知識・読解の合格最低点：38/120（32%）。安心のため、60%以上を目指しましょう。',
			'exam.reviewTitle' => '見直し',
			'exam.onlyMistakes' => '間違いのみ',
			'exam.noMistakes' => '間違いはありません！',
			'exam.unanswered' => '未解答',
			'exam.correct' => '正解',
			'exam.incorrect' => '不正解',
			'exam.translation' => '訳',
			'exam.showTextTranslation' => '本文の訳を表示',
			'exam.hideTextTranslation' => '本文の訳を隠す',
			'exam.listen' => '聞く',
			'exam.stop' => '停止',
			'exam.instructions' => '指示',
			'exam.listening' => '再生中…',
			'exam.answerNow' => ({required Object seconds}) => '解答してください · ${seconds}秒',
			'exam.paused' => '一時停止中',
			'exam.resume' => '再開',
			'exam.pause' => '一時停止',
			_ => null,
		};
	}
}
