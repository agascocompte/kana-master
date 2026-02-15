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
	@override String get studyHubTitle => '학습 허브';
	@override String get studyHubSubtitle => '문자를 선택하고 학습이나 연습을 시작하세요.';
	@override String get paths => '코스';
	@override String get script => '문자';
	@override String get difficulty => '난이도';
	@override String get difficultyEasy => '쉬움';
	@override String get difficultyMedium => '보통';
	@override String get difficultyHard => '어려움';
	@override String get difficultyEasyDesc => '단일 선택';
	@override String get difficultyMediumDesc => '텍스트';
	@override String get difficultyHardDesc => '그리기';
	@override String get learn => '학습';
	@override String get learnSubtitle => '문자와 획순 힌트를 확인하세요.';
	@override String get practice => '연습';
	@override String get practiceSubtitle => '인식, 입력, 그리기 연습.';
	@override String get materials => '자료';
	@override String get materialsSubtitle => 'CSV 파일을 가져오세요.';
	@override String get dictionary => '사전';
	@override String get dictionarySubtitle => '단어, 가나, 의미를 빠르게 검색.';
	@override String get statistics => '통계';
	@override String get statisticsSubtitle => '정확도와 학습 흐름 확인.';
	@override String get settings => '설정';
	@override String get learningDefaults => '학습 설정';
	@override String get testDifficulty => '테스트 난이도';
	@override String get testDifficultySubtitle => '연습 난이도를 선택하세요.';
	@override String get importCsv => 'CSV 가져오기';
	@override String get expectedFormatTitle => '권장 형식';
	@override String get expectedFormatBody => '권장 헤더:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\n어떤 열이든 질문이나 답으로 설정할 수 있습니다. CSV는 쉼표로 구분됩니다.';
	@override String fileLabel({required Object name, required Object count}) => '파일: ${name} (${count})';
	@override String get askWith => '출제 방식';
	@override String get answerWith => '답변 방식';
	@override String get newQuestion => '새 문제';
	@override String get checkAnswer => '확인';
	@override String get materialsEmpty => 'CSV를 가져온 후 "새 문제"를 눌러 시작하세요.';
	@override String get showAnswer => '정답 보기';
	@override String answerPrefix({required Object answer}) => '정답: ${answer}';
	@override String get beginSession => '시작';
	@override String get practiceStartSubtitle => '새 라운드를 시작하세요.';
	@override String get testStayFocused => '집중해서 준비되면 제출하세요.';
	@override String get testSketchHint => '영역 안에 그리세요';
	@override String get testTypeRomaji => '로마자 입력';
	@override String get testTypeMeaning => '의미 입력';
	@override String get testRomajiLabel => '로마자 읽기';
	@override String get testMeaningLabel => '스페인어 의미';
	@override String get testTapToType => '탭하여 입력';
	@override String testDrawThe({required Object script}) => '${script} 그리기';
	@override String testWhichIs({required Object script}) => '이 ${script}는 무엇인가요?';
	@override String get testKanjiMeaning => '이 한자의 의미는?';
	@override String get statsNoDataTitle => '통계 없음';
	@override String get statsNoDataSubtitle => '테스트를 완료하면 통계를 확인할 수 있어요.';
	@override String get statsReset => '통계 초기화';
	@override String get statsActivity => '학습 기록';
	@override String get statsActivitySubtitle => '최근 14일';
	@override String get statsEvolution => '변화';
	@override String get statsEvolutionSubtitle => '정답 vs 오답';
	@override String get statsNoEvolution => '데이터가 없습니다.';
	@override String get statsNoActivity => '아직 활동이 없습니다.';
	@override String get statsAccuracy => '정확도';
	@override String get statsStreak => '연속 기록';
	@override String get statsLast7 => '최근 7일';
	@override String get statsLast30 => '최근 30일';
	@override String get statsSessions => '세션';
	@override String statsBest({required Object days}) => '최고 ${days}일';
	@override String statsCorrect({required Object correct, required Object total}) => '${correct}/${total} 정답';
	@override String get statsCorrectLabel => '정답';
	@override String get statsIncorrectLabel => '오답';
	@override String get statsMomentum => '모멘텀';
	@override String get statsView => '통계 보기';
	@override String get statsStartToUnlock => '연습을 시작해 통계를 확인하세요.';
	@override String get dictionaryEmpty => '단어를 검색해 보세요.';
	@override String get searchHint => '단어, 가나, 로마자 검색...';
	@override String get correct => '정답!';
	@override String get incorrect => '오답';
	@override String get oops => '앗...';
	@override String errorImporting({required Object error}) => '가져오기 오류: ${error}';
	@override String importedEntries({required Object file, required Object count}) => '${file}에서 ${count}개 가져옴';
	@override String get noValidRows => '유효한 행이 없습니다.';
	@override String get dataNotFound => 'CSV에 데이터가 없습니다.';
	@override String get materialsNeedImport => 'CSV를 가져오고 열을 선택하세요.';
	@override String get materialsNeedStart => '먼저 문제를 시작하세요.';
	@override String get language => '언어';
	@override String get languageSubtitle => '앱 언어 선택.';
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
	@override String get dictionaryNotes => '메모';
	@override String get dictionarySeeAlso => '관련 항목';
	@override String get confirmActionTitle => '확인';
	@override String get confirmActionBody => '모든 통계를 삭제하시겠습니까?';
	@override String get cancel => '취소';
	@override String get delete => '삭제';
	@override String get searchByMeaning => '의미로 검색';
	@override String get filterAll => '전체';
	@override String get tabStudy => '학습';
	@override String get tabStats => '통계';
	@override String get settingsHapticsTitle => '진동';
	@override String get settingsHapticsSubtitle => '정답/오답 시 진동.';
	@override String get settingsKanaSizeTitle => '가나 크기';
	@override String get settingsKanaSizeSubtitle => '가나 표시 크기 조절.';
	@override String settingsKanaSizeValue({required Object value}) => '${value}x';
	@override String get settingsKanjiJlptTitle => 'JLPT 레벨';
	@override String get settingsKanjiJlptSubtitle => 'JLPT 기준으로 한자 제한.';
	@override String get settingsUseModelHiraganaTitle => '히라가나 AI';
	@override String get settingsUseModelHiraganaSubtitle => '그리기 인식에 AI 사용.';
	@override String get settingsUseModelKatakanaTitle => '가타카나 AI';
	@override String get settingsUseModelKatakanaSubtitle => '그리기 인식에 AI 사용.';
	@override String get settingsUseModelKanjiTitle => '한자 AI';
	@override String get settingsUseModelKanjiSubtitle => '그리기 인식에 AI 사용.';
	@override String get kanjiFilterEmpty => '이 JLPT 레벨에 한자가 없습니다.';
	@override String get settingsBackupTitle => '백업';
	@override String get settingsBackupSubtitle => 'JSON으로 진행 상황 내보내기/가져오기.';
	@override String get settingsBackupExportButton => '내보내기';
	@override String get settingsBackupImportButton => '가져오기';
	@override String settingsBackupExported({required Object path}) => '${path}에 저장됨';
	@override String settingsBackupImported({required Object count}) => '${count}개 가져옴';
	@override String settingsBackupError({required Object error}) => '백업 오류: ${error}';
	@override String get settingsGeneralSection => '일반';
	@override String get settingsAiModelsSection => 'AI 모델';
	@override String get settingsKanjiFilterSection => '한자 필터';
	@override String get settingsDataSection => '데이터';
	@override String get testGuideShow => '가이드 보기';
	@override String get testGuideHide => '가이드 숨기기';
	@override String get testReportDrawing => '그림 신고';
	@override String get testReportConfirmBody => '이 리포트를 지금 전송하시겠습니까?';
	@override String get testReportThanks => '감사합니다. 리포트를 준비했습니다.';
	@override String get testReportError => '리포트 생성 실패.';
	@override String get testKanjiTraceHint => '획순을 따라 그리세요. 필요하면 가이드를 켜세요.';
	@override String get aiInfoTitle => 'AI 모델로 그리기';
	@override String get aiInfoLine1 => 'AI 인식은 때때로 실패할 수 있습니다.';
	@override String get aiInfoLine2 => '실패하면 모델을 비활성화하여 스트로크 기반 평가를 사용하세요.';
	@override String get aiInfoLine3 => '오인식을 신고하여 개선에 도움을 주세요.';
	@override String get premiumSectionTitle => 'Premium';
	@override String get premiumSectionSubtitle => 'Unlock all features and remove interstitial ads.';
	@override String get premiumOpenButton => 'Upgrade';
	@override String get premiumLockedMessage => 'Premium feature. Upgrade to unlock it.';
	@override String get premiumTitle => 'Kana Master Premium';
	@override String get premiumSubtitle => 'One-time purchase, all features unlocked.';
	@override String get premiumHeroTitle => 'Learn without limits';
	@override String get premiumHeroBody => 'Get the full experience and support the project.';
	@override String get premiumBenefitNoAds => 'No interstitial ads';
	@override String get premiumBenefitMaterials => 'Access Materials mode';
	@override String get premiumBenefitHard => 'Use high difficulty';
	@override String get premiumBenefitAi => 'Enable AI model options';
	@override String get premiumBenefitBackup => 'Export/import statistics';
	@override String premiumBuyButton({required Object price}) => 'Buy for ${price}';
	@override String get premiumRestoreButton => 'Restore purchases';
	@override String get premiumOwnedBadge => 'Premium unlocked';
	@override String get premiumStoreUnavailable => 'Store unavailable. Try again later.';
	@override String premiumPurchaseError({required Object error}) => 'Purchase failed: ${error}';
	@override String get premiumPurchased => 'Purchase completed. Premium unlocked.';
	@override String get premiumRestored => 'Purchases restored.';
}

