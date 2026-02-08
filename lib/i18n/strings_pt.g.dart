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
	@override String get studyHubSubtitle => 'Escolhe a tua escrita e começa a aprender ou praticar.';
	@override String get paths => 'Percursos';
	@override String get script => 'Escrita';
	@override String get difficulty => 'Dificuldade';
	@override String get difficultyEasy => 'Fácil';
	@override String get difficultyMedium => 'Média';
	@override String get difficultyHard => 'Difícil';
	@override String get difficultyEasyDesc => 'Opção única';
	@override String get difficultyMediumDesc => 'Resposta de texto';
	@override String get difficultyHardDesc => 'Desenho';
	@override String get learn => 'Aprender';
	@override String get learnSubtitle => 'Explora caracteres e dicas de traços.';
	@override String get practice => 'Praticar';
	@override String get practiceSubtitle => 'Reconhecimento, escrita e desenho.';
	@override String get materials => 'Materiais';
	@override String get materialsSubtitle => 'importe um CSV com os seus próprios dados.';
	@override String get dictionary => 'Dicionário';
	@override String get dictionarySubtitle => 'Pesquisa palavras, kana e significados instantaneamente.';
	@override String get statistics => 'Estatísticas';
	@override String get statisticsSubtitle => 'Consistência, precisão e ritmo por tipo de kana.';
	@override String get settings => 'Definições';
	@override String get learningDefaults => 'Preferências de estudo';
	@override String get testDifficulty => 'Dificuldade do teste';
	@override String get testDifficultySubtitle => 'Escolhe a dificuldade para as práticas.';
	@override String get importCsv => 'Importar CSV';
	@override String get expectedFormatTitle => 'Formato esperado';
	@override String get expectedFormatBody => 'Cabeçalhos recomendados:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nPodes mapear qualquer coluna como pergunta ou resposta. CSV separado por vírgulas.';
	@override String fileLabel({required Object name, required Object count}) => 'Ficheiro: ${name} (${count} linhas)';
	@override String get askWith => 'Perguntar com';
	@override String get answerWith => 'Responder com';
	@override String get newQuestion => 'Nova pergunta';
	@override String get checkAnswer => 'Verificar';
	@override String get materialsEmpty => 'Importa um CSV e pressiona "Nova pergunta" para começar.';
	@override String get showAnswer => 'Mostrar resposta';
	@override String answerPrefix({required Object answer}) => 'Resposta: ${answer}';
	@override String get beginSession => 'Iniciar sessão';
	@override String get practiceStartSubtitle => 'Começa uma nova ronda e mantém a sequência.';
	@override String get testStayFocused => 'Mantém o foco e envia quando estiveres pronto.';
	@override String get testSketchHint => 'Desenha dentro da tela';
	@override String get testTypeRomaji => 'Escreve o romaji';
	@override String get testTypeMeaning => 'Escreve o significado';
	@override String get testRomajiLabel => 'Leitura em romaji';
	@override String get testMeaningLabel => 'Significado em espanhol';
	@override String get testTapToType => 'Toca para escrever';
	@override String testDrawThe({required Object script}) => 'Desenha o ${script}';
	@override String testWhichIs({required Object script}) => 'Qual é este ${script}?';
	@override String get testKanjiMeaning => 'Significado deste kanji?';
	@override String get statsNoDataTitle => 'Sem estatísticas';
	@override String get statsNoDataSubtitle => 'Completa alguns testes para desbloquear sequências e gráficos.';
	@override String get statsReset => 'Reiniciar estatísticas';
	@override String get statsActivity => 'Atividade diária';
	@override String get statsActivitySubtitle => 'Últimos 14 dias';
	@override String get statsEvolution => 'Evolução';
	@override String get statsEvolutionSubtitle => 'Corretas vs incorretas';
	@override String get statsNoEvolution => 'Sem dados de evolução.';
	@override String get statsNoActivity => 'Ainda sem atividade.';
	@override String get statsAccuracy => 'Precisão';
	@override String get statsStreak => 'Sequência';
	@override String get statsLast7 => 'Últimos 7 dias';
	@override String get statsLast30 => 'Últimos 30 dias';
	@override String get statsSessions => 'sessões';
	@override String statsBest({required Object days}) => 'Melhores ${days} dias';
	@override String statsCorrect({required Object correct, required Object total}) => '${correct} / ${total} corretas';
	@override String get statsCorrectLabel => 'Corretas';
	@override String get statsIncorrectLabel => 'Incorretas';
	@override String get statsMomentum => 'Momentum';
	@override String get statsView => 'Ver estatísticas';
	@override String get statsStartToUnlock => 'Inicia uma prática para desbloquear as tuas estatísticas.';
	@override String get dictionaryEmpty => 'Começa a procurar uma palavra.';
	@override String get searchHint => 'Pesquisar palavra, kana, romaji...';
	@override String get correct => 'Correto!';
	@override String get incorrect => 'Resposta incorreta';
	@override String get oops => 'Ups, falhaste...';
	@override String errorImporting({required Object error}) => 'Erro ao importar: ${error}';
	@override String importedEntries({required Object count, required Object file}) => '${count} entradas importadas de ${file}';
	@override String get noValidRows => 'Não foram encontradas linhas válidas.';
	@override String get dataNotFound => 'Não há dados no CSV.';
	@override String get materialsNeedImport => 'Importa um CSV e escolhe colunas antes de praticar.';
	@override String get materialsNeedStart => 'Primeiro inicia uma pergunta com o teu material.';
	@override String get language => 'Idioma';
	@override String get languageSubtitle => 'Escolhe o idioma da app.';
	@override String get back => 'Voltar';
	@override String get ok => 'OK';
	@override String get yourAnswer => 'A tua resposta';
	@override String statsStreakDays({required Object days}) => 'Sequência de ${days} dias';
	@override String get statsAttempts => 'tentativas';
	@override String get scriptHiragana => 'Hiragana';
	@override String get scriptKatakana => 'Katakana';
	@override String get scriptKanji => 'Kanji';
	@override String get testModeDrawing => 'Desenho';
	@override String get testModeQuiz => 'Quiz';
	@override String get dictionaryNotes => 'Notas';
	@override String get dictionarySeeAlso => 'Ver também';
	@override String get confirmActionTitle => 'Confirmar ação';
	@override String get confirmActionBody => 'Tens a certeza de que queres apagar TODAS as estatísticas?';
	@override String get cancel => 'Cancelar';
	@override String get delete => 'Eliminar';
	@override String get searchByMeaning => 'Pesquisar por significado';
	@override String get filterAll => 'Tudo';
	@override String get tabStudy => 'Estudo';
	@override String get tabStats => 'Estatísticas';
	@override String get settingsHapticsTitle => 'Vibração';
	@override String get settingsHapticsSubtitle => 'Vibra ao acertar ou falhar.';
	@override String get settingsKanaSizeTitle => 'Tamanho do kana';
	@override String get settingsKanaSizeSubtitle => 'Ajusta o tamanho dos kana na interface.';
	@override String settingsKanaSizeValue({required Object value}) => '${value}x';
	@override String get settingsKanjiJlptTitle => 'Nível JLPT dos kanji';
	@override String get settingsKanjiJlptSubtitle => 'Limita os kanji a um nível JLPT.';
	@override String get kanjiFilterEmpty => 'Não há kanji para este nível JLPT.';
	@override String get loginTitle => 'Iniciar sessão no Kana Master';
	@override String get loginSubtitle => 'Salva o progresso, sincroniza entre dispositivos e desbloqueia benefícios premium.';
	@override String get loginApple => 'Continuar com Apple';
	@override String get loginGoogle => 'Continuar com Google';
	@override String get loginOr => 'ou';
	@override String get loginFooter => 'Ao continuar, você aceita os Termos e a Política de Privacidade.';
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
			'app.studyHubSubtitle' => 'Escolhe a tua escrita e começa a aprender ou praticar.',
			'app.paths' => 'Percursos',
			'app.script' => 'Escrita',
			'app.difficulty' => 'Dificuldade',
			'app.difficultyEasy' => 'Fácil',
			'app.difficultyMedium' => 'Média',
			'app.difficultyHard' => 'Difícil',
			'app.difficultyEasyDesc' => 'Opção única',
			'app.difficultyMediumDesc' => 'Resposta de texto',
			'app.difficultyHardDesc' => 'Desenho',
			'app.learn' => 'Aprender',
			'app.learnSubtitle' => 'Explora caracteres e dicas de traços.',
			'app.practice' => 'Praticar',
			'app.practiceSubtitle' => 'Reconhecimento, escrita e desenho.',
			'app.materials' => 'Materiais',
			'app.materialsSubtitle' => 'importe um CSV com os seus próprios dados.',
			'app.dictionary' => 'Dicionário',
			'app.dictionarySubtitle' => 'Pesquisa palavras, kana e significados instantaneamente.',
			'app.statistics' => 'Estatísticas',
			'app.statisticsSubtitle' => 'Consistência, precisão e ritmo por tipo de kana.',
			'app.settings' => 'Definições',
			'app.learningDefaults' => 'Preferências de estudo',
			'app.testDifficulty' => 'Dificuldade do teste',
			'app.testDifficultySubtitle' => 'Escolhe a dificuldade para as práticas.',
			'app.importCsv' => 'Importar CSV',
			'app.expectedFormatTitle' => 'Formato esperado',
			'app.expectedFormatBody' => 'Cabeçalhos recomendados:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nPodes mapear qualquer coluna como pergunta ou resposta. CSV separado por vírgulas.',
			'app.fileLabel' => ({required Object name, required Object count}) => 'Ficheiro: ${name} (${count} linhas)',
			'app.askWith' => 'Perguntar com',
			'app.answerWith' => 'Responder com',
			'app.newQuestion' => 'Nova pergunta',
			'app.checkAnswer' => 'Verificar',
			'app.materialsEmpty' => 'Importa um CSV e pressiona "Nova pergunta" para começar.',
			'app.showAnswer' => 'Mostrar resposta',
			'app.answerPrefix' => ({required Object answer}) => 'Resposta: ${answer}',
			'app.beginSession' => 'Iniciar sessão',
			'app.practiceStartSubtitle' => 'Começa uma nova ronda e mantém a sequência.',
			'app.testStayFocused' => 'Mantém o foco e envia quando estiveres pronto.',
			'app.testSketchHint' => 'Desenha dentro da tela',
			'app.testTypeRomaji' => 'Escreve o romaji',
			'app.testTypeMeaning' => 'Escreve o significado',
			'app.testRomajiLabel' => 'Leitura em romaji',
			'app.testMeaningLabel' => 'Significado em espanhol',
			'app.testTapToType' => 'Toca para escrever',
			'app.testDrawThe' => ({required Object script}) => 'Desenha o ${script}',
			'app.testWhichIs' => ({required Object script}) => 'Qual é este ${script}?',
			'app.testKanjiMeaning' => 'Significado deste kanji?',
			'app.statsNoDataTitle' => 'Sem estatísticas',
			'app.statsNoDataSubtitle' => 'Completa alguns testes para desbloquear sequências e gráficos.',
			'app.statsReset' => 'Reiniciar estatísticas',
			'app.statsActivity' => 'Atividade diária',
			'app.statsActivitySubtitle' => 'Últimos 14 dias',
			'app.statsEvolution' => 'Evolução',
			'app.statsEvolutionSubtitle' => 'Corretas vs incorretas',
			'app.statsNoEvolution' => 'Sem dados de evolução.',
			'app.statsNoActivity' => 'Ainda sem atividade.',
			'app.statsAccuracy' => 'Precisão',
			'app.statsStreak' => 'Sequência',
			'app.statsLast7' => 'Últimos 7 dias',
			'app.statsLast30' => 'Últimos 30 dias',
			'app.statsSessions' => 'sessões',
			'app.statsBest' => ({required Object days}) => 'Melhores ${days} dias',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct} / ${total} corretas',
			'app.statsCorrectLabel' => 'Corretas',
			'app.statsIncorrectLabel' => 'Incorretas',
			'app.statsMomentum' => 'Momentum',
			'app.statsView' => 'Ver estatísticas',
			'app.statsStartToUnlock' => 'Inicia uma prática para desbloquear as tuas estatísticas.',
			'app.dictionaryEmpty' => 'Começa a procurar uma palavra.',
			'app.searchHint' => 'Pesquisar palavra, kana, romaji...',
			'app.correct' => 'Correto!',
			'app.incorrect' => 'Resposta incorreta',
			'app.oops' => 'Ups, falhaste...',
			'app.errorImporting' => ({required Object error}) => 'Erro ao importar: ${error}',
			'app.importedEntries' => ({required Object count, required Object file}) => '${count} entradas importadas de ${file}',
			'app.noValidRows' => 'Não foram encontradas linhas válidas.',
			'app.dataNotFound' => 'Não há dados no CSV.',
			'app.materialsNeedImport' => 'Importa um CSV e escolhe colunas antes de praticar.',
			'app.materialsNeedStart' => 'Primeiro inicia uma pergunta com o teu material.',
			'app.language' => 'Idioma',
			'app.languageSubtitle' => 'Escolhe o idioma da app.',
			'app.back' => 'Voltar',
			'app.ok' => 'OK',
			'app.yourAnswer' => 'A tua resposta',
			'app.statsStreakDays' => ({required Object days}) => 'Sequência de ${days} dias',
			'app.statsAttempts' => 'tentativas',
			'app.scriptHiragana' => 'Hiragana',
			'app.scriptKatakana' => 'Katakana',
			'app.scriptKanji' => 'Kanji',
			'app.testModeDrawing' => 'Desenho',
			'app.testModeQuiz' => 'Quiz',
			'app.dictionaryNotes' => 'Notas',
			'app.dictionarySeeAlso' => 'Ver também',
			'app.confirmActionTitle' => 'Confirmar ação',
			'app.confirmActionBody' => 'Tens a certeza de que queres apagar TODAS as estatísticas?',
			'app.cancel' => 'Cancelar',
			'app.delete' => 'Eliminar',
			'app.searchByMeaning' => 'Pesquisar por significado',
			'app.filterAll' => 'Tudo',
			'app.tabStudy' => 'Estudo',
			'app.tabStats' => 'Estatísticas',
			'app.settingsHapticsTitle' => 'Vibração',
			'app.settingsHapticsSubtitle' => 'Vibra ao acertar ou falhar.',
			'app.settingsKanaSizeTitle' => 'Tamanho do kana',
			'app.settingsKanaSizeSubtitle' => 'Ajusta o tamanho dos kana na interface.',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'Nível JLPT dos kanji',
			'app.settingsKanjiJlptSubtitle' => 'Limita os kanji a um nível JLPT.',
			'app.kanjiFilterEmpty' => 'Não há kanji para este nível JLPT.',
			'app.loginTitle' => 'Iniciar sessão no Kana Master',
			'app.loginSubtitle' => 'Salva o progresso, sincroniza entre dispositivos e desbloqueia benefícios premium.',
			'app.loginApple' => 'Continuar com Apple',
			'app.loginGoogle' => 'Continuar com Google',
			'app.loginOr' => 'ou',
			'app.loginFooter' => 'Ao continuar, você aceita os Termos e a Política de Privacidade.',
			_ => null,
		};
	}
}
