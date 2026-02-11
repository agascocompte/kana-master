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
class TranslationsFr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppFr app = _TranslationsAppFr._(_root);
}

// Path: app
class _TranslationsAppFr implements TranslationsAppEn {
	_TranslationsAppFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get studyHubTitle => 'Centre d\'étude';
	@override String get studyHubSubtitle => 'Choisis ton écriture et commence à apprendre ou à pratiquer.';
	@override String get paths => 'Parcours';
	@override String get script => 'Écriture';
	@override String get difficulty => 'Difficulté';
	@override String get difficultyEasy => 'Facile';
	@override String get difficultyMedium => 'Moyenne';
	@override String get difficultyHard => 'Difficile';
	@override String get difficultyEasyDesc => 'Choix unique';
	@override String get difficultyMediumDesc => 'Réponse texte';
	@override String get difficultyHardDesc => 'Dessin';
	@override String get learn => 'Apprendre';
	@override String get learnSubtitle => 'Explore les caractères et les indices de tracé.';
	@override String get practice => 'Pratiquer';
	@override String get practiceSubtitle => 'Reconnaissance, écriture et dessin.';
	@override String get materials => 'Matériels';
	@override String get materialsSubtitle => 'Importez un CSV contenant vos propres données.';
	@override String get dictionary => 'Dictionnaire';
	@override String get dictionarySubtitle => 'Recherche instantanément des mots, kana et significations.';
	@override String get statistics => 'Statistiques';
	@override String get statisticsSubtitle => 'Régularité, précision et rythme par type de kana.';
	@override String get settings => 'Paramètres';
	@override String get learningDefaults => 'Préférences d’étude';
	@override String get testDifficulty => 'Difficulté du test';
	@override String get testDifficultySubtitle => 'Choisis la difficulté pour les pratiques.';
	@override String get importCsv => 'Importer CSV';
	@override String get expectedFormatTitle => 'Format attendu';
	@override String get expectedFormatBody => 'En-têtes recommandés :\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nTu peux associer n’importe quelle colonne comme question ou réponse. CSV séparé par des virgules.';
	@override String fileLabel({required Object name, required Object count}) => 'Fichier : ${name} (${count} lignes)';
	@override String get askWith => 'Questionner avec';
	@override String get answerWith => 'Répondre avec';
	@override String get newQuestion => 'Nouvelle question';
	@override String get checkAnswer => 'Vérifier';
	@override String get materialsEmpty => 'Importe un CSV et appuie sur « Nouvelle question » pour commencer.';
	@override String get showAnswer => 'Afficher la réponse';
	@override String answerPrefix({required Object answer}) => 'Réponse : ${answer}';
	@override String get beginSession => 'Commencer la session';
	@override String get practiceStartSubtitle => 'Lance une nouvelle série et garde ta progression.';
	@override String get testStayFocused => 'Reste concentré et envoie quand tu es prêt.';
	@override String get testSketchHint => 'Dessine à l’intérieur du canevas';
	@override String get testTypeRomaji => 'Saisis le romaji';
	@override String get testTypeMeaning => 'Saisis la signification';
	@override String get testRomajiLabel => 'Lecture en romaji';
	@override String get testMeaningLabel => 'Signification en espagnol';
	@override String get testTapToType => 'Appuie pour écrire';
	@override String testDrawThe({required Object script}) => 'Dessine le ${script}';
	@override String testWhichIs({required Object script}) => 'Quel est ce ${script} ?';
	@override String get testKanjiMeaning => 'Signification de ce kanji ?';
	@override String get statsNoDataTitle => 'Pas de statistiques';
	@override String get statsNoDataSubtitle => 'Complète quelques tests pour débloquer séries et graphiques.';
	@override String get statsReset => 'Réinitialiser les statistiques';
	@override String get statsActivity => 'Activité quotidienne';
	@override String get statsActivitySubtitle => '14 derniers jours';
	@override String get statsEvolution => 'Évolution';
	@override String get statsEvolutionSubtitle => 'Correctes vs incorrectes';
	@override String get statsNoEvolution => 'Pas de données d’évolution.';
	@override String get statsNoActivity => 'Aucune activité pour l’instant.';
	@override String get statsAccuracy => 'Précision';
	@override String get statsStreak => 'Série';
	@override String get statsLast7 => '7 derniers jours';
	@override String get statsLast30 => '30 derniers jours';
	@override String get statsSessions => 'sessions';
	@override String statsBest({required Object days}) => 'Meilleurs ${days} jours';
	@override String statsCorrect({required Object correct, required Object total}) => '${correct} / ${total} correctes';
	@override String get statsCorrectLabel => 'Correctes';
	@override String get statsIncorrectLabel => 'Incorrectes';
	@override String get statsMomentum => 'Momentum';
	@override String get statsView => 'Voir les statistiques';
	@override String get statsStartToUnlock => 'Commence une pratique pour débloquer tes statistiques.';
	@override String get dictionaryEmpty => 'Commence à chercher un mot.';
	@override String get searchHint => 'Rechercher mot, kana, romaji...';
	@override String get correct => 'Correct !';
	@override String get incorrect => 'Réponse incorrecte';
	@override String get oops => 'Oups, erreur...';
	@override String errorImporting({required Object error}) => 'Erreur lors de l’importation : ${error}';
	@override String importedEntries({required Object count, required Object file}) => '${count} entrées importées depuis ${file}';
	@override String get noValidRows => 'Aucune ligne valide trouvée.';
	@override String get dataNotFound => 'Aucune donnée dans le CSV.';
	@override String get materialsNeedImport => 'Importe un CSV et choisis des colonnes avant de pratiquer.';
	@override String get materialsNeedStart => 'Commence d’abord une question avec ton matériel.';
	@override String get language => 'Langue';
	@override String get languageSubtitle => 'Choisis la langue de l’app.';
	@override String get back => 'Retour';
	@override String get ok => 'OK';
	@override String get yourAnswer => 'Ta réponse';
	@override String statsStreakDays({required Object days}) => 'Série de ${days} jours';
	@override String get statsAttempts => 'tentatives';
	@override String get scriptHiragana => 'Hiragana';
	@override String get scriptKatakana => 'Katakana';
	@override String get scriptKanji => 'Kanji';
	@override String get testModeDrawing => 'Dessin';
	@override String get testModeQuiz => 'Quiz';
	@override String get dictionaryNotes => 'Notes';
	@override String get dictionarySeeAlso => 'Voir aussi';
	@override String get confirmActionTitle => 'Confirmer l’action';
	@override String get confirmActionBody => 'Es-tu sûr de vouloir supprimer TOUTES les statistiques ?';
	@override String get cancel => 'Annuler';
	@override String get delete => 'Supprimer';
	@override String get searchByMeaning => 'Rechercher par signification';
	@override String get filterAll => 'Tout';
	@override String get tabStudy => 'Étude';
	@override String get tabStats => 'Statistiques';
	@override String get settingsHapticsTitle => 'Vibration';
	@override String get settingsHapticsSubtitle => 'Vibre en cas de bonne ou mauvaise réponse.';
	@override String get settingsKanaSizeTitle => 'Taille des kana';
	@override String get settingsKanaSizeSubtitle => 'Ajuste la taille des kana dans l’interface.';
	@override String settingsKanaSizeValue({required Object value}) => '${value}x';
	@override String get settingsKanjiJlptTitle => 'Niveau JLPT des kanji';
	@override String get settingsKanjiJlptSubtitle => 'Limite les kanji à un niveau JLPT.';
	@override String get kanjiFilterEmpty => 'Aucun kanji pour ce niveau JLPT.';
	@override String get settingsBackupTitle => 'Sauvegarde des statistiques';
	@override String get settingsBackupSubtitle => 'Exportez ou importez votre progression sous forme de fichier JSON.';
	@override String get settingsBackupExportButton => 'Exporter';
	@override String get settingsBackupImportButton => 'Importer';
	@override String settingsBackupExported({required Object path}) => 'Sauvegarde exportée vers ${path}';
	@override String settingsBackupImported({required Object count}) => 'Sauvegarde importée : ${count} réponses';
	@override String settingsBackupError({required Object error}) => 'Erreur de sauvegarde : ${error}';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.studyHubTitle' => 'Centre d\'étude',
			'app.studyHubSubtitle' => 'Choisis ton écriture et commence à apprendre ou à pratiquer.',
			'app.paths' => 'Parcours',
			'app.script' => 'Écriture',
			'app.difficulty' => 'Difficulté',
			'app.difficultyEasy' => 'Facile',
			'app.difficultyMedium' => 'Moyenne',
			'app.difficultyHard' => 'Difficile',
			'app.difficultyEasyDesc' => 'Choix unique',
			'app.difficultyMediumDesc' => 'Réponse texte',
			'app.difficultyHardDesc' => 'Dessin',
			'app.learn' => 'Apprendre',
			'app.learnSubtitle' => 'Explore les caractères et les indices de tracé.',
			'app.practice' => 'Pratiquer',
			'app.practiceSubtitle' => 'Reconnaissance, écriture et dessin.',
			'app.materials' => 'Matériels',
			'app.materialsSubtitle' => 'Importez un CSV contenant vos propres données.',
			'app.dictionary' => 'Dictionnaire',
			'app.dictionarySubtitle' => 'Recherche instantanément des mots, kana et significations.',
			'app.statistics' => 'Statistiques',
			'app.statisticsSubtitle' => 'Régularité, précision et rythme par type de kana.',
			'app.settings' => 'Paramètres',
			'app.learningDefaults' => 'Préférences d’étude',
			'app.testDifficulty' => 'Difficulté du test',
			'app.testDifficultySubtitle' => 'Choisis la difficulté pour les pratiques.',
			'app.importCsv' => 'Importer CSV',
			'app.expectedFormatTitle' => 'Format attendu',
			'app.expectedFormatBody' => 'En-têtes recommandés :\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nTu peux associer n’importe quelle colonne comme question ou réponse. CSV séparé par des virgules.',
			'app.fileLabel' => ({required Object name, required Object count}) => 'Fichier : ${name} (${count} lignes)',
			'app.askWith' => 'Questionner avec',
			'app.answerWith' => 'Répondre avec',
			'app.newQuestion' => 'Nouvelle question',
			'app.checkAnswer' => 'Vérifier',
			'app.materialsEmpty' => 'Importe un CSV et appuie sur « Nouvelle question » pour commencer.',
			'app.showAnswer' => 'Afficher la réponse',
			'app.answerPrefix' => ({required Object answer}) => 'Réponse : ${answer}',
			'app.beginSession' => 'Commencer la session',
			'app.practiceStartSubtitle' => 'Lance une nouvelle série et garde ta progression.',
			'app.testStayFocused' => 'Reste concentré et envoie quand tu es prêt.',
			'app.testSketchHint' => 'Dessine à l’intérieur du canevas',
			'app.testTypeRomaji' => 'Saisis le romaji',
			'app.testTypeMeaning' => 'Saisis la signification',
			'app.testRomajiLabel' => 'Lecture en romaji',
			'app.testMeaningLabel' => 'Signification en espagnol',
			'app.testTapToType' => 'Appuie pour écrire',
			'app.testDrawThe' => ({required Object script}) => 'Dessine le ${script}',
			'app.testWhichIs' => ({required Object script}) => 'Quel est ce ${script} ?',
			'app.testKanjiMeaning' => 'Signification de ce kanji ?',
			'app.statsNoDataTitle' => 'Pas de statistiques',
			'app.statsNoDataSubtitle' => 'Complète quelques tests pour débloquer séries et graphiques.',
			'app.statsReset' => 'Réinitialiser les statistiques',
			'app.statsActivity' => 'Activité quotidienne',
			'app.statsActivitySubtitle' => '14 derniers jours',
			'app.statsEvolution' => 'Évolution',
			'app.statsEvolutionSubtitle' => 'Correctes vs incorrectes',
			'app.statsNoEvolution' => 'Pas de données d’évolution.',
			'app.statsNoActivity' => 'Aucune activité pour l’instant.',
			'app.statsAccuracy' => 'Précision',
			'app.statsStreak' => 'Série',
			'app.statsLast7' => '7 derniers jours',
			'app.statsLast30' => '30 derniers jours',
			'app.statsSessions' => 'sessions',
			'app.statsBest' => ({required Object days}) => 'Meilleurs ${days} jours',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct} / ${total} correctes',
			'app.statsCorrectLabel' => 'Correctes',
			'app.statsIncorrectLabel' => 'Incorrectes',
			'app.statsMomentum' => 'Momentum',
			'app.statsView' => 'Voir les statistiques',
			'app.statsStartToUnlock' => 'Commence une pratique pour débloquer tes statistiques.',
			'app.dictionaryEmpty' => 'Commence à chercher un mot.',
			'app.searchHint' => 'Rechercher mot, kana, romaji...',
			'app.correct' => 'Correct !',
			'app.incorrect' => 'Réponse incorrecte',
			'app.oops' => 'Oups, erreur...',
			'app.errorImporting' => ({required Object error}) => 'Erreur lors de l’importation : ${error}',
			'app.importedEntries' => ({required Object count, required Object file}) => '${count} entrées importées depuis ${file}',
			'app.noValidRows' => 'Aucune ligne valide trouvée.',
			'app.dataNotFound' => 'Aucune donnée dans le CSV.',
			'app.materialsNeedImport' => 'Importe un CSV et choisis des colonnes avant de pratiquer.',
			'app.materialsNeedStart' => 'Commence d’abord une question avec ton matériel.',
			'app.language' => 'Langue',
			'app.languageSubtitle' => 'Choisis la langue de l’app.',
			'app.back' => 'Retour',
			'app.ok' => 'OK',
			'app.yourAnswer' => 'Ta réponse',
			'app.statsStreakDays' => ({required Object days}) => 'Série de ${days} jours',
			'app.statsAttempts' => 'tentatives',
			'app.scriptHiragana' => 'Hiragana',
			'app.scriptKatakana' => 'Katakana',
			'app.scriptKanji' => 'Kanji',
			'app.testModeDrawing' => 'Dessin',
			'app.testModeQuiz' => 'Quiz',
			'app.dictionaryNotes' => 'Notes',
			'app.dictionarySeeAlso' => 'Voir aussi',
			'app.confirmActionTitle' => 'Confirmer l’action',
			'app.confirmActionBody' => 'Es-tu sûr de vouloir supprimer TOUTES les statistiques ?',
			'app.cancel' => 'Annuler',
			'app.delete' => 'Supprimer',
			'app.searchByMeaning' => 'Rechercher par signification',
			'app.filterAll' => 'Tout',
			'app.tabStudy' => 'Étude',
			'app.tabStats' => 'Statistiques',
			'app.settingsHapticsTitle' => 'Vibration',
			'app.settingsHapticsSubtitle' => 'Vibre en cas de bonne ou mauvaise réponse.',
			'app.settingsKanaSizeTitle' => 'Taille des kana',
			'app.settingsKanaSizeSubtitle' => 'Ajuste la taille des kana dans l’interface.',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'Niveau JLPT des kanji',
			'app.settingsKanjiJlptSubtitle' => 'Limite les kanji à un niveau JLPT.',
			'app.kanjiFilterEmpty' => 'Aucun kanji pour ce niveau JLPT.',
			'app.settingsBackupTitle' => 'Sauvegarde des statistiques',
			'app.settingsBackupSubtitle' => 'Exportez ou importez votre progression sous forme de fichier JSON.',
			'app.settingsBackupExportButton' => 'Exporter',
			'app.settingsBackupImportButton' => 'Importer',
			'app.settingsBackupExported' => ({required Object path}) => 'Sauvegarde exportée vers ${path}',
			'app.settingsBackupImported' => ({required Object count}) => 'Sauvegarde importée : ${count} réponses',
			'app.settingsBackupError' => ({required Object error}) => 'Erreur de sauvegarde : ${error}',
			_ => null,
		};
	}
}
