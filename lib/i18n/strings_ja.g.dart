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
	@override String get studyHubTitle => '学習センター';
	@override String get studyHubSubtitle => '文字体系を選んで、学習または練習を始めましょう。';
	@override String get paths => 'ルート';
	@override String get script => '文字';
	@override String get difficulty => '難易度';
	@override String get difficultyEasy => '簡単';
	@override String get difficultyMedium => '普通';
	@override String get difficultyHard => '難しい';
	@override String get difficultyEasyDesc => '単一選択';
	@override String get difficultyMediumDesc => 'テキスト入力';
	@override String get difficultyHardDesc => '描画';
	@override String get learn => '学ぶ';
	@override String get learnSubtitle => '文字と書き順のヒントを確認します。';
	@override String get practice => '練習';
	@override String get practiceSubtitle => '認識・書き取り・描画の練習。';
	@override String get materials => '教材';
	@override String get materialsSubtitle => 'ご自身のデータを含むCSVファイルをインポートしてください';
	@override String get dictionary => '辞書';
	@override String get dictionarySubtitle => '単語、かな、意味をすぐに検索できます。';
	@override String get statistics => '統計';
	@override String get statisticsSubtitle => 'かなタイプ別の継続性・正確さ・ペース。';
	@override String get settings => '設定';
	@override String get learningDefaults => '学習設定';
	@override String get testDifficulty => 'テスト難易度';
	@override String get testDifficultySubtitle => '練習の難易度を選択。';
	@override String get importCsv => 'CSVをインポート';
	@override String get expectedFormatTitle => '想定フォーマット';
	@override String get expectedFormatBody => '推奨ヘッダー:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\n任意の列を質問または回答として設定できます。CSVはカンマ区切り。';
	@override String fileLabel({required Object name, required Object count}) => 'ファイル: ${name}（${count} 行）';
	@override String get askWith => '質問形式';
	@override String get answerWith => '回答形式';
	@override String get newQuestion => '新しい問題';
	@override String get checkAnswer => '確認';
	@override String get materialsEmpty => 'CSVをインポートして「新しい問題」を押してください。';
	@override String get showAnswer => '答えを表示';
	@override String answerPrefix({required Object answer}) => '答え: ${answer}';
	@override String get beginSession => 'セッション開始';
	@override String get practiceStartSubtitle => '新しいラウンドを開始して連続記録を維持しましょう。';
	@override String get testStayFocused => '集中して、準備ができたら送信。';
	@override String get testSketchHint => 'キャンバス内に描いてください';
	@override String get testTypeRomaji => 'ローマ字を入力';
	@override String get testTypeMeaning => '意味を入力';
	@override String get testRomajiLabel => 'ローマ字読み';
	@override String get testMeaningLabel => 'スペイン語の意味';
	@override String get testTapToType => 'タップして入力';
	@override String testDrawThe({required Object script}) => '${script} を描いてください';
	@override String testWhichIs({required Object script}) => 'この ${script} はどれ？';
	@override String get testKanjiMeaning => 'この漢字の意味は？';
	@override String get statsNoDataTitle => '統計なし';
	@override String get statsNoDataSubtitle => 'テストを完了して連続記録やグラフを解放しましょう。';
	@override String get statsReset => '統計をリセット';
	@override String get statsActivity => '日別アクティビティ';
	@override String get statsActivitySubtitle => '過去14日間';
	@override String get statsEvolution => '推移';
	@override String get statsEvolutionSubtitle => '正解 vs 不正解';
	@override String get statsNoEvolution => '推移データなし。';
	@override String get statsNoActivity => 'まだアクティビティがありません。';
	@override String get statsAccuracy => '正確さ';
	@override String get statsStreak => '連続記録';
	@override String get statsLast7 => '過去7日間';
	@override String get statsLast30 => '過去30日間';
	@override String get statsSessions => 'セッション';
	@override String statsBest({required Object days}) => '最高 ${days} 日';
	@override String statsCorrect({required Object correct, required Object total}) => '${correct} / ${total} 正解';
	@override String get statsCorrectLabel => '正解';
	@override String get statsIncorrectLabel => '不正解';
	@override String get statsMomentum => 'モメンタム';
	@override String get statsView => '統計を見る';
	@override String get statsStartToUnlock => '練習を開始して統計を解放しましょう。';
	@override String get dictionaryEmpty => '単語を検索してみましょう。';
	@override String get searchHint => '単語、かな、ローマ字を検索...';
	@override String get correct => '正解！';
	@override String get incorrect => '不正解';
	@override String get oops => 'おっと、間違い…';
	@override String errorImporting({required Object error}) => 'インポートエラー: ${error}';
	@override String importedEntries({required Object file, required Object count}) => '${file} から ${count} 件をインポートしました';
	@override String get noValidRows => '有効な行が見つかりません。';
	@override String get dataNotFound => 'CSVにデータがありません。';
	@override String get materialsNeedImport => '練習前にCSVをインポートして列を選択してください。';
	@override String get materialsNeedStart => 'まず教材で問題を開始してください。';
	@override String get language => '言語';
	@override String get languageSubtitle => 'アプリの言語を選択。';
	@override String get back => '戻る';
	@override String get ok => 'OK';
	@override String get yourAnswer => 'あなたの答え';
	@override String statsStreakDays({required Object days}) => '${days} 日連続';
	@override String get statsAttempts => '試行回数';
	@override String get scriptHiragana => 'ひらがな';
	@override String get scriptKatakana => 'カタカナ';
	@override String get scriptKanji => '漢字';
	@override String get testModeDrawing => '描画';
	@override String get testModeQuiz => 'クイズ';
	@override String get dictionaryNotes => 'メモ';
	@override String get dictionarySeeAlso => '関連項目';
	@override String get confirmActionTitle => '操作の確認';
	@override String get confirmActionBody => '本当にすべての統計を削除しますか？';
	@override String get cancel => 'キャンセル';
	@override String get delete => '削除';
	@override String get searchByMeaning => '意味で検索';
	@override String get filterAll => 'すべて';
	@override String get tabStudy => '学習';
	@override String get tabStats => '統計';
	@override String get settingsHapticsTitle => 'バイブレーション';
	@override String get settingsHapticsSubtitle => '正解または不正解時に振動します。';
	@override String get settingsKanaSizeTitle => 'かなサイズ';
	@override String get settingsKanaSizeSubtitle => 'インターフェース内のかなのサイズを調整します。';
	@override String settingsKanaSizeValue({required Object value}) => '${value}x';
	@override String get settingsKanjiJlptTitle => 'JLPT漢字レベル';
	@override String get settingsKanjiJlptSubtitle => '漢字をJLPTレベルで制限します。';
	@override String get kanjiFilterEmpty => 'このJLPTレベルに対応する漢字はありません。';
	@override String get loginTitle => 'Kana Masterにサインイン';
	@override String get loginSubtitle => '進捗を保存し、デバイス間で同期し、プレミアム特典をアンロックします。';
	@override String get loginApple => 'Appleで続行';
	@override String get loginGoogle => 'Googleで続行';
	@override String get loginOr => 'または';
	@override String get loginFooter => '続行することで、利用規約とプライバシーポリシーに同意したことになります。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.studyHubTitle' => '学習センター',
			'app.studyHubSubtitle' => '文字体系を選んで、学習または練習を始めましょう。',
			'app.paths' => 'ルート',
			'app.script' => '文字',
			'app.difficulty' => '難易度',
			'app.difficultyEasy' => '簡単',
			'app.difficultyMedium' => '普通',
			'app.difficultyHard' => '難しい',
			'app.difficultyEasyDesc' => '単一選択',
			'app.difficultyMediumDesc' => 'テキスト入力',
			'app.difficultyHardDesc' => '描画',
			'app.learn' => '学ぶ',
			'app.learnSubtitle' => '文字と書き順のヒントを確認します。',
			'app.practice' => '練習',
			'app.practiceSubtitle' => '認識・書き取り・描画の練習。',
			'app.materials' => '教材',
			'app.materialsSubtitle' => 'ご自身のデータを含むCSVファイルをインポートしてください',
			'app.dictionary' => '辞書',
			'app.dictionarySubtitle' => '単語、かな、意味をすぐに検索できます。',
			'app.statistics' => '統計',
			'app.statisticsSubtitle' => 'かなタイプ別の継続性・正確さ・ペース。',
			'app.settings' => '設定',
			'app.learningDefaults' => '学習設定',
			'app.testDifficulty' => 'テスト難易度',
			'app.testDifficultySubtitle' => '練習の難易度を選択。',
			'app.importCsv' => 'CSVをインポート',
			'app.expectedFormatTitle' => '想定フォーマット',
			'app.expectedFormatBody' => '推奨ヘッダー:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\n任意の列を質問または回答として設定できます。CSVはカンマ区切り。',
			'app.fileLabel' => ({required Object name, required Object count}) => 'ファイル: ${name}（${count} 行）',
			'app.askWith' => '質問形式',
			'app.answerWith' => '回答形式',
			'app.newQuestion' => '新しい問題',
			'app.checkAnswer' => '確認',
			'app.materialsEmpty' => 'CSVをインポートして「新しい問題」を押してください。',
			'app.showAnswer' => '答えを表示',
			'app.answerPrefix' => ({required Object answer}) => '答え: ${answer}',
			'app.beginSession' => 'セッション開始',
			'app.practiceStartSubtitle' => '新しいラウンドを開始して連続記録を維持しましょう。',
			'app.testStayFocused' => '集中して、準備ができたら送信。',
			'app.testSketchHint' => 'キャンバス内に描いてください',
			'app.testTypeRomaji' => 'ローマ字を入力',
			'app.testTypeMeaning' => '意味を入力',
			'app.testRomajiLabel' => 'ローマ字読み',
			'app.testMeaningLabel' => 'スペイン語の意味',
			'app.testTapToType' => 'タップして入力',
			'app.testDrawThe' => ({required Object script}) => '${script} を描いてください',
			'app.testWhichIs' => ({required Object script}) => 'この ${script} はどれ？',
			'app.testKanjiMeaning' => 'この漢字の意味は？',
			'app.statsNoDataTitle' => '統計なし',
			'app.statsNoDataSubtitle' => 'テストを完了して連続記録やグラフを解放しましょう。',
			'app.statsReset' => '統計をリセット',
			'app.statsActivity' => '日別アクティビティ',
			'app.statsActivitySubtitle' => '過去14日間',
			'app.statsEvolution' => '推移',
			'app.statsEvolutionSubtitle' => '正解 vs 不正解',
			'app.statsNoEvolution' => '推移データなし。',
			'app.statsNoActivity' => 'まだアクティビティがありません。',
			'app.statsAccuracy' => '正確さ',
			'app.statsStreak' => '連続記録',
			'app.statsLast7' => '過去7日間',
			'app.statsLast30' => '過去30日間',
			'app.statsSessions' => 'セッション',
			'app.statsBest' => ({required Object days}) => '最高 ${days} 日',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct} / ${total} 正解',
			'app.statsCorrectLabel' => '正解',
			'app.statsIncorrectLabel' => '不正解',
			'app.statsMomentum' => 'モメンタム',
			'app.statsView' => '統計を見る',
			'app.statsStartToUnlock' => '練習を開始して統計を解放しましょう。',
			'app.dictionaryEmpty' => '単語を検索してみましょう。',
			'app.searchHint' => '単語、かな、ローマ字を検索...',
			'app.correct' => '正解！',
			'app.incorrect' => '不正解',
			'app.oops' => 'おっと、間違い…',
			'app.errorImporting' => ({required Object error}) => 'インポートエラー: ${error}',
			'app.importedEntries' => ({required Object file, required Object count}) => '${file} から ${count} 件をインポートしました',
			'app.noValidRows' => '有効な行が見つかりません。',
			'app.dataNotFound' => 'CSVにデータがありません。',
			'app.materialsNeedImport' => '練習前にCSVをインポートして列を選択してください。',
			'app.materialsNeedStart' => 'まず教材で問題を開始してください。',
			'app.language' => '言語',
			'app.languageSubtitle' => 'アプリの言語を選択。',
			'app.back' => '戻る',
			'app.ok' => 'OK',
			'app.yourAnswer' => 'あなたの答え',
			'app.statsStreakDays' => ({required Object days}) => '${days} 日連続',
			'app.statsAttempts' => '試行回数',
			'app.scriptHiragana' => 'ひらがな',
			'app.scriptKatakana' => 'カタカナ',
			'app.scriptKanji' => '漢字',
			'app.testModeDrawing' => '描画',
			'app.testModeQuiz' => 'クイズ',
			'app.dictionaryNotes' => 'メモ',
			'app.dictionarySeeAlso' => '関連項目',
			'app.confirmActionTitle' => '操作の確認',
			'app.confirmActionBody' => '本当にすべての統計を削除しますか？',
			'app.cancel' => 'キャンセル',
			'app.delete' => '削除',
			'app.searchByMeaning' => '意味で検索',
			'app.filterAll' => 'すべて',
			'app.tabStudy' => '学習',
			'app.tabStats' => '統計',
			'app.settingsHapticsTitle' => 'バイブレーション',
			'app.settingsHapticsSubtitle' => '正解または不正解時に振動します。',
			'app.settingsKanaSizeTitle' => 'かなサイズ',
			'app.settingsKanaSizeSubtitle' => 'インターフェース内のかなのサイズを調整します。',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'JLPT漢字レベル',
			'app.settingsKanjiJlptSubtitle' => '漢字をJLPTレベルで制限します。',
			'app.kanjiFilterEmpty' => 'このJLPTレベルに対応する漢字はありません。',
			'app.loginTitle' => 'Kana Masterにサインイン',
			'app.loginSubtitle' => '進捗を保存し、デバイス間で同期し、プレミアム特典をアンロックします。',
			'app.loginApple' => 'Appleで続行',
			'app.loginGoogle' => 'Googleで続行',
			'app.loginOr' => 'または',
			'app.loginFooter' => '続行することで、利用規約とプライバシーポリシーに同意したことになります。',
			_ => null,
		};
	}
}