/// The flat map containing all translations for locale <ko>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsKo {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.studyHubTitle' => '학습 허브',
			'app.studyHubSubtitle' => '문자를 선택하고 학습이나 연습을 시작하세요.',
			'app.paths' => '코스',
			'app.script' => '문자',
			'app.difficulty' => '난이도',
			'app.difficultyEasy' => '쉬움',
			'app.difficultyMedium' => '보통',
			'app.difficultyHard' => '어려움',
			'app.difficultyEasyDesc' => '단일 선택',
			'app.difficultyMediumDesc' => '텍스트',
			'app.difficultyHardDesc' => '그리기',
			'app.learn' => '학습',
			'app.learnSubtitle' => '문자와 획순 힌트를 확인하세요.',
			'app.practice' => '연습',
			'app.practiceSubtitle' => '인식, 입력, 그리기 연습.',
			'app.materials' => '자료',
			'app.materialsSubtitle' => 'CSV 파일을 가져오세요.',
			'app.dictionary' => '사전',
			'app.dictionarySubtitle' => '단어, 가나, 의미를 빠르게 검색.',
			'app.statistics' => '통계',
			'app.statisticsSubtitle' => '정확도와 학습 흐름 확인.',
			'app.settings' => '설정',
			'app.learningDefaults' => '학습 설정',
			'app.testDifficulty' => '테스트 난이도',
			'app.testDifficultySubtitle' => '연습 난이도를 선택하세요.',
			'app.importCsv' => 'CSV 가져오기',
			'app.expectedFormatTitle' => '권장 형식',
			'app.expectedFormatBody' => '권장 헤더:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\n어떤 열이든 질문이나 답으로 설정할 수 있습니다. CSV는 쉼표로 구분됩니다.',
			'app.fileLabel' => ({required Object name, required Object count}) => '파일: ${name} (${count})',
			'app.askWith' => '출제 방식',
			'app.answerWith' => '답변 방식',
			'app.newQuestion' => '새 문제',
			'app.checkAnswer' => '확인',
			'app.materialsEmpty' => 'CSV를 가져온 후 "새 문제"를 눌러 시작하세요.',
			'app.showAnswer' => '정답 보기',
			'app.answerPrefix' => ({required Object answer}) => '정답: ${answer}',
			'app.beginSession' => '시작',
			'app.practiceStartSubtitle' => '새 라운드를 시작하세요.',
			'app.testStayFocused' => '집중해서 준비되면 제출하세요.',
			'app.testSketchHint' => '영역 안에 그리세요',
			'app.testTypeRomaji' => '로마자 입력',
			'app.testTypeMeaning' => '의미 입력',
			'app.testRomajiLabel' => '로마자 읽기',
			'app.testMeaningLabel' => '스페인어 의미',
			'app.testTapToType' => '탭하여 입력',
			'app.testDrawThe' => ({required Object script}) => '${script} 그리기',
			'app.testWhichIs' => ({required Object script}) => '이 ${script}는 무엇인가요?',
			'app.testKanjiMeaning' => '이 한자의 의미는?',
			'app.statsNoDataTitle' => '통계 없음',
			'app.statsNoDataSubtitle' => '테스트를 완료하면 통계를 확인할 수 있어요.',
			'app.statsReset' => '통계 초기화',
			'app.statsActivity' => '학습 기록',
			'app.statsActivitySubtitle' => '최근 14일',
			'app.statsEvolution' => '변화',
			'app.statsEvolutionSubtitle' => '정답 vs 오답',
			'app.statsNoEvolution' => '데이터가 없습니다.',
			'app.statsNoActivity' => '아직 활동이 없습니다.',
			'app.statsAccuracy' => '정확도',
			'app.statsStreak' => '연속 기록',
			'app.statsLast7' => '최근 7일',
			'app.statsLast30' => '최근 30일',
			'app.statsSessions' => '세션',
			'app.statsBest' => ({required Object days}) => '최고 ${days}일',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct}/${total} 정답',
			'app.statsCorrectLabel' => '정답',
			'app.statsIncorrectLabel' => '오답',
			'app.statsMomentum' => '모멘텀',
			'app.statsView' => '통계 보기',
			'app.statsStartToUnlock' => '연습을 시작해 통계를 확인하세요.',
			'app.dictionaryEmpty' => '단어를 검색해 보세요.',
			'app.searchHint' => '단어, 가나, 로마자 검색...',
			'app.correct' => '정답!',
			'app.incorrect' => '오답',
			'app.oops' => '앗...',
			'app.errorImporting' => ({required Object error}) => '가져오기 오류: ${error}',
			'app.importedEntries' => ({required Object file, required Object count}) => '${file}에서 ${count}개 가져옴',
			'app.noValidRows' => '유효한 행이 없습니다.',
			'app.dataNotFound' => 'CSV에 데이터가 없습니다.',
			'app.materialsNeedImport' => 'CSV를 가져오고 열을 선택하세요.',
			'app.materialsNeedStart' => '먼저 문제를 시작하세요.',
			'app.language' => '언어',
			'app.languageSubtitle' => '앱 언어 선택.',
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
			'app.dictionaryNotes' => '메모',
			'app.dictionarySeeAlso' => '관련 항목',
			'app.confirmActionTitle' => '확인',
			'app.confirmActionBody' => '모든 통계를 삭제하시겠습니까?',
			'app.cancel' => '취소',
			'app.delete' => '삭제',
			'app.searchByMeaning' => '의미로 검색',
			'app.filterAll' => '전체',
			'app.tabStudy' => '학습',
			'app.tabStats' => '통계',
			'app.settingsHapticsTitle' => '진동',
			'app.settingsHapticsSubtitle' => '정답/오답 시 진동.',
			'app.settingsKanaSizeTitle' => '가나 크기',
			'app.settingsKanaSizeSubtitle' => '가나 표시 크기 조절.',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'JLPT 레벨',
			'app.settingsKanjiJlptSubtitle' => 'JLPT 기준으로 한자 제한.',
			'app.settingsUseModelHiraganaTitle' => '히라가나 AI',
			'app.settingsUseModelHiraganaSubtitle' => '그리기 인식에 AI 사용.',
			'app.settingsUseModelKatakanaTitle' => '가타카나 AI',
			'app.settingsUseModelKatakanaSubtitle' => '그리기 인식에 AI 사용.',
			'app.settingsUseModelKanjiTitle' => '한자 AI',
			'app.settingsUseModelKanjiSubtitle' => '그리기 인식에 AI 사용.',
			'app.kanjiFilterEmpty' => '이 JLPT 레벨에 한자가 없습니다.',
			'app.settingsBackupTitle' => '백업',
			'app.settingsBackupSubtitle' => 'JSON으로 진행 상황 내보내기/가져오기.',
			'app.settingsBackupExportButton' => '내보내기',
			'app.settingsBackupImportButton' => '가져오기',
			'app.settingsBackupExported' => ({required Object path}) => '${path}에 저장됨',
			'app.settingsBackupImported' => ({required Object count}) => '${count}개 가져옴',
			'app.settingsBackupError' => ({required Object error}) => '백업 오류: ${error}',
			'app.settingsGeneralSection' => '일반',
			'app.settingsAiModelsSection' => 'AI 모델',
			'app.settingsKanjiFilterSection' => '한자 필터',
			'app.settingsDataSection' => '데이터',
			'app.testGuideShow' => '가이드 보기',
			'app.testGuideHide' => '가이드 숨기기',
			'app.testReportDrawing' => '그림 신고',
			'app.testReportConfirmBody' => '이 리포트를 지금 전송하시겠습니까?',
			'app.testReportThanks' => '감사합니다. 리포트를 준비했습니다.',
			'app.testReportError' => '리포트 생성 실패.',
			'app.testKanjiTraceHint' => '획순을 따라 그리세요. 필요하면 가이드를 켜세요.',
			'app.aiInfoTitle' => 'AI 모델로 그리기',
			'app.aiInfoLine1' => 'AI 인식은 때때로 실패할 수 있습니다.',
			'app.aiInfoLine2' => '실패하면 모델을 비활성화하여 스트로크 기반 평가를 사용하세요.',
			'app.aiInfoLine3' => '오인식을 신고하여 개선에 도움을 주세요.',
			'app.premiumSectionTitle' => 'Premium',
			'app.premiumSectionSubtitle' => 'Unlock all features and remove interstitial ads.',
			'app.premiumOpenButton' => 'Upgrade',
			'app.premiumLockedMessage' => 'Premium feature. Upgrade to unlock it.',
			'app.premiumTitle' => 'Kana Master Premium',
			'app.premiumSubtitle' => 'One-time purchase, all features unlocked.',
			'app.premiumHeroTitle' => 'Learn without limits',
			'app.premiumHeroBody' => 'Get the full experience and support the project.',
			'app.premiumBenefitNoAds' => 'No interstitial ads',
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
			_ => null,
		};
	}
}
