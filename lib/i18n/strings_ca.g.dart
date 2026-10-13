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
class TranslationsCa with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsCa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ca,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ca>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key);

	late final TranslationsCa _root = this; // ignore: unused_field

	@override 
	TranslationsCa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsCa(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$ca app = _Translations$app$ca._(_root);
}

// Path: app
class _Translations$app$ca implements Translations$app$en {
	_Translations$app$ca._(this._root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get studyHubTitle => 'Centre d\'estudi';
	@override String get studyHubSubtitle => 'Tria la teva escriptura i comença a aprendre o practicar.';
	@override String get paths => 'Rutes';
	@override String get script => 'Escriptura';
	@override String get difficulty => 'Dificultat';
	@override String get difficultyEasy => 'Fàcil';
	@override String get difficultyMedium => 'Mitjana';
	@override String get difficultyHard => 'Difícil';
	@override String get difficultyEasyDesc => 'Opció única';
	@override String get difficultyMediumDesc => 'Text';
	@override String get difficultyHardDesc => 'Dibuix';
	@override String get learn => 'Aprendre';
	@override String get learnSubtitle => 'Explora caràcters i pistes de traços.';
	@override String get practice => 'Practicar';
	@override String get practiceSubtitle => 'Reconeixement, escriptura i dibuix.';
	@override String get materials => 'Materials';
	@override String get materialsSubtitle => 'Importa un CSV amb les teves pròpies dades.';
	@override String get dictionary => 'Diccionari';
	@override String get dictionarySubtitle => 'Busca paraules, kana i significats a l\'instant.';
	@override String get statistics => 'Estadístiques';
	@override String get statisticsSubtitle => 'Consistència, precisió i ritme per tipus de kana.';
	@override String get settings => 'Ajustos';
	@override String get learningDefaults => 'Preferències d\'estudi';
	@override String get testDifficulty => 'Dificultat del test';
	@override String get testDifficultySubtitle => 'Tria la dificultat per a les pràctiques.';
	@override String get importCsv => 'Importar CSV';
	@override String get expectedFormatTitle => 'Format esperat';
	@override String get expectedFormatBody => 'Capçaleres recomanades:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nPots mapar qualsevol columna com a pregunta o resposta. CSV separat per comes.';
	@override String fileLabel({required Object name, required Object count}) => 'Fitxer: ${name} (${count} files)';
	@override String get askWith => 'Preguntar amb';
	@override String get answerWith => 'Respondre amb';
	@override String get newQuestion => 'Nova pregunta';
	@override String get checkAnswer => 'Comprovar';
	@override String get materialsEmpty => 'Importa un CSV i prem "Nova pregunta" per començar.';
	@override String get showAnswer => 'Mostrar resposta';
	@override String answerPrefix({required Object answer}) => 'Resposta: ${answer}';
	@override String get beginSession => 'Començar sessió';
	@override String get practiceStartSubtitle => 'Comença una nova ronda i mantén la ratxa.';
	@override String get testStayFocused => 'Concentra\'t i envia quan estiguis a punt.';
	@override String get testSketchHint => 'Dibuixa dins del llenç';
	@override String get testTypeRomaji => 'Escriu el romaji';
	@override String get testTypeMeaning => 'Escriu el significat';
	@override String get testRomajiLabel => 'Lectura en romaji';
	@override String get testMeaningLabel => 'Significat en espanyol';
	@override String get testTapToType => 'Toca per escriure';
	@override String testDrawThe({required Object script}) => 'Dibuixa el ${script}';
	@override String testWhichIs({required Object script}) => 'Quin és aquest ${script}?';
	@override String get testKanjiMeaning => 'Significat d\'aquest kanji?';
	@override String get statsNoDataTitle => 'Sense estadístiques';
	@override String get statsNoDataSubtitle => 'Completa alguns tests per desbloquejar ratxes i gràfics.';
	@override String get statsReset => 'Reiniciar estadístiques';
	@override String get statsActivity => 'Activitat diària';
	@override String get statsActivitySubtitle => 'Últims 14 dies';
	@override String get statsEvolution => 'Evolució';
	@override String get statsEvolutionSubtitle => 'Correctes vs incorrectes';
	@override String get statsNoEvolution => 'Sense dades d\'evolució.';
	@override String get statsNoActivity => 'Sense activitat encara.';
	@override String get statsAccuracy => 'Precisió';
	@override String get statsStreak => 'Ratxa';
	@override String get statsLast7 => 'Últims 7 dies';
	@override String get statsLast30 => 'Últims 30 dies';
	@override String get statsSessions => 'sessions';
	@override String statsBest({required Object days}) => 'Millor ${days} dies';
	@override String statsCorrect({required Object correct, required Object total}) => '${correct} / ${total} correctes';
	@override String get statsCorrectLabel => 'Correctes';
	@override String get statsIncorrectLabel => 'Incorrectes';
	@override String get statsMomentum => 'Momentum';
	@override String get statsView => 'Veure estadístiques';
	@override String get statsStartToUnlock => 'Comença una pràctica per desbloquejar les teves estadístiques.';
	@override String get dictionaryEmpty => 'Comença a buscar una paraula.';
	@override String get searchHint => 'Buscar paraula, kana, romaji...';
	@override String get correct => 'Correcte!';
	@override String get incorrect => 'Resposta incorrecta';
	@override String get oops => 'Ups, has fallat...';
	@override String errorImporting({required Object error}) => 'Error en importar: ${error}';
	@override String importedEntries({required Object count, required Object file}) => 'Importades ${count} entrades des de ${file}';
	@override String get noValidRows => 'No s\'han trobat files vàlides.';
	@override String get dataNotFound => 'No hi ha dades al CSV.';
	@override String get materialsNeedImport => 'Importa un CSV i tria columnes abans de practicar.';
	@override String get materialsNeedStart => 'Primer inicia una pregunta amb el teu material.';
	@override String get language => 'Idioma';
	@override String get languageSubtitle => 'Tria l\'idioma de l\'app.';
	@override String get back => 'Enrere';
	@override String get ok => 'D\'acord';
	@override String get yourAnswer => 'La teva resposta';
	@override String statsStreakDays({required Object days}) => 'Ratxa de ${days} dies';
	@override String get statsAttempts => 'intents';
	@override String get scriptHiragana => 'Hiragana';
	@override String get scriptKatakana => 'Katakana';
	@override String get scriptKanji => 'Kanji';
	@override String get testModeDrawing => 'Dibuix';
	@override String get testModeQuiz => 'Quiz';
	@override String get dictionaryNotes => 'Notes';
	@override String get dictionarySeeAlso => 'Veure també';
	@override String get confirmActionTitle => 'Confirmar acció';
	@override String get confirmActionBody => 'Segur que vols esborrar TOTES les estadístiques?';
	@override String get cancel => 'Cancel·lar';
	@override String get delete => 'Eliminar';
	@override String get searchByMeaning => 'Buscar per significat';
	@override String get filterAll => 'Tot';
	@override String get tabStudy => 'Estudi';
	@override String get tabStats => 'Estadístiques';
	@override String get settingsHapticsTitle => 'Vibració';
	@override String get settingsHapticsSubtitle => 'Vibra en encertar o fallar.';
	@override String get settingsKanaSizeTitle => 'Mida del kana';
	@override String get settingsKanaSizeSubtitle => 'Ajusta la mida dels kana a la interfície.';
	@override String settingsKanaSizeValue({required Object value}) => '${value}x';
	@override String get settingsKanjiJlptTitle => 'Nivell JLPT kanji';
	@override String get settingsKanjiJlptSubtitle => 'Limita els kanji a un nivell JLPT.';
	@override String get settingsUseModelHiraganaTitle => 'Model IA de hiragana';
	@override String get settingsUseModelHiraganaSubtitle => 'Usar reconeixement per model en dibuix de hiragana.';
	@override String get settingsUseModelKatakanaTitle => 'Model IA de katakana';
	@override String get settingsUseModelKatakanaSubtitle => 'Usar reconeixement per model en dibuix de katakana.';
	@override String get settingsUseModelKanjiTitle => 'Model IA de kanji';
	@override String get settingsUseModelKanjiSubtitle => 'Usar reconeixement per model en dibuix de kanji.';
	@override String get kanjiFilterEmpty => 'No hi ha kanji per a aquest nivell JLPT.';
	@override String get settingsBackupTitle => 'Còpia d\'estadístiques';
	@override String get settingsBackupSubtitle => 'Exporta o importa el teu progrés en un fitxer JSON.';
	@override String get settingsBackupExportButton => 'Exportar';
	@override String get settingsBackupImportButton => 'Importar';
	@override String settingsBackupExported({required Object path}) => 'Còpia exportada a ${path}';
	@override String settingsBackupImported({required Object count}) => 'Importades ${count} respostes';
	@override String settingsBackupError({required Object error}) => 'Error de còpia: ${error}';
	@override String get settingsGeneralSection => 'General';
	@override String get settingsAiModelsSection => 'Models IA';
	@override String get settingsKanjiFilterSection => 'Kanji';
	@override String get settingsDataSection => 'Dades';
	@override String get testGuideShow => 'Mostrar guia';
	@override String get testGuideHide => 'Amagar guia';
	@override String get testReportDrawing => 'Reportar dibuix';
	@override String get testReportConfirmBody => 'Vols enviar aquest informe ara?';
	@override String get testReportThanks => 'Gràcies. Informe preparat per revisar.';
	@override String get testReportError => 'No s\'ha pogut preparar l\'informe.';
	@override String get testKanjiTraceHint => 'Segueix l\'ordre dels traços. Activa la guia si la necessites.';
	@override String get aiInfoTitle => 'Models d\'IA en dibuix';
	@override String get aiInfoLine1 => 'El reconeixement d\'IA pot fallar ocasionalment.';
	@override String get aiInfoLine2 => 'Si falla, desactiva el model per utilitzar una evaluació basada en traços.';
	@override String get aiInfoLine3 => 'Pots reportar falsos negatius per ajudar-nos a millorar-lo.';
	@override String get premiumSectionTitle => 'Premium';
	@override String get premiumSectionSubtitle => 'Desbloqueja totes les funcions i elimina anuncis.';
	@override String get premiumOpenButton => 'Millorar';
	@override String get premiumLockedMessage => 'Funció premium. Millora per desbloquejar-la.';
	@override String get premiumTitle => 'KanaGo Premium';
	@override String get premiumSubtitle => 'Compra única, totes les funcions desbloquejades.';
	@override String get premiumHeroTitle => 'Aprèn sense límits';
	@override String get premiumHeroBody => 'Aconsegueix l\'experiència completa i dona suport al projecte.';
	@override String get premiumBenefitNoAds => 'Sense anuncis';
	@override String get premiumBenefitMaterials => 'Accés al mode Materials';
	@override String get premiumBenefitHard => 'Dificultat alta disponible';
	@override String get premiumBenefitAi => 'Opcions de models IA';
	@override String get premiumBenefitBackup => 'Exportar/importar estadístiques';
	@override String premiumBuyButton({required Object price}) => 'Comprar per ${price}';
	@override String get premiumRestoreButton => 'Restaurar compres';
	@override String get premiumOwnedBadge => 'Premium desbloquejat';
	@override String get premiumStoreUnavailable => 'Botiga no disponible. Torna-ho a provar més tard.';
	@override String premiumPurchaseError({required Object error}) => 'Compra fallida: ${error}';
	@override String get premiumPurchased => 'Compra completada. Premium desbloquejat.';
	@override String get premiumRestored => 'Compres restaurades.';
	@override String get testNext => 'Següent';
	@override String testCorrectAnswerWas({required Object answer}) => 'Resposta correcta: ${answer}';
	@override String testQuestionProgress({required Object current, required Object total}) => 'Pregunta ${current} de ${total}';
	@override String get testKanjiReading => 'Com es llegeix aquest kanji?';
	@override String get testTypeReading => 'Escriu la lectura (kana o romaji)';
	@override String get sessionSummaryTitle => 'Sessió completada';
	@override String get sessionReviewSummaryTitle => 'Repàs completat';
	@override String sessionScore({required Object correct, required Object total}) => '${correct} de ${total} correctes';
	@override String get sessionPerfect => 'Perfecte! Sense errors.';
	@override String get sessionMistakesTitle => 'Per repassar';
	@override String sessionReviewMistakes({required Object count}) => 'Repassar errors (${count})';
	@override String get sessionNew => 'Nova sessió';
	@override String get sessionExit => 'Acabar';
	@override String get practiceWhat => 'Què practicar';
	@override String get practiceRowsBasic => 'Bàsics';
	@override String get practiceRowsDakuten => 'Dakuten';
	@override String get practiceRowsCombos => 'Combinacions';
	@override String get practiceSelectAll => 'Tots';
	@override String practiceItemsCount({required Object count}) => '${count} caràcters';
	@override String get practiceNotDrawable => 'Les combinacions i la katakana amb dakuten no es poden dibuixar, així que s\'ometen en el mode dibuix.';
	@override String get practiceNothingToDraw => 'Cap dels caràcters triats es pot dibuixar. Tria altres files o una dificultat menor.';
	@override String get practiceSessionLength => 'Preguntes per sessió';
	@override String get practiceSource => 'Preguntes de';
	@override String get practiceSourceAll => 'Tot';
	@override String practiceSourceMistakes({required Object count}) => 'Els meus errors (${count})';
	@override String get kanjiQuizMode => 'Preguntar per';
	@override String get kanjiModeMeaning => 'Significat';
	@override String get kanjiModeReading => 'Lectura';
	@override String get statsMasteryTitle => 'Domini';
	@override String get statsMasterySubtitle => 'Domines un caràcter quan l\'encertes 3 vegades seguides.';
	@override String statsMasteredCount({required Object mastered, required Object total}) => '${mastered} de ${total} dominats';
	@override String get statsLegendMastered => 'Dominat';
	@override String get statsLegendLearning => 'Aprenent';
	@override String get statsLegendWeak => 'Per repassar';
	@override String get statsLegendNew => 'Sense veure';
	@override String get statsWeakest => 'Per repassar';
	@override String get learnDakutenTitle => 'Dakuten';
	@override String get learnCombosTitle => 'Combinacions';
	@override String get settingsBackupImportConfirm => 'Importar substitueix totes les teves estadístiques actuals. Vols continuar?';
	@override String get dictionaryEnglishNote => 'Els resultats vénen de Jisho.org i estan en anglès.';
	@override String get dictionaryError => 'No s\'ha pogut cercar. Revisa la connexió i torna-ho a provar.';
	@override String materialsScore({required Object correct, required Object total}) => '${correct} / ${total} correctes';
	@override String get materialsClear => 'Treure llista';
	@override String get premiumBenefitJlpt => 'Tots els nivells JLPT (N4–N1)';
	@override String get settingsThemeTitle => 'Aparença';
	@override String get settingsThemeSubtitle => 'Clar, fosc o segons el sistema.';
	@override String get settingsThemeSystem => 'Automàtic';
	@override String get settingsThemeLight => 'Clar';
	@override String get settingsThemeDark => 'Fosc';
	@override String get reminderChannelName => 'Recordatori diari';
	@override String get reminderChannelDescription => 'Un avís a les 19:00 si aquell dia encara no has practicat.';
	@override String get reminderStreakTitle => '🔥 No perdis la ratxa!';
	@override String reminderStreakBody({required Object days}) => 'Portes ${days} dies seguits. Practica uns minuts avui per mantenir-la.';
	@override String get reminderSecondDayTitle => '🔥 Suma el segon dia';
	@override String get reminderSecondDayBody => 'Ahir vas practicar. Repeteix avui i comença una ratxa.';
	@override String get reminderComebackTitle => 'Uns minuts de japonès?';
	@override String get reminderComebackBody => 'Els teus kana t\'esperen. Una sessió curta i comences una ratxa nova.';
	@override String get reminderLastTitle => 'T\'enyorem 👋';
	@override String get reminderLastBody => 'Torna quan vulguis: un repàs de 5 minuts ja compta.';
	@override String get settingsReminderTitle => 'Recordatori diari';
	@override String get settingsReminderSubtitle => 'T\'avisa a les 19:00 si aquell dia encara no has practicat.';
	@override String get settingsReminderBlocked => 'Les notificacions de KanaGo estan desactivades. Activa-les als ajustos del sistema.';
}

/// The flat map containing all translations for locale <ca>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsCa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.studyHubTitle' => 'Centre d\'estudi',
			'app.studyHubSubtitle' => 'Tria la teva escriptura i comença a aprendre o practicar.',
			'app.paths' => 'Rutes',
			'app.script' => 'Escriptura',
			'app.difficulty' => 'Dificultat',
			'app.difficultyEasy' => 'Fàcil',
			'app.difficultyMedium' => 'Mitjana',
			'app.difficultyHard' => 'Difícil',
			'app.difficultyEasyDesc' => 'Opció única',
			'app.difficultyMediumDesc' => 'Text',
			'app.difficultyHardDesc' => 'Dibuix',
			'app.learn' => 'Aprendre',
			'app.learnSubtitle' => 'Explora caràcters i pistes de traços.',
			'app.practice' => 'Practicar',
			'app.practiceSubtitle' => 'Reconeixement, escriptura i dibuix.',
			'app.materials' => 'Materials',
			'app.materialsSubtitle' => 'Importa un CSV amb les teves pròpies dades.',
			'app.dictionary' => 'Diccionari',
			'app.dictionarySubtitle' => 'Busca paraules, kana i significats a l\'instant.',
			'app.statistics' => 'Estadístiques',
			'app.statisticsSubtitle' => 'Consistència, precisió i ritme per tipus de kana.',
			'app.settings' => 'Ajustos',
			'app.learningDefaults' => 'Preferències d\'estudi',
			'app.testDifficulty' => 'Dificultat del test',
			'app.testDifficultySubtitle' => 'Tria la dificultat per a les pràctiques.',
			'app.importCsv' => 'Importar CSV',
			'app.expectedFormatTitle' => 'Format esperat',
			'app.expectedFormatBody' => 'Capçaleres recomanades:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nPots mapar qualsevol columna com a pregunta o resposta. CSV separat per comes.',
			'app.fileLabel' => ({required Object name, required Object count}) => 'Fitxer: ${name} (${count} files)',
			'app.askWith' => 'Preguntar amb',
			'app.answerWith' => 'Respondre amb',
			'app.newQuestion' => 'Nova pregunta',
			'app.checkAnswer' => 'Comprovar',
			'app.materialsEmpty' => 'Importa un CSV i prem "Nova pregunta" per començar.',
			'app.showAnswer' => 'Mostrar resposta',
			'app.answerPrefix' => ({required Object answer}) => 'Resposta: ${answer}',
			'app.beginSession' => 'Començar sessió',
			'app.practiceStartSubtitle' => 'Comença una nova ronda i mantén la ratxa.',
			'app.testStayFocused' => 'Concentra\'t i envia quan estiguis a punt.',
			'app.testSketchHint' => 'Dibuixa dins del llenç',
			'app.testTypeRomaji' => 'Escriu el romaji',
			'app.testTypeMeaning' => 'Escriu el significat',
			'app.testRomajiLabel' => 'Lectura en romaji',
			'app.testMeaningLabel' => 'Significat en espanyol',
			'app.testTapToType' => 'Toca per escriure',
			'app.testDrawThe' => ({required Object script}) => 'Dibuixa el ${script}',
			'app.testWhichIs' => ({required Object script}) => 'Quin és aquest ${script}?',
			'app.testKanjiMeaning' => 'Significat d\'aquest kanji?',
			'app.statsNoDataTitle' => 'Sense estadístiques',
			'app.statsNoDataSubtitle' => 'Completa alguns tests per desbloquejar ratxes i gràfics.',
			'app.statsReset' => 'Reiniciar estadístiques',
			'app.statsActivity' => 'Activitat diària',
			'app.statsActivitySubtitle' => 'Últims 14 dies',
			'app.statsEvolution' => 'Evolució',
			'app.statsEvolutionSubtitle' => 'Correctes vs incorrectes',
			'app.statsNoEvolution' => 'Sense dades d\'evolució.',
			'app.statsNoActivity' => 'Sense activitat encara.',
			'app.statsAccuracy' => 'Precisió',
			'app.statsStreak' => 'Ratxa',
			'app.statsLast7' => 'Últims 7 dies',
			'app.statsLast30' => 'Últims 30 dies',
			'app.statsSessions' => 'sessions',
			'app.statsBest' => ({required Object days}) => 'Millor ${days} dies',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct} / ${total} correctes',
			'app.statsCorrectLabel' => 'Correctes',
			'app.statsIncorrectLabel' => 'Incorrectes',
			'app.statsMomentum' => 'Momentum',
			'app.statsView' => 'Veure estadístiques',
			'app.statsStartToUnlock' => 'Comença una pràctica per desbloquejar les teves estadístiques.',
			'app.dictionaryEmpty' => 'Comença a buscar una paraula.',
			'app.searchHint' => 'Buscar paraula, kana, romaji...',
			'app.correct' => 'Correcte!',
			'app.incorrect' => 'Resposta incorrecta',
			'app.oops' => 'Ups, has fallat...',
			'app.errorImporting' => ({required Object error}) => 'Error en importar: ${error}',
			'app.importedEntries' => ({required Object count, required Object file}) => 'Importades ${count} entrades des de ${file}',
			'app.noValidRows' => 'No s\'han trobat files vàlides.',
			'app.dataNotFound' => 'No hi ha dades al CSV.',
			'app.materialsNeedImport' => 'Importa un CSV i tria columnes abans de practicar.',
			'app.materialsNeedStart' => 'Primer inicia una pregunta amb el teu material.',
			'app.language' => 'Idioma',
			'app.languageSubtitle' => 'Tria l\'idioma de l\'app.',
			'app.back' => 'Enrere',
			'app.ok' => 'D\'acord',
			'app.yourAnswer' => 'La teva resposta',
			'app.statsStreakDays' => ({required Object days}) => 'Ratxa de ${days} dies',
			'app.statsAttempts' => 'intents',
			'app.scriptHiragana' => 'Hiragana',
			'app.scriptKatakana' => 'Katakana',
			'app.scriptKanji' => 'Kanji',
			'app.testModeDrawing' => 'Dibuix',
			'app.testModeQuiz' => 'Quiz',
			'app.dictionaryNotes' => 'Notes',
			'app.dictionarySeeAlso' => 'Veure també',
			'app.confirmActionTitle' => 'Confirmar acció',
			'app.confirmActionBody' => 'Segur que vols esborrar TOTES les estadístiques?',
			'app.cancel' => 'Cancel·lar',
			'app.delete' => 'Eliminar',
			'app.searchByMeaning' => 'Buscar per significat',
			'app.filterAll' => 'Tot',
			'app.tabStudy' => 'Estudi',
			'app.tabStats' => 'Estadístiques',
			'app.settingsHapticsTitle' => 'Vibració',
			'app.settingsHapticsSubtitle' => 'Vibra en encertar o fallar.',
			'app.settingsKanaSizeTitle' => 'Mida del kana',
			'app.settingsKanaSizeSubtitle' => 'Ajusta la mida dels kana a la interfície.',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'Nivell JLPT kanji',
			'app.settingsKanjiJlptSubtitle' => 'Limita els kanji a un nivell JLPT.',
			'app.settingsUseModelHiraganaTitle' => 'Model IA de hiragana',
			'app.settingsUseModelHiraganaSubtitle' => 'Usar reconeixement per model en dibuix de hiragana.',
			'app.settingsUseModelKatakanaTitle' => 'Model IA de katakana',
			'app.settingsUseModelKatakanaSubtitle' => 'Usar reconeixement per model en dibuix de katakana.',
			'app.settingsUseModelKanjiTitle' => 'Model IA de kanji',
			'app.settingsUseModelKanjiSubtitle' => 'Usar reconeixement per model en dibuix de kanji.',
			'app.kanjiFilterEmpty' => 'No hi ha kanji per a aquest nivell JLPT.',
			'app.settingsBackupTitle' => 'Còpia d\'estadístiques',
			'app.settingsBackupSubtitle' => 'Exporta o importa el teu progrés en un fitxer JSON.',
			'app.settingsBackupExportButton' => 'Exportar',
			'app.settingsBackupImportButton' => 'Importar',
			'app.settingsBackupExported' => ({required Object path}) => 'Còpia exportada a ${path}',
			'app.settingsBackupImported' => ({required Object count}) => 'Importades ${count} respostes',
			'app.settingsBackupError' => ({required Object error}) => 'Error de còpia: ${error}',
			'app.settingsGeneralSection' => 'General',
			'app.settingsAiModelsSection' => 'Models IA',
			'app.settingsKanjiFilterSection' => 'Kanji',
			'app.settingsDataSection' => 'Dades',
			'app.testGuideShow' => 'Mostrar guia',
			'app.testGuideHide' => 'Amagar guia',
			'app.testReportDrawing' => 'Reportar dibuix',
			'app.testReportConfirmBody' => 'Vols enviar aquest informe ara?',
			'app.testReportThanks' => 'Gràcies. Informe preparat per revisar.',
			'app.testReportError' => 'No s\'ha pogut preparar l\'informe.',
			'app.testKanjiTraceHint' => 'Segueix l\'ordre dels traços. Activa la guia si la necessites.',
			'app.aiInfoTitle' => 'Models d\'IA en dibuix',
			'app.aiInfoLine1' => 'El reconeixement d\'IA pot fallar ocasionalment.',
			'app.aiInfoLine2' => 'Si falla, desactiva el model per utilitzar una evaluació basada en traços.',
			'app.aiInfoLine3' => 'Pots reportar falsos negatius per ajudar-nos a millorar-lo.',
			'app.premiumSectionTitle' => 'Premium',
			'app.premiumSectionSubtitle' => 'Desbloqueja totes les funcions i elimina anuncis.',
			'app.premiumOpenButton' => 'Millorar',
			'app.premiumLockedMessage' => 'Funció premium. Millora per desbloquejar-la.',
			'app.premiumTitle' => 'KanaGo Premium',
			'app.premiumSubtitle' => 'Compra única, totes les funcions desbloquejades.',
			'app.premiumHeroTitle' => 'Aprèn sense límits',
			'app.premiumHeroBody' => 'Aconsegueix l\'experiència completa i dona suport al projecte.',
			'app.premiumBenefitNoAds' => 'Sense anuncis',
			'app.premiumBenefitMaterials' => 'Accés al mode Materials',
			'app.premiumBenefitHard' => 'Dificultat alta disponible',
			'app.premiumBenefitAi' => 'Opcions de models IA',
			'app.premiumBenefitBackup' => 'Exportar/importar estadístiques',
			'app.premiumBuyButton' => ({required Object price}) => 'Comprar per ${price}',
			'app.premiumRestoreButton' => 'Restaurar compres',
			'app.premiumOwnedBadge' => 'Premium desbloquejat',
			'app.premiumStoreUnavailable' => 'Botiga no disponible. Torna-ho a provar més tard.',
			'app.premiumPurchaseError' => ({required Object error}) => 'Compra fallida: ${error}',
			'app.premiumPurchased' => 'Compra completada. Premium desbloquejat.',
			'app.premiumRestored' => 'Compres restaurades.',
			'app.testNext' => 'Següent',
			'app.testCorrectAnswerWas' => ({required Object answer}) => 'Resposta correcta: ${answer}',
			'app.testQuestionProgress' => ({required Object current, required Object total}) => 'Pregunta ${current} de ${total}',
			'app.testKanjiReading' => 'Com es llegeix aquest kanji?',
			'app.testTypeReading' => 'Escriu la lectura (kana o romaji)',
			'app.sessionSummaryTitle' => 'Sessió completada',
			'app.sessionReviewSummaryTitle' => 'Repàs completat',
			'app.sessionScore' => ({required Object correct, required Object total}) => '${correct} de ${total} correctes',
			'app.sessionPerfect' => 'Perfecte! Sense errors.',
			'app.sessionMistakesTitle' => 'Per repassar',
			'app.sessionReviewMistakes' => ({required Object count}) => 'Repassar errors (${count})',
			'app.sessionNew' => 'Nova sessió',
			'app.sessionExit' => 'Acabar',
			'app.practiceWhat' => 'Què practicar',
			'app.practiceRowsBasic' => 'Bàsics',
			'app.practiceRowsDakuten' => 'Dakuten',
			'app.practiceRowsCombos' => 'Combinacions',
			'app.practiceSelectAll' => 'Tots',
			'app.practiceItemsCount' => ({required Object count}) => '${count} caràcters',
			'app.practiceNotDrawable' => 'Les combinacions i la katakana amb dakuten no es poden dibuixar, així que s\'ometen en el mode dibuix.',
			'app.practiceNothingToDraw' => 'Cap dels caràcters triats es pot dibuixar. Tria altres files o una dificultat menor.',
			'app.practiceSessionLength' => 'Preguntes per sessió',
			'app.practiceSource' => 'Preguntes de',
			'app.practiceSourceAll' => 'Tot',
			'app.practiceSourceMistakes' => ({required Object count}) => 'Els meus errors (${count})',
			'app.kanjiQuizMode' => 'Preguntar per',
			'app.kanjiModeMeaning' => 'Significat',
			'app.kanjiModeReading' => 'Lectura',
			'app.statsMasteryTitle' => 'Domini',
			'app.statsMasterySubtitle' => 'Domines un caràcter quan l\'encertes 3 vegades seguides.',
			'app.statsMasteredCount' => ({required Object mastered, required Object total}) => '${mastered} de ${total} dominats',
			'app.statsLegendMastered' => 'Dominat',
			'app.statsLegendLearning' => 'Aprenent',
			'app.statsLegendWeak' => 'Per repassar',
			'app.statsLegendNew' => 'Sense veure',
			'app.statsWeakest' => 'Per repassar',
			'app.learnDakutenTitle' => 'Dakuten',
			'app.learnCombosTitle' => 'Combinacions',
			'app.settingsBackupImportConfirm' => 'Importar substitueix totes les teves estadístiques actuals. Vols continuar?',
			'app.dictionaryEnglishNote' => 'Els resultats vénen de Jisho.org i estan en anglès.',
			'app.dictionaryError' => 'No s\'ha pogut cercar. Revisa la connexió i torna-ho a provar.',
			'app.materialsScore' => ({required Object correct, required Object total}) => '${correct} / ${total} correctes',
			'app.materialsClear' => 'Treure llista',
			'app.premiumBenefitJlpt' => 'Tots els nivells JLPT (N4–N1)',
			'app.settingsThemeTitle' => 'Aparença',
			'app.settingsThemeSubtitle' => 'Clar, fosc o segons el sistema.',
			'app.settingsThemeSystem' => 'Automàtic',
			'app.settingsThemeLight' => 'Clar',
			'app.settingsThemeDark' => 'Fosc',
			'app.reminderChannelName' => 'Recordatori diari',
			'app.reminderChannelDescription' => 'Un avís a les 19:00 si aquell dia encara no has practicat.',
			'app.reminderStreakTitle' => '🔥 No perdis la ratxa!',
			'app.reminderStreakBody' => ({required Object days}) => 'Portes ${days} dies seguits. Practica uns minuts avui per mantenir-la.',
			'app.reminderSecondDayTitle' => '🔥 Suma el segon dia',
			'app.reminderSecondDayBody' => 'Ahir vas practicar. Repeteix avui i comença una ratxa.',
			'app.reminderComebackTitle' => 'Uns minuts de japonès?',
			'app.reminderComebackBody' => 'Els teus kana t\'esperen. Una sessió curta i comences una ratxa nova.',
			'app.reminderLastTitle' => 'T\'enyorem 👋',
			'app.reminderLastBody' => 'Torna quan vulguis: un repàs de 5 minuts ja compta.',
			'app.settingsReminderTitle' => 'Recordatori diari',
			'app.settingsReminderSubtitle' => 'T\'avisa a les 19:00 si aquell dia encara no has practicat.',
			'app.settingsReminderBlocked' => 'Les notificacions de KanaGo estan desactivades. Activa-les als ajustos del sistema.',
			_ => null,
		};
	}
}
