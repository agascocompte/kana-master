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
class TranslationsPt with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsPt _root = this; // ignore: unused_field

	@override 
	TranslationsPt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPt(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppPt app = _TranslationsAppPt._(_root);
}

// Path: app
class _TranslationsAppPt implements TranslationsAppEn {
	_TranslationsAppPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get studyHubTitle => 'Centro de estudo';
	@override String get studyHubSubtitle => 'Escolha uma escrita e comece a aprender ou praticar.';
	@override String get paths => 'Percursos';
	@override String get script => 'Escrita';
	@override String get difficulty => 'Dificuldade';
	@override String get difficultyEasy => 'Fácil';
	@override String get difficultyMedium => 'Média';
	@override String get difficultyHard => 'Difícil';
	@override String get difficultyEasyDesc => 'Escolha única';
	@override String get difficultyMediumDesc => 'Texto';
	@override String get difficultyHardDesc => 'Desenho';
	@override String get learn => 'Aprender';
	@override String get learnSubtitle => 'Explore caracteres e dicas de traços.';
	@override String get practice => 'Praticar';
	@override String get practiceSubtitle => 'Reconhecimento, escrita e desenho.';
	@override String get materials => 'Materiais';
	@override String get materialsSubtitle => 'Importe um CSV com seus dados.';
	@override String get dictionary => 'Dicionário';
	@override String get dictionarySubtitle => 'Busque palavras, kana e significados.';
	@override String get statistics => 'Estatísticas';
	@override String get statisticsSubtitle => 'Precisão, consistência e ritmo.';
	@override String get settings => 'Configurações';
	@override String get learningDefaults => 'Preferências de estudo';
	@override String get testDifficulty => 'Nível do teste';
	@override String get testDifficultySubtitle => 'Escolha a dificuldade da prática.';
	@override String get importCsv => 'Importar CSV';
	@override String get expectedFormatTitle => 'Formato esperado';
	@override String get expectedFormatBody => 'Cabeçalhos recomendados:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nQualquer coluna pode ser pergunta ou resposta. CSV separado por vírgulas.';
	@override String fileLabel({required Object name, required Object count}) => 'Arquivo: ${name} (${count})';
	@override String get askWith => 'Perguntar com';
	@override String get answerWith => 'Responder com';
	@override String get newQuestion => 'Nova pergunta';
	@override String get checkAnswer => 'Verificar';
	@override String get materialsEmpty => 'Importe um CSV e toque em "Nova pergunta".';
	@override String get showAnswer => 'Mostrar resposta';
	@override String answerPrefix({required Object answer}) => 'Resposta: ${answer}';
	@override String get beginSession => 'Iniciar';
	@override String get practiceStartSubtitle => 'Comece uma nova rodada.';
	@override String get testStayFocused => 'Concentre-se e envie quando estiver pronto.';
	@override String get testSketchHint => 'Desenhe dentro da área';
	@override String get testTypeRomaji => 'Digite o romaji';
	@override String get testTypeMeaning => 'Digite o significado';
	@override String get testRomajiLabel => 'Leitura em romaji';
	@override String get testMeaningLabel => 'Significado em espanhol';
	@override String get testTapToType => 'Toque para digitar';
	@override String testDrawThe({required Object script}) => 'Desenhe ${script}';
	@override String testWhichIs({required Object script}) => 'Qual é este ${script}?';
	@override String get testKanjiMeaning => 'Significado deste kanji?';
	@override String get statsNoDataTitle => 'Sem estatísticas';
	@override String get statsNoDataSubtitle => 'Complete testes para desbloquear estatísticas.';
	@override String get statsReset => 'Redefinir estatísticas';
	@override String get statsActivity => 'Atividade';
	@override String get statsActivitySubtitle => 'Últimos 14 dias';
	@override String get statsEvolution => 'Evolução';
	@override String get statsEvolutionSubtitle => 'Corretas vs incorretas';
	@override String get statsNoEvolution => 'Sem dados.';
	@override String get statsNoActivity => 'Nenhuma atividade ainda.';
	@override String get statsAccuracy => 'Precisão';
	@override String get statsStreak => 'Sequência';
	@override String get statsLast7 => 'Últimos 7 dias';
	@override String get statsLast30 => 'Últimos 30 dias';
	@override String get statsSessions => 'sessões';
	@override String statsBest({required Object days}) => 'Melhor ${days} dias';
	@override String statsCorrect({required Object correct, required Object total}) => '${correct}/${total} corretas';
	@override String get statsCorrectLabel => 'Corretas';
	@override String get statsIncorrectLabel => 'Incorretas';
	@override String get statsMomentum => 'Ritmo';
	@override String get statsView => 'Ver estatísticas';
	@override String get statsStartToUnlock => 'Inicie uma prática para ver suas estatísticas.';
	@override String get dictionaryEmpty => 'Comece a buscar uma palavra.';
	@override String get searchHint => 'Buscar palavra, kana, romaji...';
	@override String get correct => 'Correto!';
	@override String get incorrect => 'Incorreto';
	@override String get oops => 'Ops...';
	@override String errorImporting({required Object error}) => 'Erro ao importar: ${error}';
	@override String importedEntries({required Object count, required Object file}) => '${count} entradas importadas de ${file}';
	@override String get noValidRows => 'Nenhuma linha válida encontrada.';
	@override String get dataNotFound => 'Nenhum dado no CSV.';
	@override String get materialsNeedImport => 'Importe um CSV e escolha as colunas.';
	@override String get materialsNeedStart => 'Primeiro inicie uma pergunta.';
	@override String get language => 'Idioma';
	@override String get languageSubtitle => 'Escolha o idioma do app.';
	@override String get back => 'Voltar';
	@override String get ok => 'OK';
	@override String get yourAnswer => 'Sua resposta';
	@override String statsStreakDays({required Object days}) => 'Sequência de ${days} dias';
	@override String get statsAttempts => 'tentativas';
	@override String get scriptHiragana => 'Hiragana';
	@override String get scriptKatakana => 'Katakana';
	@override String get scriptKanji => 'Kanji';
	@override String get testModeDrawing => 'Desenho';
	@override String get testModeQuiz => 'Quiz';
	@override String get dictionaryNotes => 'Notas';
	@override String get dictionarySeeAlso => 'Ver também';
	@override String get confirmActionTitle => 'Confirmar';
	@override String get confirmActionBody => 'Tem certeza de que deseja excluir TODAS as estatísticas?';
	@override String get cancel => 'Cancelar';
	@override String get delete => 'Excluir';
	@override String get searchByMeaning => 'Buscar por significado';
	@override String get filterAll => 'Tudo';
	@override String get tabStudy => 'Estudo';
	@override String get tabStats => 'Estatísticas';
	@override String get settingsHapticsTitle => 'Vibração';
	@override String get settingsHapticsSubtitle => 'Vibra ao acertar ou errar.';
	@override String get settingsKanaSizeTitle => 'Tamanho do kana';
	@override String get settingsKanaSizeSubtitle => 'Ajuste o tamanho dos kana.';
	@override String settingsKanaSizeValue({required Object value}) => '${value}x';
	@override String get settingsKanjiJlptTitle => 'Nível JLPT';
	@override String get settingsKanjiJlptSubtitle => 'Limitar kanji por nível JLPT.';
	@override String get settingsUseModelHiraganaTitle => 'IA Hiragana';
	@override String get settingsUseModelHiraganaSubtitle => 'Usar IA no reconhecimento de desenho.';
	@override String get settingsUseModelKatakanaTitle => 'IA Katakana';
	@override String get settingsUseModelKatakanaSubtitle => 'Usar IA no reconhecimento de desenho.';
	@override String get settingsUseModelKanjiTitle => 'IA Kanji';
	@override String get settingsUseModelKanjiSubtitle => 'Usar IA no reconhecimento de desenho.';
	@override String get kanjiFilterEmpty => 'Nenhum kanji para este nível JLPT.';
	@override String get settingsBackupTitle => 'Backup';
	@override String get settingsBackupSubtitle => 'Exportar ou importar progresso em JSON.';
	@override String get settingsBackupExportButton => 'Exportar';
	@override String get settingsBackupImportButton => 'Importar';
	@override String settingsBackupExported({required Object path}) => 'Exportado para ${path}';
	@override String settingsBackupImported({required Object count}) => '${count} respostas importadas';
	@override String settingsBackupError({required Object error}) => 'Erro de backup: ${error}';
	@override String get settingsGeneralSection => 'Geral';
	@override String get settingsAiModelsSection => 'Modelos IA';
	@override String get settingsKanjiFilterSection => 'Filtro Kanji';
	@override String get settingsDataSection => 'Dados';
	@override String get testGuideShow => 'Mostrar guia';
	@override String get testGuideHide => 'Ocultar guia';
	@override String get testReportDrawing => 'Reportar desenho';
	@override String get testReportConfirmBody => 'Deseja enviar este relatório agora?';
	@override String get testReportThanks => 'Obrigado. Relatório preparado.';
	@override String get testReportError => 'Falha ao criar relatório.';
	@override String get testKanjiTraceHint => 'Siga a ordem dos traços. Ative o guia se necessário.';
	@override String get aiInfoTitle => 'Modelos de IA em desenho';
	@override String get aiInfoLine1 => 'O reconhecimento de IA pode falhar ocasionalmente.';
	@override String get aiInfoLine2 => 'Se falhar, desative o modelo para usar avaliação baseada em traços.';
	@override String get aiInfoLine3 => 'Você pode reportar falsos negativos para ajudar a melhorar o modelo.';
	@override String get premiumSectionTitle => 'Premium';
	@override String get premiumSectionSubtitle => 'Desbloqueie todos os recursos e remova anúncios.';
	@override String get premiumOpenButton => 'Atualizar';
	@override String get premiumLockedMessage => 'Recurso premium. Atualize para desbloquear.';
	@override String get premiumTitle => 'Kana Master Premium';
	@override String get premiumSubtitle => 'Compra única, todos os recursos desbloqueados.';
	@override String get premiumHeroTitle => 'Aprenda sem limites';
	@override String get premiumHeroBody => 'Tenha a experiência completa e apoie o projeto.';
	@override String get premiumBenefitNoAds => 'Sem anúncios';
	@override String get premiumBenefitMaterials => 'Acesso ao modo Materiais';
	@override String get premiumBenefitHard => 'Usar dificuldade alta';
	@override String get premiumBenefitAi => 'Ativar opções de modelos de IA';
	@override String get premiumBenefitBackup => 'Exportar/importar estatísticas';
	@override String premiumBuyButton({required Object price}) => 'Comprar por ${price}';
	@override String get premiumRestoreButton => 'Restaurar compras';
	@override String get premiumOwnedBadge => 'Premium desbloqueado';
	@override String get premiumStoreUnavailable => 'Loja indisponível. Tente novamente mais tarde.';
	@override String premiumPurchaseError({required Object error}) => 'Falha na compra: ${error}';
	@override String get premiumPurchased => 'Compra concluída. Premium desbloqueado.';
	@override String get premiumRestored => 'Compras restauradas.';
}

