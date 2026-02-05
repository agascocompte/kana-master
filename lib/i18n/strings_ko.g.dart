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
class TranslationsKo with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsKo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ko,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ko>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsKo _root = this; // ignore: unused_field

	@override 
	TranslationsKo $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsKo(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppKo app = _TranslationsAppKo._(_root);
}

// Path: app
class _TranslationsAppKo implements TranslationsAppEn {
	_TranslationsAppKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get studyHubTitle => '학습 센터';
	@override String get studyHubSubtitle => '문자 체계를 선택하고 학습이나 연습을 시작하세요.';
	@override String get paths => '경로';
	@override String get script => '문자';
	@override String get difficulty => '난이도';
	@override String get difficultyEasy => '쉬움';
	@override String get difficultyMedium => '보통';
	@override String get difficultyHard => '어려움';
	@override String get difficultyEasyDesc => '단일 선택';
	@override String get difficultyMediumDesc => '텍스트 입력';
	@override String get difficultyHardDesc => '그리기';
	@override String get learn => '학습';
	@override String get learnSubtitle => '문자와 획순 힌트를 살펴보세요.';
	@override String get practice => '연습';
	@override String get practiceSubtitle => '인식, 쓰기 및 그리기 연습.';
	@override String get materials => '자료';
	@override String get materialsSubtitle => '자신의 데이터가 포함된 CSV 파일을 가져옵니다.';
	@override String get dictionary => '사전';
	@override String get dictionarySubtitle => '단어, 가나 및 의미를 즉시 검색하세요.';
	@override String get statistics => '통계';
	@override String get statisticsSubtitle => '가나 유형별 일관성, 정확도 및 속도.';
	@override String get settings => '설정';
	@override String get learningDefaults => '학습 기본 설정';
	@override String get testDifficulty => '테스트 난이도';
	@override String get testDifficultySubtitle => '연습 난이도를 선택하세요.';
	@override String get importCsv => 'CSV 가져오기';
	@override String get expectedFormatTitle => '예상 형식';
	@override String get expectedFormatBody => '권장 헤더:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\n어떤 열이든 질문 또는 답변으로 매핑할 수 있습니다. CSV는 쉼표로 구분됩니다.';
	@override String fileLabel({required Object name, required Object count}) => '파일: ${name} (${count}행)';
	@override String get askWith => '질문 방식';
	@override String get answerWith => '답변 방식';
	@override String get newQuestion => '새 질문';
	@override String get checkAnswer => '확인';
	@override String get materialsEmpty => 'CSV를 가져오고 "새 질문"을 눌러 시작하세요.';
	@override String get showAnswer => '정답 보기';
	@override String answerPrefix({required Object answer}) => '정답: ${answer}';
	@override String get beginSession => '세션 시작';
	@override String get practiceStartSubtitle => '새 라운드를 시작하고 연속 기록을 유지하세요.';
	@override String get testStayFocused => '집중하고 준비되면 제출하세요.';
	@override String get testSketchHint => '캔버스 안에 그리세요';
	@override String get testTypeRomaji => '로마자 입력';
	@override String get testTypeMeaning => '의미 입력';
	@override String get testRomajiLabel => '로마자 읽기';
	@override String get testMeaningLabel => '스페인어 의미';
	@override String get testTapToType => '탭하여 입력';
	@override String testDrawThe({required Object script}) => '${script} 그리기';
	@override String testWhichIs({required Object script}) => '이 ${script}는 무엇인가요?';
	@override String get testKanjiMeaning => '이 한자의 의미는?';
	@override String get statsNoDataTitle => '통계 없음';
	@override String get statsNoDataSubtitle => '테스트를 완료하여 연속 기록과 그래프를 잠금 해제하세요.';
	@override String get statsReset => '통계 초기화';
	@override String get statsActivity => '일일 활동';
	@override String get statsActivitySubtitle => '최근 14일';
	@override String get statsEvolution => '변화 추이';
	@override String get statsEvolutionSubtitle => '정답 vs 오답';
	@override String get statsNoEvolution => '변화 데이터 없음.';
	@override String get statsNoActivity => '아직 활동이 없습니다.';
	@override String get statsAccuracy => '정확도';
	@override String get statsStreak => '연속 기록';
	@override String get statsLast7 => '최근 7일';
	@override String get statsLast30 => '최근 30일';
	@override String get statsSessions => '세션';
	@override String statsBest({required Object days}) => '최고 ${days}일';
	@override String statsCorrect({required Object correct, required Object total}) => '${correct} / ${total} 정답';
	@override String get statsCorrectLabel => '정답';
	@override String get statsIncorrectLabel => '오답';
	@override String get statsMomentum => '모멘텀';
	@override String get statsView => '통계 보기';
	@override String get statsStartToUnlock => '연습을 시작해 통계를 잠금 해제하세요.';
	@override String get dictionaryEmpty => '단어 검색을 시작하세요.';
	@override String get searchHint => '단어, 가나, 로마자 검색...';
	@override String get correct => '정답!';
	@override String get incorrect => '오답입니다';
	@override String get oops => '앗, 틀렸어요...';
	@override String errorImporting({required Object error}) => '가져오기 오류: ${error}';
	@override String importedEntries({required Object file, required Object count}) => '${file}에서 ${count}개 항목 가져옴';
	@override String get noValidRows => '유효한 행을 찾을 수 없습니다.';
	@override String get dataNotFound => 'CSV에 데이터가 없습니다.';
	@override String get materialsNeedImport => '연습 전에 CSV를 가져오고 열을 선택하세요.';
	@override String get materialsNeedStart => '먼저 자료로 질문을 시작하세요.';
	@override String get language => '언어';
	@override String get languageSubtitle => '앱 언어를 선택하세요.';
	@override String get back => '뒤로';
	@override String get ok => '확인';
	@override String get yourAnswer => '내 답변';
	@override String statsStreakDays({required Object days}) => '${days}일 연속';
	@override String get statsAttempts => '시도';
	@override String get scriptHiragana => '히라가나';
	@override String get scriptKatakana => '가타카나';
	@override String get scriptKanji => '한자';
	@override String get testModeDrawing => '그리기';
	@override String get testModeQuiz => '퀴즈';
	@override String get dictionaryNotes => '노트';
	@override String get dictionarySeeAlso => '관련 항목';
	@override String get confirmActionTitle => '작업 확인';
	@override String get confirmActionBody => '정말로 모든 통계를 삭제하시겠습니까?';
	@override String get cancel => '취소';
	@override String get delete => '삭제';
	@override String get searchByMeaning => '의미로 검색';
	@override String get filterAll => '전체';
	@override String get tabStudy => '학습';
	@override String get tabStats => '통계';
	@override String get settingsHapticsTitle => '진동';
	@override String get settingsHapticsSubtitle => '정답 또는 오답 시 진동합니다.';
	@override String get settingsKanaSizeTitle => '가나 크기';
	@override String get settingsKanaSizeSubtitle => '인터페이스에서 가나 크기를 조정합니다.';
	@override String settingsKanaSizeValue({required Object value}) => '${value}x';
	@override String get settingsKanjiJlptTitle => 'JLPT 한자 레벨';
	@override String get settingsKanjiJlptSubtitle => '한자를 JLPT 레벨로 제한합니다.';
	@override String get kanjiFilterEmpty => '이 JLPT 레벨에는 한자가 없습니다.';
}

