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
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$fr app = _Translations$app$fr._(_root);
	@override late final _Translations$exam$fr exam = _Translations$exam$fr._(_root);
}

// Path: app
class _Translations$app$fr implements Translations$app$en {
	_Translations$app$fr._(this._root);

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
	@override String get premiumSectionSubtitle => 'Débloque toutes les fonctionnalités et supprime les annonces.';
	@override String get premiumOpenButton => 'Passer en Premium';
	@override String get premiumLockedMessage => 'Fonction Premium. Passe en Premium pour la débloquer.';
	@override String get premiumTitle => 'KanaGo Premium';
	@override String get premiumSubtitle => 'Achat unique, toutes les fonctionnalités débloquées.';
	@override String get premiumHeroTitle => 'Apprends sans limites';
	@override String get premiumHeroBody => 'Profite de l\'expérience complète et soutiens le projet.';
	@override String get premiumBenefitNoAds => 'Sans annonces';
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
	@override String get testNext => 'Suivant';
	@override String testCorrectAnswerWas({required Object answer}) => 'Bonne réponse : ${answer}';
	@override String testQuestionProgress({required Object current, required Object total}) => 'Question ${current} sur ${total}';
	@override String get testKanjiReading => 'Comment se lit ce kanji ?';
	@override String get testTypeReading => 'Écris la lecture (kana ou romaji)';
	@override String get sessionSummaryTitle => 'Session terminée';
	@override String get sessionReviewSummaryTitle => 'Révision terminée';
	@override String sessionScore({required Object correct, required Object total}) => '${correct} sur ${total} correctes';
	@override String get sessionPerfect => 'Parfait ! Aucune erreur.';
	@override String get sessionMistakesTitle => 'À revoir';
	@override String sessionReviewMistakes({required Object count}) => 'Revoir les erreurs (${count})';
	@override String get sessionNew => 'Nouvelle session';
	@override String get sessionExit => 'Terminer';
	@override String get practiceWhat => 'Que pratiquer';
	@override String get practiceRowsBasic => 'De base';
	@override String get practiceRowsDakuten => 'Dakuten';
	@override String get practiceRowsCombos => 'Combinaisons';
	@override String get practiceSelectAll => 'Tous';
	@override String practiceItemsCount({required Object count}) => '${count} caractères';
	@override String get practiceNotDrawable => 'Les combinaisons et les katakana avec dakuten ne peuvent pas être dessinés ; ils sont ignorés en mode dessin.';
	@override String get practiceNothingToDraw => 'Aucun des caractères choisis ne peut être dessiné. Choisis d\'autres lignes ou une difficulté plus basse.';
	@override String get practiceSessionLength => 'Questions par session';
	@override String get practiceSource => 'Questions de';
	@override String get practiceSourceAll => 'Tout';
	@override String practiceSourceMistakes({required Object count}) => 'Mes erreurs (${count})';
	@override String get kanjiQuizMode => 'Demander';
	@override String get kanjiModeMeaning => 'Sens';
	@override String get kanjiModeReading => 'Lecture';
	@override String get statsMasteryTitle => 'Maîtrise';
	@override String get statsMasterySubtitle => 'Un caractère est maîtrisé après 3 bonnes réponses d\'affilée.';
	@override String statsMasteredCount({required Object mastered, required Object total}) => '${mastered} sur ${total} maîtrisés';
	@override String get statsLegendMastered => 'Maîtrisé';
	@override String get statsLegendLearning => 'En apprentissage';
	@override String get statsLegendWeak => 'À revoir';
	@override String get statsLegendNew => 'Pas encore vu';
	@override String get statsWeakest => 'À revoir';
	@override String get learnDakutenTitle => 'Dakuten';
	@override String get learnCombosTitle => 'Combinaisons';
	@override String get settingsBackupImportConfirm => 'L\'importation remplace toutes tes statistiques actuelles. Continuer ?';
	@override String get dictionaryEnglishNote => 'Les résultats proviennent de Jisho.org et sont en anglais.';
	@override String get dictionaryError => 'Recherche impossible. Vérifie ta connexion et réessaie.';
	@override String materialsScore({required Object correct, required Object total}) => '${correct} / ${total} correctes';
	@override String get materialsClear => 'Retirer la liste';
	@override String get premiumBenefitJlpt => 'Tous les niveaux JLPT (N4–N1)';
	@override String get settingsThemeTitle => 'Apparence';
	@override String get settingsThemeSubtitle => 'Clair, sombre ou selon le système.';
	@override String get settingsThemeSystem => 'Automatique';
	@override String get settingsThemeLight => 'Clair';
	@override String get settingsThemeDark => 'Sombre';
	@override String get reminderChannelName => 'Rappel quotidien';
	@override String get reminderChannelDescription => 'Un rappel à 19 h si tu n\'as pas encore pratiqué ce jour-là.';
	@override String get reminderStreakTitle => '🔥 Ne perds pas ta série !';
	@override String reminderStreakBody({required Object days}) => 'Tu pratiques depuis ${days} jours d\'affilée. Quelques minutes aujourd\'hui pour la garder.';
	@override String get reminderSecondDayTitle => '🔥 Passe au deuxième jour';
	@override String get reminderSecondDayBody => 'Tu as pratiqué hier. Recommence aujourd\'hui et lance une série.';
	@override String get reminderComebackTitle => 'Quelques minutes de japonais ?';
	@override String get reminderComebackBody => 'Tes kana t\'attendent. Une courte session lance une nouvelle série.';
	@override String get reminderLastTitle => 'Tu nous manques 👋';
	@override String get reminderLastBody => 'Reviens quand tu veux : 5 minutes de révision, ça compte déjà.';
	@override String get settingsReminderTitle => 'Rappel quotidien';
	@override String get settingsReminderSubtitle => 'Te prévient à 19 h si tu n\'as pas encore pratiqué ce jour-là.';
	@override String get settingsReminderBlocked => 'Les notifications de KanaGo sont désactivées. Active-les dans les réglages du système.';
	@override String get settingsAdPrivacyTitle => 'Confidentialité des annonces';
	@override String get settingsAdPrivacySubtitle => 'Modifie ton consentement pour les annonces personnalisées.';
}