/// The flat map containing all translations for locale <pt>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.studyHubTitle' => 'Centro de estudo',
			'app.studyHubSubtitle' => 'Escolha uma escrita e comece a aprender ou praticar.',
			'app.paths' => 'Percursos',
			'app.script' => 'Escrita',
			'app.difficulty' => 'Dificuldade',
			'app.difficultyEasy' => 'Fácil',
			'app.difficultyMedium' => 'Média',
			'app.difficultyHard' => 'Difícil',
			'app.difficultyEasyDesc' => 'Escolha única',
			'app.difficultyMediumDesc' => 'Texto',
			'app.difficultyHardDesc' => 'Desenho',
			'app.learn' => 'Aprender',
			'app.learnSubtitle' => 'Explore caracteres e dicas de traços.',
			'app.practice' => 'Praticar',
			'app.practiceSubtitle' => 'Reconhecimento, escrita e desenho.',
			'app.materials' => 'Materiais',
			'app.materialsSubtitle' => 'Importe um CSV com seus dados.',
			'app.dictionary' => 'Dicionário',
			'app.dictionarySubtitle' => 'Busque palavras, kana e significados.',
			'app.statistics' => 'Estatísticas',
			'app.statisticsSubtitle' => 'Precisão, consistência e ritmo.',
			'app.settings' => 'Configurações',
			'app.learningDefaults' => 'Preferências de estudo',
			'app.testDifficulty' => 'Nível do teste',
			'app.testDifficultySubtitle' => 'Escolha a dificuldade da prática.',
			'app.importCsv' => 'Importar CSV',
			'app.expectedFormatTitle' => 'Formato esperado',
			'app.expectedFormatBody' => 'Cabeçalhos recomendados:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nQualquer coluna pode ser pergunta ou resposta. CSV separado por vírgulas.',
			'app.fileLabel' => ({required Object name, required Object count}) => 'Arquivo: ${name} (${count})',
			'app.askWith' => 'Perguntar com',
			'app.answerWith' => 'Responder com',
			'app.newQuestion' => 'Nova pergunta',
			'app.checkAnswer' => 'Verificar',
			'app.materialsEmpty' => 'Importe um CSV e toque em "Nova pergunta".',
			'app.showAnswer' => 'Mostrar resposta',
			'app.answerPrefix' => ({required Object answer}) => 'Resposta: ${answer}',
			'app.beginSession' => 'Iniciar',
			'app.practiceStartSubtitle' => 'Comece uma nova rodada.',
			'app.testStayFocused' => 'Concentre-se e envie quando estiver pronto.',
			'app.testSketchHint' => 'Desenhe dentro da área',
			'app.testTypeRomaji' => 'Digite o romaji',
			'app.testTypeMeaning' => 'Digite o significado',
			'app.testRomajiLabel' => 'Leitura em romaji',
			'app.testMeaningLabel' => 'Significado em espanhol',
			'app.testTapToType' => 'Toque para digitar',
			'app.testDrawThe' => ({required Object script}) => 'Desenhe ${script}',
			'app.testWhichIs' => ({required Object script}) => 'Qual é este ${script}?',
			'app.testKanjiMeaning' => 'Significado deste kanji?',
			'app.statsNoDataTitle' => 'Sem estatísticas',
			'app.statsNoDataSubtitle' => 'Complete testes para desbloquear estatísticas.',
			'app.statsReset' => 'Redefinir estatísticas',
			'app.statsActivity' => 'Atividade',
			'app.statsActivitySubtitle' => 'Últimos 14 dias',
			'app.statsEvolution' => 'Evolução',
			'app.statsEvolutionSubtitle' => 'Corretas vs incorretas',
			'app.statsNoEvolution' => 'Sem dados.',
			'app.statsNoActivity' => 'Nenhuma atividade ainda.',
			'app.statsAccuracy' => 'Precisão',
			'app.statsStreak' => 'Sequência',
			'app.statsLast7' => 'Últimos 7 dias',
			'app.statsLast30' => 'Últimos 30 dias',
			'app.statsSessions' => 'sessões',
			'app.statsBest' => ({required Object days}) => 'Melhor ${days} dias',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct}/${total} corretas',
			'app.statsCorrectLabel' => 'Corretas',
			'app.statsIncorrectLabel' => 'Incorretas',
			'app.statsMomentum' => 'Ritmo',
			'app.statsView' => 'Ver estatísticas',
			'app.statsStartToUnlock' => 'Inicie uma prática para ver suas estatísticas.',
			'app.dictionaryEmpty' => 'Comece a buscar uma palavra.',
			'app.searchHint' => 'Buscar palavra, kana, romaji...',
			'app.correct' => 'Correto!',
			'app.incorrect' => 'Incorreto',
			'app.oops' => 'Ops...',
			'app.errorImporting' => ({required Object error}) => 'Erro ao importar: ${error}',
			'app.importedEntries' => ({required Object count, required Object file}) => '${count} entradas importadas de ${file}',
			'app.noValidRows' => 'Nenhuma linha válida encontrada.',
			'app.dataNotFound' => 'Nenhum dado no CSV.',
			'app.materialsNeedImport' => 'Importe um CSV e escolha as colunas.',
			'app.materialsNeedStart' => 'Primeiro inicie uma pergunta.',
			'app.language' => 'Idioma',
			'app.languageSubtitle' => 'Escolha o idioma do app.',
			'app.back' => 'Voltar',
			'app.ok' => 'OK',
			'app.yourAnswer' => 'Sua resposta',
			'app.statsStreakDays' => ({required Object days}) => 'Sequência de ${days} dias',
			'app.statsAttempts' => 'tentativas',
			'app.scriptHiragana' => 'Hiragana',
			'app.scriptKatakana' => 'Katakana',
			'app.scriptKanji' => 'Kanji',
			'app.testModeDrawing' => 'Desenho',
			'app.testModeQuiz' => 'Quiz',
			'app.dictionaryNotes' => 'Notas',
			'app.dictionarySeeAlso' => 'Ver também',
			'app.confirmActionTitle' => 'Confirmar',
			'app.confirmActionBody' => 'Tem certeza de que deseja excluir TODAS as estatísticas?',
			'app.cancel' => 'Cancelar',
			'app.delete' => 'Excluir',
			'app.searchByMeaning' => 'Buscar por significado',
			'app.filterAll' => 'Tudo',
			'app.tabStudy' => 'Estudo',
			'app.tabStats' => 'Estatísticas',
			'app.settingsHapticsTitle' => 'Vibração',
			'app.settingsHapticsSubtitle' => 'Vibra ao acertar ou errar.',
			'app.settingsKanaSizeTitle' => 'Tamanho do kana',
			'app.settingsKanaSizeSubtitle' => 'Ajuste o tamanho dos kana.',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'Nível JLPT',
			'app.settingsKanjiJlptSubtitle' => 'Limitar kanji por nível JLPT.',
			'app.settingsUseModelHiraganaTitle' => 'IA Hiragana',
			'app.settingsUseModelHiraganaSubtitle' => 'Usar IA no reconhecimento de desenho.',
			'app.settingsUseModelKatakanaTitle' => 'IA Katakana',
			'app.settingsUseModelKatakanaSubtitle' => 'Usar IA no reconhecimento de desenho.',
			'app.settingsUseModelKanjiTitle' => 'IA Kanji',
			'app.settingsUseModelKanjiSubtitle' => 'Usar IA no reconhecimento de desenho.',
			'app.kanjiFilterEmpty' => 'Nenhum kanji para este nível JLPT.',
			'app.settingsBackupTitle' => 'Backup',
			'app.settingsBackupSubtitle' => 'Exportar ou importar progresso em JSON.',
			'app.settingsBackupExportButton' => 'Exportar',
			'app.settingsBackupImportButton' => 'Importar',
			'app.settingsBackupExported' => ({required Object path}) => 'Exportado para ${path}',
			'app.settingsBackupImported' => ({required Object count}) => '${count} respostas importadas',
			'app.settingsBackupError' => ({required Object error}) => 'Erro de backup: ${error}',
			'app.settingsGeneralSection' => 'Geral',
			'app.settingsAiModelsSection' => 'Modelos IA',
			'app.settingsKanjiFilterSection' => 'Filtro Kanji',
			'app.settingsDataSection' => 'Dados',
			'app.testGuideShow' => 'Mostrar guia',
			'app.testGuideHide' => 'Ocultar guia',
			'app.testReportDrawing' => 'Reportar desenho',
			'app.testReportConfirmBody' => 'Deseja enviar este relatório agora?',
			'app.testReportThanks' => 'Obrigado. Relatório preparado.',
			'app.testReportError' => 'Falha ao criar relatório.',
			'app.testKanjiTraceHint' => 'Siga a ordem dos traços. Ative o guia se necessário.',
			'app.aiInfoTitle' => 'Modelos de IA em desenho',
			'app.aiInfoLine1' => 'O reconhecimento de IA pode falhar ocasionalmente.',
			'app.aiInfoLine2' => 'Se falhar, desative o modelo para usar avaliação baseada em traços.',
			'app.aiInfoLine3' => 'Você pode reportar falsos negativos para ajudar a melhorar o modelo.',
			'app.premiumSectionTitle' => 'Premium',
			'app.premiumSectionSubtitle' => 'Desbloqueie todos os recursos e remova anúncios.',
			'app.premiumOpenButton' => 'Atualizar',
			'app.premiumLockedMessage' => 'Recurso premium. Atualize para desbloquear.',
			'app.premiumTitle' => 'Kana Master Premium',
			'app.premiumSubtitle' => 'Compra única, todos os recursos desbloqueados.',
			'app.premiumHeroTitle' => 'Aprenda sem limites',
			'app.premiumHeroBody' => 'Tenha a experiência completa e apoie o projeto.',
			'app.premiumBenefitNoAds' => 'Sem anúncios',
			'app.premiumBenefitMaterials' => 'Acesso ao modo Materiais',
			'app.premiumBenefitHard' => 'Usar dificuldade alta',
			'app.premiumBenefitAi' => 'Ativar opções de modelos de IA',
			'app.premiumBenefitBackup' => 'Exportar/importar estatísticas',
			'app.premiumBuyButton' => ({required Object price}) => 'Comprar por ${price}',
			'app.premiumRestoreButton' => 'Restaurar compras',
			'app.premiumOwnedBadge' => 'Premium desbloqueado',
			'app.premiumStoreUnavailable' => 'Loja indisponível. Tente novamente mais tarde.',
			'app.premiumPurchaseError' => ({required Object error}) => 'Falha na compra: ${error}',
			'app.premiumPurchased' => 'Compra concluída. Premium desbloqueado.',
			'app.premiumRestored' => 'Compras restauradas.',
			_ => null,
		};
	}
}
