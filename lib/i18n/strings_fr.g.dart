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
	@override String get studyHubSubtitle => 'Choisis une écriture et commence à apprendre ou pratiquer.';
	@override String get paths => 'Parcours';
	@override String get script => 'Écriture';
	@override String get difficulty => 'Difficulté';
	@override String get difficultyEasy => 'Facile';
	@override String get difficultyMedium => 'Moyenne';
	@override String get difficultyHard => 'Difficile';
	@override String get difficultyEasyDesc => 'Choix unique';
	@override String get difficultyMediumDesc => 'Texte';
	@override String get difficultyHardDesc => 'Dessin';
	@override String get learn => 'Apprendre';
	@override String get learnSubtitle => 'Découvre les caractères et les traits.';
	@override String get practice => 'Pratiquer';
	@override String get practiceSubtitle => 'Reconnaissance, écriture et dessin.';
	@override String get materials => 'Matériel';
	@override String get materialsSubtitle => 'Importe un CSV avec tes données.';
	@override String get dictionary => 'Dictionnaire';
	@override String get dictionarySubtitle => 'Recherche mots, kana et significations.';
	@override String get statistics => 'Stats';
	@override String get statisticsSubtitle => 'Précision, régularité et rythme.';
	@override String get settings => 'Options';
	@override String get learningDefaults => 'Préférences d\'étude';
	@override String get testDifficulty => 'Niveau du test';
	@override String get testDifficultySubtitle => 'Choisis la difficulté des exercices.';
	@override String get importCsv => 'Importer CSV';
	@override String get expectedFormatTitle => 'Format attendu';
	@override String get expectedFormatBody => 'En-têtes recommandés:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nChaque colonne peut être une question ou une réponse. CSV séparé par des virgules.';
	@override String fileLabel({required Object name, required Object count}) => 'Fichier : ${name} (${count})';
	@override String get askWith => 'Question avec';
	@override String get answerWith => 'Répondre avec';
	@override String get newQuestion => 'Nouvelle question';
	@override String get checkAnswer => 'Vérifier';
	@override String get materialsEmpty => 'Importe un CSV et appuie sur "Nouvelle question".';
	@override String get showAnswer => 'Voir la réponse';
	@override String answerPrefix({required Object answer}) => 'Réponse : ${answer}';
	@override String get beginSession => 'Démarrer';
	@override String get practiceStartSubtitle => 'Commence une nouvelle série.';
	@override String get testStayFocused => 'Reste concentré et envoie quand tu es prêt.';
	@override String get testSketchHint => 'Dessine dans la zone';
	@override String get testTypeRomaji => 'Écris le romaji';
	@override String get testTypeMeaning => 'Écris la signification';
	@override String get testRomajiLabel => 'Lecture romaji';
	@override String get testMeaningLabel => 'Signification espagnole';
	@override String get testTapToType => 'Touchez pour écrire';
	@override String testDrawThe({required Object script}) => 'Dessine ${script}';
	@override String testWhichIs({required Object script}) => 'Quel est ce ${script} ?';
	@override String get testKanjiMeaning => 'Signification de ce kanji ?';
	@override String get statsNoDataTitle => 'Aucune stat';
	@override String get statsNoDataSubtitle => 'Fais des tests pour débloquer les stats.';
	@override String get statsReset => 'Réinitialiser les stats';
	@override String get statsActivity => 'Activité';
	@override String get statsActivitySubtitle => '14 derniers jours';
	@override String get statsEvolution => 'Évolution';
	@override String get statsEvolutionSubtitle => 'Correct vs incorrect';
	@override String get statsNoEvolution => 'Aucune donnée.';
	@override String get statsNoActivity => 'Pas encore d\'activité.';
	@override String get statsAccuracy => 'Précision';
	@override String get statsStreak => 'Série';
	@override String get statsLast7 => '7 jours';
	@override String get statsLast30 => '30 jours';
	@override String get statsSessions => 'sessions';
	@override String statsBest({required Object days}) => 'Meilleur ${days} jours';
	@override String statsCorrect({required Object correct, required Object total}) => '${correct}/${total} correct';
	@override String get statsCorrectLabel => 'Correct';
	@override String get statsIncorrectLabel => 'Incorrect';
	@override String get statsMomentum => 'Momentum';
	@override String get statsView => 'Voir les stats';
	@override String get statsStartToUnlock => 'Commence une pratique pour voir tes stats.';
	@override String get dictionaryEmpty => 'Commence à chercher un mot.';
	@override String get searchHint => 'Mot, kana, romaji...';
	@override String get correct => 'Correct !';
	@override String get incorrect => 'Incorrect';
	@override String get oops => 'Oups...';
	@override String errorImporting({required Object error}) => 'Erreur d\'import : ${error}';
	@override String importedEntries({required Object count, required Object file}) => '${count} entrées importées depuis ${file}';
	@override String get noValidRows => 'Aucune ligne valide.';
	@override String get dataNotFound => 'Aucune donnée dans le CSV.';
	@override String get materialsNeedImport => 'Importe un CSV et choisis les colonnes.';
	@override String get materialsNeedStart => 'Commence d\'abord une question.';
	@override String get language => 'Langue';
	@override String get languageSubtitle => 'Choisis la langue de l\'app.';
	@override String get back => 'Retour';
	@override String get ok => 'OK';
	@override String get yourAnswer => 'Ta réponse';
	@override String statsStreakDays({required Object days}) => 'Série de ${days} jours';
	@override String get statsAttempts => 'essais';
	@override String get scriptHiragana => 'Hiragana';
	@override String get scriptKatakana => 'Katakana';
	@override String get scriptKanji => 'Kanji';
	@override String get testModeDrawing => 'Dessin';
	@override String get testModeQuiz => 'Quiz';
	@override String get dictionaryNotes => 'Notes';
	@override String get dictionarySeeAlso => 'Voir aussi';
	@override String get confirmActionTitle => 'Confirmer';
	@override String get confirmActionBody => 'Supprimer TOUTES les statistiques ?';
	@override String get cancel => 'Annuler';
	@override String get delete => 'Supprimer';
	@override String get searchByMeaning => 'Chercher par sens';
	@override String get filterAll => 'Tout';
	@override String get tabStudy => 'Étude';
	@override String get tabStats => 'Stats';
	@override String get settingsHapticsTitle => 'Vibration';
	@override String get settingsHapticsSubtitle => 'Vibre si correct ou incorrect.';
	@override String get settingsKanaSizeTitle => 'Taille du kana';
	@override String get settingsKanaSizeSubtitle => 'Ajuste la taille des kana.';
	@override String settingsKanaSizeValue({required Object value}) => '${value}x';
	@override String get settingsKanjiJlptTitle => 'Niveau JLPT';
	@override String get settingsKanjiJlptSubtitle => 'Limiter les kanji par niveau JLPT.';
	@override String get settingsUseModelHiraganaTitle => 'IA Hiragana';
	@override String get settingsUseModelHiraganaSubtitle => 'Reconnaissance IA pour le dessin.';
	@override String get settingsUseModelKatakanaTitle => 'IA Katakana';
	@override String get settingsUseModelKatakanaSubtitle => 'Reconnaissance IA pour le dessin.';
	@override String get settingsUseModelKanjiTitle => 'IA Kanji';
	@override String get settingsUseModelKanjiSubtitle => 'Reconnaissance IA pour le dessin.';
	@override String get kanjiFilterEmpty => 'Aucun kanji pour ce niveau JLPT.';
	@override String get settingsBackupTitle => 'Sauvegarde';
	@override String get settingsBackupSubtitle => 'Exporter ou importer ta progression JSON.';
	@override String get settingsBackupExportButton => 'Exporter';
	@override String get settingsBackupImportButton => 'Importer';
	@override String settingsBackupExported({required Object path}) => 'Exporté vers ${path}';
	@override String settingsBackupImported({required Object count}) => '${count} réponses importées';
	@override String settingsBackupError({required Object error}) => 'Erreur de sauvegarde : ${error}';
	@override String get settingsGeneralSection => 'Général';
	@override String get settingsAiModelsSection => 'Modèles IA';
	@override String get settingsKanjiFilterSection => 'Kanji';
	@override String get settingsDataSection => 'Données';
	@override String get testGuideShow => 'Voir le guide';
	@override String get testGuideHide => 'Masquer le guide';
	@override String get testReportDrawing => 'Signaler dessin';
	@override String get testReportConfirmBody => 'Voulez-vous envoyer ce rapport maintenant ?';
	@override String get testReportThanks => 'Merci. Rapport prêt.';
	@override String get testReportError => 'Impossible de créer le rapport.';
	@override String get testKanjiTraceHint => 'Suis l\'ordre des traits. Active le guide si besoin.';
	@override String get aiInfoTitle => 'Modèles IA en dessin';
	@override String get aiInfoLine1 => 'Le reconnaissance IA peut échouer occasionnellement.';
	@override String get aiInfoLine2 => 'Si elle échoue, désactive le modèle pour utiliser une évaluation basée sur les traits.';
	@override String get aiInfoLine3 => 'Tu peux signaler les faux négatifs pour nous aider à l\'améliorer.';
	@override String get premiumSectionTitle => 'Premium';
	@override String get premiumSectionSubtitle => 'Débloque toutes les fonctionnalités et supprime les annonces interstitielles.';
	@override String get premiumOpenButton => 'Passer en Premium';
	@override String get premiumLockedMessage => 'Fonction Premium. Passe en Premium pour la débloquer.';
	@override String get premiumTitle => 'Kana Master Premium';
	@override String get premiumSubtitle => 'Achat unique, toutes les fonctionnalités débloquées.';
	@override String get premiumHeroTitle => 'Apprends sans limites';
	@override String get premiumHeroBody => 'Profite de l\'expérience complète et soutiens le projet.';
	@override String get premiumBenefitNoAds => 'Sans annonces interstitielles';
	@override String get premiumBenefitMaterials => 'Accès au mode Matériaux';
	@override String get premiumBenefitHard => 'Niveau difficile disponible';
	@override String get premiumBenefitAi => 'Options des modèles IA';
	@override String get premiumBenefitBackup => 'Exporter/importer les statistiques';
	@override String premiumBuyButton({required Object price}) => 'Acheter pour ${price}';
	@override String get premiumRestoreButton => 'Restaurer les achats';
	@override String get premiumOwnedBadge => 'Premium débloqué';
	@override String get premiumStoreUnavailable => 'Boutique indisponible. Réessaie plus tard.';
	@override String premiumPurchaseError({required Object error}) => 'Achat échoué : ${error}';
	@override String get premiumPurchased => 'Achat terminé. Premium débloqué.';
	@override String get premiumRestored => 'Achats restaurés.';
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
			'app.studyHubSubtitle' => 'Choisis une écriture et commence à apprendre ou pratiquer.',
			'app.paths' => 'Parcours',
			'app.script' => 'Écriture',
			'app.difficulty' => 'Difficulté',
			'app.difficultyEasy' => 'Facile',
			'app.difficultyMedium' => 'Moyenne',
			'app.difficultyHard' => 'Difficile',
			'app.difficultyEasyDesc' => 'Choix unique',
			'app.difficultyMediumDesc' => 'Texte',
			'app.difficultyHardDesc' => 'Dessin',
			'app.learn' => 'Apprendre',
			'app.learnSubtitle' => 'Découvre les caractères et les traits.',
			'app.practice' => 'Pratiquer',
			'app.practiceSubtitle' => 'Reconnaissance, écriture et dessin.',
			'app.materials' => 'Matériel',
			'app.materialsSubtitle' => 'Importe un CSV avec tes données.',
			'app.dictionary' => 'Dictionnaire',
			'app.dictionarySubtitle' => 'Recherche mots, kana et significations.',
			'app.statistics' => 'Stats',
			'app.statisticsSubtitle' => 'Précision, régularité et rythme.',
			'app.settings' => 'Options',
			'app.learningDefaults' => 'Préférences d\'étude',
			'app.testDifficulty' => 'Niveau du test',
			'app.testDifficultySubtitle' => 'Choisis la difficulté des exercices.',
			'app.importCsv' => 'Importer CSV',
			'app.expectedFormatTitle' => 'Format attendu',
			'app.expectedFormatBody' => 'En-têtes recommandés:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nChaque colonne peut être une question ou une réponse. CSV séparé par des virgules.',
			'app.fileLabel' => ({required Object name, required Object count}) => 'Fichier : ${name} (${count})',
			'app.askWith' => 'Question avec',
			'app.answerWith' => 'Répondre avec',
			'app.newQuestion' => 'Nouvelle question',
			'app.checkAnswer' => 'Vérifier',
			'app.materialsEmpty' => 'Importe un CSV et appuie sur "Nouvelle question".',
			'app.showAnswer' => 'Voir la réponse',
			'app.answerPrefix' => ({required Object answer}) => 'Réponse : ${answer}',
			'app.beginSession' => 'Démarrer',
			'app.practiceStartSubtitle' => 'Commence une nouvelle série.',
			'app.testStayFocused' => 'Reste concentré et envoie quand tu es prêt.',
			'app.testSketchHint' => 'Dessine dans la zone',
			'app.testTypeRomaji' => 'Écris le romaji',
			'app.testTypeMeaning' => 'Écris la signification',
			'app.testRomajiLabel' => 'Lecture romaji',
			'app.testMeaningLabel' => 'Signification espagnole',
			'app.testTapToType' => 'Touchez pour écrire',
			'app.testDrawThe' => ({required Object script}) => 'Dessine ${script}',
			'app.testWhichIs' => ({required Object script}) => 'Quel est ce ${script} ?',
			'app.testKanjiMeaning' => 'Signification de ce kanji ?',
			'app.statsNoDataTitle' => 'Aucune stat',
			'app.statsNoDataSubtitle' => 'Fais des tests pour débloquer les stats.',
			'app.statsReset' => 'Réinitialiser les stats',
			'app.statsActivity' => 'Activité',
			'app.statsActivitySubtitle' => '14 derniers jours',
			'app.statsEvolution' => 'Évolution',
			'app.statsEvolutionSubtitle' => 'Correct vs incorrect',
			'app.statsNoEvolution' => 'Aucune donnée.',
			'app.statsNoActivity' => 'Pas encore d\'activité.',
			'app.statsAccuracy' => 'Précision',
			'app.statsStreak' => 'Série',
			'app.statsLast7' => '7 jours',
			'app.statsLast30' => '30 jours',
			'app.statsSessions' => 'sessions',
			'app.statsBest' => ({required Object days}) => 'Meilleur ${days} jours',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct}/${total} correct',
			'app.statsCorrectLabel' => 'Correct',
			'app.statsIncorrectLabel' => 'Incorrect',
			'app.statsMomentum' => 'Momentum',
			'app.statsView' => 'Voir les stats',
			'app.statsStartToUnlock' => 'Commence une pratique pour voir tes stats.',
			'app.dictionaryEmpty' => 'Commence à chercher un mot.',
			'app.searchHint' => 'Mot, kana, romaji...',
			'app.correct' => 'Correct !',
			'app.incorrect' => 'Incorrect',
			'app.oops' => 'Oups...',
			'app.errorImporting' => ({required Object error}) => 'Erreur d\'import : ${error}',
			'app.importedEntries' => ({required Object count, required Object file}) => '${count} entrées importées depuis ${file}',
			'app.noValidRows' => 'Aucune ligne valide.',
			'app.dataNotFound' => 'Aucune donnée dans le CSV.',
			'app.materialsNeedImport' => 'Importe un CSV et choisis les colonnes.',
			'app.materialsNeedStart' => 'Commence d\'abord une question.',
			'app.language' => 'Langue',
			'app.languageSubtitle' => 'Choisis la langue de l\'app.',
			'app.back' => 'Retour',
			'app.ok' => 'OK',
			'app.yourAnswer' => 'Ta réponse',
			'app.statsStreakDays' => ({required Object days}) => 'Série de ${days} jours',
			'app.statsAttempts' => 'essais',
			'app.scriptHiragana' => 'Hiragana',
			'app.scriptKatakana' => 'Katakana',
			'app.scriptKanji' => 'Kanji',
			'app.testModeDrawing' => 'Dessin',
			'app.testModeQuiz' => 'Quiz',
			'app.dictionaryNotes' => 'Notes',
			'app.dictionarySeeAlso' => 'Voir aussi',
			'app.confirmActionTitle' => 'Confirmer',
			'app.confirmActionBody' => 'Supprimer TOUTES les statistiques ?',
			'app.cancel' => 'Annuler',
			'app.delete' => 'Supprimer',
			'app.searchByMeaning' => 'Chercher par sens',
			'app.filterAll' => 'Tout',
			'app.tabStudy' => 'Étude',
			'app.tabStats' => 'Stats',
			'app.settingsHapticsTitle' => 'Vibration',
			'app.settingsHapticsSubtitle' => 'Vibre si correct ou incorrect.',
			'app.settingsKanaSizeTitle' => 'Taille du kana',
			'app.settingsKanaSizeSubtitle' => 'Ajuste la taille des kana.',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'Niveau JLPT',
			'app.settingsKanjiJlptSubtitle' => 'Limiter les kanji par niveau JLPT.',
			'app.settingsUseModelHiraganaTitle' => 'IA Hiragana',
			'app.settingsUseModelHiraganaSubtitle' => 'Reconnaissance IA pour le dessin.',
			'app.settingsUseModelKatakanaTitle' => 'IA Katakana',
			'app.settingsUseModelKatakanaSubtitle' => 'Reconnaissance IA pour le dessin.',
			'app.settingsUseModelKanjiTitle' => 'IA Kanji',
			'app.settingsUseModelKanjiSubtitle' => 'Reconnaissance IA pour le dessin.',
			'app.kanjiFilterEmpty' => 'Aucun kanji pour ce niveau JLPT.',
			'app.settingsBackupTitle' => 'Sauvegarde',
			'app.settingsBackupSubtitle' => 'Exporter ou importer ta progression JSON.',
			'app.settingsBackupExportButton' => 'Exporter',
			'app.settingsBackupImportButton' => 'Importer',
			'app.settingsBackupExported' => ({required Object path}) => 'Exporté vers ${path}',
			'app.settingsBackupImported' => ({required Object count}) => '${count} réponses importées',
			'app.settingsBackupError' => ({required Object error}) => 'Erreur de sauvegarde : ${error}',
			'app.settingsGeneralSection' => 'Général',
			'app.settingsAiModelsSection' => 'Modèles IA',
			'app.settingsKanjiFilterSection' => 'Kanji',
			'app.settingsDataSection' => 'Données',
			'app.testGuideShow' => 'Voir le guide',
			'app.testGuideHide' => 'Masquer le guide',
			'app.testReportDrawing' => 'Signaler dessin',
			'app.testReportConfirmBody' => 'Voulez-vous envoyer ce rapport maintenant ?',
			'app.testReportThanks' => 'Merci. Rapport prêt.',
			'app.testReportError' => 'Impossible de créer le rapport.',
			'app.testKanjiTraceHint' => 'Suis l\'ordre des traits. Active le guide si besoin.',
			'app.aiInfoTitle' => 'Modèles IA en dessin',
			'app.aiInfoLine1' => 'Le reconnaissance IA peut échouer occasionnellement.',
			'app.aiInfoLine2' => 'Si elle échoue, désactive le modèle pour utiliser une évaluation basée sur les traits.',
			'app.aiInfoLine3' => 'Tu peux signaler les faux négatifs pour nous aider à l\'améliorer.',
			'app.premiumSectionTitle' => 'Premium',
			'app.premiumSectionSubtitle' => 'Débloque toutes les fonctionnalités et supprime les annonces interstitielles.',
			'app.premiumOpenButton' => 'Passer en Premium',
			'app.premiumLockedMessage' => 'Fonction Premium. Passe en Premium pour la débloquer.',
			'app.premiumTitle' => 'Kana Master Premium',
			'app.premiumSubtitle' => 'Achat unique, toutes les fonctionnalités débloquées.',
			'app.premiumHeroTitle' => 'Apprends sans limites',
			'app.premiumHeroBody' => 'Profite de l\'expérience complète et soutiens le projet.',
			'app.premiumBenefitNoAds' => 'Sans annonces interstitielles',
			'app.premiumBenefitMaterials' => 'Accès au mode Matériaux',
			'app.premiumBenefitHard' => 'Niveau difficile disponible',
			'app.premiumBenefitAi' => 'Options des modèles IA',
			'app.premiumBenefitBackup' => 'Exporter/importer les statistiques',
			'app.premiumBuyButton' => ({required Object price}) => 'Acheter pour ${price}',
			'app.premiumRestoreButton' => 'Restaurer les achats',
			'app.premiumOwnedBadge' => 'Premium débloqué',
			'app.premiumStoreUnavailable' => 'Boutique indisponible. Réessaie plus tard.',
			'app.premiumPurchaseError' => ({required Object error}) => 'Achat échoué : ${error}',
			'app.premiumPurchased' => 'Achat terminé. Premium débloqué.',
			'app.premiumRestored' => 'Achats restaurés.',
			_ => null,
		};
	}
}