// Path: exam
class _Translations$exam$fr implements Translations$exam$en {
	_Translations$exam$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get tab => 'Examen';
	@override String get hubTitle => 'Simulateur JLPT N5';
	@override String get hubSubtitle => 'Des examens au même format que le vrai';
	@override String get daysLeft => 'jours avant l\'examen';
	@override String get examsToday => 'examens aujourd\'hui';
	@override String get questionsSeen => 'questions vues';
	@override String get fullExam => 'Examen complet';
	@override String get fullExamSubtitle => '20 + 40 + 30 min · 67 questions';
	@override String sectionCardSubtitle({required Object minutes, required Object count}) => '${minutes} min · ${count} questions';
	@override String get progressTitle => 'Progression (examen complet)';
	@override String get weakPoints => 'Points faibles';
	@override String weakPointsSubtitle({required Object count}) => 'Bonnes réponses par type de question sur tes ${count} derniers examens';
	@override String get history => 'Historique';
	@override String historyFullDetail({required Object date, required Object language, required Object listening}) => '${date} · Langue ${language}/120 · Compréhension orale ${listening}/60';
	@override late final _Translations$exam$sections$fr sections = _Translations$exam$sections$fr._(_root);
	@override late final _Translations$exam$mondai$fr mondai = _Translations$exam$mondai$fr._(_root);
	@override String get createError => 'Impossible de créer l\'examen.';
	@override String get leaveTitle => 'Quitter l\'examen ?';
	@override String get leaveBody => 'Tes réponses à cet examen seront perdues.';
	@override String get keepGoing => 'Continuer';
	@override String get leave => 'Quitter';
	@override String sectionOf({required Object current, required Object total}) => 'Section ${current} sur ${total}';
	@override String sectionInfo({required Object minutes, required Object count}) => '${minutes} minutes · ${count} questions';
	@override String get listeningIntro => 'L\'audio avance tout seul et ne passe qu\'une fois, comme à l\'examen. Réponds pendant la pause après chaque question. Utilise des écouteurs.';
	@override String get writtenIntro => 'Tu peux passer librement d\'une question à l\'autre. Quand le temps est écoulé, la section est rendue automatiquement.';
	@override String get start => 'Commencer';
	@override String get timeUp => 'Temps écoulé';
	@override String get submitTitle => 'Rendre la section ?';
	@override String get submitAllAnswered => 'Tu as répondu à toutes les questions.';
	@override String submitUnanswered({required Object count}) => 'Questions sans réponse : ${count}.';
	@override String get submit => 'Rendre';
	@override String get previous => 'Précédente';
	@override String get next => 'Suivante';
	@override String questionOf({required Object current, required Object total}) => 'Question ${current} sur ${total}';
	@override String get resultTitle => 'Résultat';
	@override String get reviewAnswers => 'Revoir les réponses';
	@override String get back => 'Retour';
	@override String get passed => 'Réussi';
	@override String get failed => 'Échoué';
	@override String get scoreNote => 'Score estimé : chaque question compte autant. Pour réussir, il faut 80/180 et au moins 38 et 19 dans chaque partie.';
	@override String correctOf({required Object correct, required Object total}) => '${correct} sur ${total} correctes';
	@override String get listeningHint => 'Minimum pour ne pas échouer à la compréhension orale : 19/60 (32 %). Pour avoir de la marge, vise plus de 60 %.';
	@override String get languageHint => 'Minimum pour la partie langue : 38/120 (32 %). Pour avoir de la marge, vise plus de 60 %.';
	@override String get reviewTitle => 'Révision';
	@override String get onlyMistakes => 'Erreurs seulement';
	@override String get noMistakes => 'Aucune erreur !';
	@override String get unanswered => 'Sans réponse';
	@override String get correct => 'Correcte';
	@override String get incorrect => 'Incorrecte';
	@override String get translation => 'Traduction';
	@override String get showTextTranslation => 'Afficher la traduction du texte';
	@override String get hideTextTranslation => 'Masquer la traduction du texte';
	@override String get listen => 'Écouter';
	@override String get stop => 'Arrêter';
	@override String get instructions => 'Consignes';
	@override String get listening => 'Écoute…';
	@override String answerNow({required Object seconds}) => 'Réponds · ${seconds} s';
	@override String get paused => 'En pause';
	@override String get resume => 'Reprendre';
	@override String get pause => 'Pause';
}

