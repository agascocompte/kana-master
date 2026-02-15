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
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsJa _root = this; // ignore: unused_field

	@override 
	TranslationsJa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsJa(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppJa app = _TranslationsAppJa._(_root);
}

// Path: app
class _TranslationsAppJa implements TranslationsAppEn {
	_TranslationsAppJa._(this._root);

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
	@override String get premiumTitle => 'Kana Master Premium';
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
			'app.premiumTitle' => 'Kana Master Premium',
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
			_ => null,
		};
	}
}