/// The flat map containing all translations for locale <ko>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsKo {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.studyHubTitle' => '학습 센터',
			'app.studyHubSubtitle' => '문자 체계를 선택하고 학습이나 연습을 시작하세요.',
			'app.paths' => '경로',
			'app.script' => '문자',
			'app.difficulty' => '난이도',
			'app.difficultyEasy' => '쉬움',
			'app.difficultyMedium' => '보통',
			'app.difficultyHard' => '어려움',
			'app.difficultyEasyDesc' => '단일 선택',
			'app.difficultyMediumDesc' => '텍스트 입력',
			'app.difficultyHardDesc' => '그리기',
			'app.learn' => '학습',
			'app.learnSubtitle' => '문자와 획순 힌트를 살펴보세요.',
			'app.practice' => '연습',
			'app.practiceSubtitle' => '인식, 쓰기 및 그리기 연습.',
			'app.materials' => '자료',
			'app.materialsSubtitle' => '자신의 데이터가 포함된 CSV 파일을 가져옵니다.',
			'app.dictionary' => '사전',
			'app.dictionarySubtitle' => '단어, 가나 및 의미를 즉시 검색하세요.',
			'app.statistics' => '통계',
			'app.statisticsSubtitle' => '가나 유형별 일관성, 정확도 및 속도.',
			'app.settings' => '설정',
			'app.learningDefaults' => '학습 기본 설정',
			'app.testDifficulty' => '테스트 난이도',
			'app.testDifficultySubtitle' => '연습 난이도를 선택하세요.',
			'app.importCsv' => 'CSV 가져오기',
			'app.expectedFormatTitle' => '예상 형식',
			'app.expectedFormatBody' => '권장 헤더:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\n어떤 열이든 질문 또는 답변으로 매핑할 수 있습니다. CSV는 쉼표로 구분됩니다.',
			'app.fileLabel' => ({required Object name, required Object count}) => '파일: ${name} (${count}행)',
			'app.askWith' => '질문 방식',
			'app.answerWith' => '답변 방식',
			'app.newQuestion' => '새 질문',
			'app.checkAnswer' => '확인',
			'app.materialsEmpty' => 'CSV를 가져오고 "새 질문"을 눌러 시작하세요.',
			'app.showAnswer' => '정답 보기',
			'app.answerPrefix' => ({required Object answer}) => '정답: ${answer}',
			'app.beginSession' => '세션 시작',
			'app.practiceStartSubtitle' => '새 라운드를 시작하고 연속 기록을 유지하세요.',
			'app.testStayFocused' => '집중하고 준비되면 제출하세요.',
			'app.testSketchHint' => '캔버스 안에 그리세요',
			'app.testTypeRomaji' => '로마자 입력',
			'app.testTypeMeaning' => '의미 입력',
			'app.testRomajiLabel' => '로마자 읽기',
			'app.testMeaningLabel' => '스페인어 의미',
			'app.testTapToType' => '탭하여 입력',
			'app.testDrawThe' => ({required Object script}) => '${script} 그리기',
			'app.testWhichIs' => ({required Object script}) => '이 ${script}는 무엇인가요?',
			'app.testKanjiMeaning' => '이 한자의 의미는?',
			'app.statsNoDataTitle' => '통계 없음',
			'app.statsNoDataSubtitle' => '테스트를 완료하여 연속 기록과 그래프를 잠금 해제하세요.',
			'app.statsReset' => '통계 초기화',
			'app.statsActivity' => '일일 활동',
			'app.statsActivitySubtitle' => '최근 14일',
			'app.statsEvolution' => '변화 추이',
			'app.statsEvolutionSubtitle' => '정답 vs 오답',
			'app.statsNoEvolution' => '변화 데이터 없음.',
			'app.statsNoActivity' => '아직 활동이 없습니다.',
			'app.statsAccuracy' => '정확도',
			'app.statsStreak' => '연속 기록',
			'app.statsLast7' => '최근 7일',
			'app.statsLast30' => '최근 30일',
			'app.statsSessions' => '세션',
			'app.statsBest' => ({required Object days}) => '최고 ${days}일',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct} / ${total} 정답',
			'app.statsCorrectLabel' => '정답',
			'app.statsIncorrectLabel' => '오답',
			'app.statsMomentum' => '모멘텀',
			'app.statsView' => '통계 보기',
			'app.statsStartToUnlock' => '연습을 시작해 통계를 잠금 해제하세요.',
			'app.dictionaryEmpty' => '단어 검색을 시작하세요.',
			'app.searchHint' => '단어, 가나, 로마자 검색...',
			'app.correct' => '정답!',
			'app.incorrect' => '오답입니다',
			'app.oops' => '앗, 틀렸어요...',
			'app.errorImporting' => ({required Object error}) => '가져오기 오류: ${error}',
			'app.importedEntries' => ({required Object file, required Object count}) => '${file}에서 ${count}개 항목 가져옴',
			'app.noValidRows' => '유효한 행을 찾을 수 없습니다.',
			'app.dataNotFound' => 'CSV에 데이터가 없습니다.',
			'app.materialsNeedImport' => '연습 전에 CSV를 가져오고 열을 선택하세요.',
			'app.materialsNeedStart' => '먼저 자료로 질문을 시작하세요.',
			'app.language' => '언어',
			'app.languageSubtitle' => '앱 언어를 선택하세요.',
			'app.back' => '뒤로',
			'app.ok' => '확인',
			'app.yourAnswer' => '내 답변',
			'app.statsStreakDays' => ({required Object days}) => '${days}일 연속',
			'app.statsAttempts' => '시도',
			'app.scriptHiragana' => '히라가나',
			'app.scriptKatakana' => '가타카나',
			'app.scriptKanji' => '한자',
			'app.testModeDrawing' => '그리기',
			'app.testModeQuiz' => '퀴즈',
			'app.dictionaryNotes' => '노트',
			'app.dictionarySeeAlso' => '관련 항목',
			'app.confirmActionTitle' => '작업 확인',
			'app.confirmActionBody' => '정말로 모든 통계를 삭제하시겠습니까?',
			'app.cancel' => '취소',
			'app.delete' => '삭제',
			'app.searchByMeaning' => '의미로 검색',
			'app.filterAll' => '전체',
			'app.tabStudy' => '학습',
			'app.tabStats' => '통계',
			'app.settingsHapticsTitle' => '진동',
			'app.settingsHapticsSubtitle' => '정답 또는 오답 시 진동합니다.',
			'app.settingsKanaSizeTitle' => '가나 크기',
			'app.settingsKanaSizeSubtitle' => '인터페이스에서 가나 크기를 조정합니다.',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'JLPT 한자 레벨',
			'app.settingsKanjiJlptSubtitle' => '한자를 JLPT 레벨로 제한합니다.',
			'app.kanjiFilterEmpty' => '이 JLPT 레벨에는 한자가 없습니다.',
			_ => null,
		};
	}
}