// Path: exam.sections
class _Translations$exam$sections$fr implements Translations$exam$sections$en {
	_Translations$exam$sections$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get vocabulary => 'Vocabulaire et écriture';
	@override String get grammarReading => 'Grammaire et lecture';
	@override String get listening => 'Compréhension orale';
}

// Path: exam.mondai
class _Translations$exam$mondai$fr implements Translations$exam$mondai$en {
	_Translations$exam$mondai$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get kanjiReading => 'Lecture des kanji';
	@override String get orthography => 'Écriture';
	@override String get contextual => 'Vocabulaire en contexte';
	@override String get paraphrase => 'Paraphrase';
	@override String get grammarForm => 'Forme grammaticale';
	@override String get sentenceOrder => 'Ordre de la phrase';
	@override String get textGrammar => 'Grammaire du texte';
	@override String get shortReading => 'Textes courts';
	@override String get midReading => 'Texte moyen';
	@override String get infoSearch => 'Recherche d\'informations';
	@override String get taskListening => 'Compréhension de tâches';
	@override String get pointListening => 'Compréhension des points clés';
	@override String get utterance => 'Expressions orales';
	@override String get quickResponse => 'Réponse immédiate';
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
			'app.premiumSectionSubtitle' => 'Débloque toutes les fonctionnalités et supprime les annonces.',
			'app.premiumOpenButton' => 'Passer en Premium',
			'app.premiumLockedMessage' => 'Fonction Premium. Passe en Premium pour la débloquer.',
			'app.premiumTitle' => 'KanaGo Premium',
			'app.premiumSubtitle' => 'Achat unique, toutes les fonctionnalités débloquées.',
			'app.premiumHeroTitle' => 'Apprends sans limites',
			'app.premiumHeroBody' => 'Profite de l\'expérience complète et soutiens le projet.',
			'app.premiumBenefitNoAds' => 'Sans annonces',
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
			'app.testNext' => 'Suivant',
			'app.testCorrectAnswerWas' => ({required Object answer}) => 'Bonne réponse : ${answer}',
			'app.testQuestionProgress' => ({required Object current, required Object total}) => 'Question ${current} sur ${total}',
			'app.testKanjiReading' => 'Comment se lit ce kanji ?',
			'app.testTypeReading' => 'Écris la lecture (kana ou romaji)',
			'app.sessionSummaryTitle' => 'Session terminée',
			'app.sessionReviewSummaryTitle' => 'Révision terminée',
			'app.sessionScore' => ({required Object correct, required Object total}) => '${correct} sur ${total} correctes',
			'app.sessionPerfect' => 'Parfait ! Aucune erreur.',
			'app.sessionMistakesTitle' => 'À revoir',
			'app.sessionReviewMistakes' => ({required Object count}) => 'Revoir les erreurs (${count})',
			'app.sessionNew' => 'Nouvelle session',
			'app.sessionExit' => 'Terminer',
			'app.practiceWhat' => 'Que pratiquer',
			'app.practiceRowsBasic' => 'De base',
			'app.practiceRowsDakuten' => 'Dakuten',
			'app.practiceRowsCombos' => 'Combinaisons',
			'app.practiceSelectAll' => 'Tous',
			'app.practiceItemsCount' => ({required Object count}) => '${count} caractères',
			'app.practiceNotDrawable' => 'Les combinaisons et les katakana avec dakuten ne peuvent pas être dessinés ; ils sont ignorés en mode dessin.',
			'app.practiceNothingToDraw' => 'Aucun des caractères choisis ne peut être dessiné. Choisis d\'autres lignes ou une difficulté plus basse.',
			'app.practiceSessionLength' => 'Questions par session',
			'app.practiceSource' => 'Questions de',
			'app.practiceSourceAll' => 'Tout',
			'app.practiceSourceMistakes' => ({required Object count}) => 'Mes erreurs (${count})',
			'app.kanjiQuizMode' => 'Demander',
			'app.kanjiModeMeaning' => 'Sens',
			'app.kanjiModeReading' => 'Lecture',
			'app.statsMasteryTitle' => 'Maîtrise',
			'app.statsMasterySubtitle' => 'Un caractère est maîtrisé après 3 bonnes réponses d\'affilée.',
			'app.statsMasteredCount' => ({required Object mastered, required Object total}) => '${mastered} sur ${total} maîtrisés',
			'app.statsLegendMastered' => 'Maîtrisé',
			'app.statsLegendLearning' => 'En apprentissage',
			'app.statsLegendWeak' => 'À revoir',
			'app.statsLegendNew' => 'Pas encore vu',
			'app.statsWeakest' => 'À revoir',
			'app.learnDakutenTitle' => 'Dakuten',
			'app.learnCombosTitle' => 'Combinaisons',
			'app.settingsBackupImportConfirm' => 'L\'importation remplace toutes tes statistiques actuelles. Continuer ?',
			'app.dictionaryEnglishNote' => 'Les résultats proviennent de Jisho.org et sont en anglais.',
			'app.dictionaryError' => 'Recherche impossible. Vérifie ta connexion et réessaie.',
			'app.materialsScore' => ({required Object correct, required Object total}) => '${correct} / ${total} correctes',
			'app.materialsClear' => 'Retirer la liste',
			'app.premiumBenefitJlpt' => 'Tous les niveaux JLPT (N4–N1)',
			'app.settingsThemeTitle' => 'Apparence',
			'app.settingsThemeSubtitle' => 'Clair, sombre ou selon le système.',
			'app.settingsThemeSystem' => 'Automatique',
			'app.settingsThemeLight' => 'Clair',
			'app.settingsThemeDark' => 'Sombre',
			'app.reminderChannelName' => 'Rappel quotidien',
			'app.reminderChannelDescription' => 'Un rappel à 19 h si tu n\'as pas encore pratiqué ce jour-là.',
			'app.reminderStreakTitle' => '🔥 Ne perds pas ta série !',
			'app.reminderStreakBody' => ({required Object days}) => 'Tu pratiques depuis ${days} jours d\'affilée. Quelques minutes aujourd\'hui pour la garder.',
			'app.reminderSecondDayTitle' => '🔥 Passe au deuxième jour',
			'app.reminderSecondDayBody' => 'Tu as pratiqué hier. Recommence aujourd\'hui et lance une série.',
			'app.reminderComebackTitle' => 'Quelques minutes de japonais ?',
			'app.reminderComebackBody' => 'Tes kana t\'attendent. Une courte session lance une nouvelle série.',
			'app.reminderLastTitle' => 'Tu nous manques 👋',
			'app.reminderLastBody' => 'Reviens quand tu veux : 5 minutes de révision, ça compte déjà.',
			'app.settingsReminderTitle' => 'Rappel quotidien',
			'app.settingsReminderSubtitle' => 'Te prévient à 19 h si tu n\'as pas encore pratiqué ce jour-là.',
			'app.settingsReminderBlocked' => 'Les notifications de KanaGo sont désactivées. Active-les dans les réglages du système.',
			'app.settingsAdPrivacyTitle' => 'Confidentialité des annonces',
			'app.settingsAdPrivacySubtitle' => 'Modifie ton consentement pour les annonces personnalisées.',
			'exam.tab' => 'Examen',
			'exam.hubTitle' => 'Simulateur JLPT N5',
			'exam.hubSubtitle' => 'Des examens au même format que le vrai',
			'exam.daysLeft' => 'jours avant l\'examen',
			'exam.examsToday' => 'examens aujourd\'hui',
			'exam.questionsSeen' => 'questions vues',
			'exam.fullExam' => 'Examen complet',
			'exam.fullExamSubtitle' => '20 + 40 + 30 min · 67 questions',
			'exam.sectionCardSubtitle' => ({required Object minutes, required Object count}) => '${minutes} min · ${count} questions',
			'exam.progressTitle' => 'Progression (examen complet)',
			'exam.weakPoints' => 'Points faibles',
			'exam.weakPointsSubtitle' => ({required Object count}) => 'Bonnes réponses par type de question sur tes ${count} derniers examens',
			'exam.history' => 'Historique',
			'exam.historyFullDetail' => ({required Object date, required Object language, required Object listening}) => '${date} · Langue ${language}/120 · Compréhension orale ${listening}/60',
			'exam.sections.vocabulary' => 'Vocabulaire et écriture',
			'exam.sections.grammarReading' => 'Grammaire et lecture',
			'exam.sections.listening' => 'Compréhension orale',
			'exam.mondai.kanjiReading' => 'Lecture des kanji',
			'exam.mondai.orthography' => 'Écriture',
			'exam.mondai.contextual' => 'Vocabulaire en contexte',
			'exam.mondai.paraphrase' => 'Paraphrase',
			'exam.mondai.grammarForm' => 'Forme grammaticale',
			'exam.mondai.sentenceOrder' => 'Ordre de la phrase',
			'exam.mondai.textGrammar' => 'Grammaire du texte',
			'exam.mondai.shortReading' => 'Textes courts',
			'exam.mondai.midReading' => 'Texte moyen',
			'exam.mondai.infoSearch' => 'Recherche d\'informations',
			'exam.mondai.taskListening' => 'Compréhension de tâches',
			'exam.mondai.pointListening' => 'Compréhension des points clés',
			'exam.mondai.utterance' => 'Expressions orales',
			'exam.mondai.quickResponse' => 'Réponse immédiate',
			'exam.createError' => 'Impossible de créer l\'examen.',
			'exam.leaveTitle' => 'Quitter l\'examen ?',
			'exam.leaveBody' => 'Tes réponses à cet examen seront perdues.',
			'exam.keepGoing' => 'Continuer',
			'exam.leave' => 'Quitter',
			'exam.sectionOf' => ({required Object current, required Object total}) => 'Section ${current} sur ${total}',
			'exam.sectionInfo' => ({required Object minutes, required Object count}) => '${minutes} minutes · ${count} questions',
			'exam.listeningIntro' => 'L\'audio avance tout seul et ne passe qu\'une fois, comme à l\'examen. Réponds pendant la pause après chaque question. Utilise des écouteurs.',
			'exam.writtenIntro' => 'Tu peux passer librement d\'une question à l\'autre. Quand le temps est écoulé, la section est rendue automatiquement.',
			'exam.start' => 'Commencer',
			'exam.timeUp' => 'Temps écoulé',
			'exam.submitTitle' => 'Rendre la section ?',
			'exam.submitAllAnswered' => 'Tu as répondu à toutes les questions.',
			'exam.submitUnanswered' => ({required Object count}) => 'Questions sans réponse : ${count}.',
			'exam.submit' => 'Rendre',
			'exam.previous' => 'Précédente',
			'exam.next' => 'Suivante',
			'exam.questionOf' => ({required Object current, required Object total}) => 'Question ${current} sur ${total}',
			'exam.resultTitle' => 'Résultat',
			'exam.reviewAnswers' => 'Revoir les réponses',
			'exam.back' => 'Retour',
			'exam.passed' => 'Réussi',
			'exam.failed' => 'Échoué',
			'exam.scoreNote' => 'Score estimé : chaque question compte autant. Pour réussir, il faut 80/180 et au moins 38 et 19 dans chaque partie.',
			'exam.correctOf' => ({required Object correct, required Object total}) => '${correct} sur ${total} correctes',
			'exam.listeningHint' => 'Minimum pour ne pas échouer à la compréhension orale : 19/60 (32 %). Pour avoir de la marge, vise plus de 60 %.',
			'exam.languageHint' => 'Minimum pour la partie langue : 38/120 (32 %). Pour avoir de la marge, vise plus de 60 %.',
			'exam.reviewTitle' => 'Révision',
			'exam.onlyMistakes' => 'Erreurs seulement',
			'exam.noMistakes' => 'Aucune erreur !',
			'exam.unanswered' => 'Sans réponse',
			'exam.correct' => 'Correcte',
			'exam.incorrect' => 'Incorrecte',
			'exam.translation' => 'Traduction',
			'exam.showTextTranslation' => 'Afficher la traduction du texte',
			'exam.hideTextTranslation' => 'Masquer la traduction du texte',
			'exam.listen' => 'Écouter',
			'exam.stop' => 'Arrêter',
			'exam.instructions' => 'Consignes',
			'exam.listening' => 'Écoute…',
			'exam.answerNow' => ({required Object seconds}) => 'Réponds · ${seconds} s',
			'exam.paused' => 'En pause',
			'exam.resume' => 'Reprendre',
			'exam.pause' => 'Pause',
			_ => null,
		};
	}
}
