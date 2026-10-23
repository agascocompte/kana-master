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
class TranslationsEs with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$es app = _Translations$app$es._(_root);
	@override late final _Translations$exam$es exam = _Translations$exam$es._(_root);
}

// Path: app
class _Translations$app$es implements Translations$app$en {
	_Translations$app$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get studyHubTitle => 'Centro de estudio';
	@override String get studyHubSubtitle => 'Elige tu escritura y empieza a aprender o practicar.';
	@override String get paths => 'Rutas';
	@override String get script => 'Escritura';
	@override String get difficulty => 'Dificultad';
	@override String get difficultyEasy => 'Fácil';
	@override String get difficultyMedium => 'Media';
	@override String get difficultyHard => 'Difícil';
	@override String get difficultyEasyDesc => 'Opción única';
	@override String get difficultyMediumDesc => 'Texto';
	@override String get difficultyHardDesc => 'Dibujo';
	@override String get learn => 'Aprender';
	@override String get learnSubtitle => 'Explora caracteres y pistas de trazos.';
	@override String get practice => 'Practicar';
	@override String get practiceSubtitle => 'Reconocimiento, escritura y dibujo.';
	@override String get materials => 'Materiales';
	@override String get materialsSubtitle => 'Importa un CSV con tus propios datos.';
	@override String get dictionary => 'Diccionario';
	@override String get dictionarySubtitle => 'Busca palabras, kana y significados al instante.';
	@override String get statistics => 'Estadísticas';
	@override String get statisticsSubtitle => 'Consistencia, precisión y ritmo por tipo de kana.';
	@override String get settings => 'Ajustes';
	@override String get learningDefaults => 'Preferencias de estudio';
	@override String get testDifficulty => 'Dificultad del test';
	@override String get testDifficultySubtitle => 'Elige la dificultad para las prácticas.';
	@override String get importCsv => 'Importar CSV';
	@override String get expectedFormatTitle => 'Formato esperado';
	@override String get expectedFormatBody => 'Encabezados recomendados:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nPuedes mapear cualquier columna como pregunta o respuesta. CSV separado por comas.';
	@override String fileLabel({required Object name, required Object count}) => 'Archivo: ${name} (${count} filas)';
	@override String get askWith => 'Preguntar con';
	@override String get answerWith => 'Responder con';
	@override String get newQuestion => 'Nueva pregunta';
	@override String get checkAnswer => 'Comprobar';
	@override String get materialsEmpty => 'Importa un CSV y pulsa "Nueva pregunta" para empezar.';
	@override String get showAnswer => 'Mostrar respuesta';
	@override String answerPrefix({required Object answer}) => 'Respuesta: ${answer}';
	@override String get beginSession => 'Empezar sesión';
	@override String get practiceStartSubtitle => 'Comienza una nueva ronda y mantén la racha.';
	@override String get testStayFocused => 'Concéntrate y envía cuando estés listo.';
	@override String get testSketchHint => 'Dibuja dentro del lienzo';
	@override String get testTypeRomaji => 'Escribe el romaji';
	@override String get testTypeMeaning => 'Escribe el significado';
	@override String get testRomajiLabel => 'Lectura en romaji';
	@override String get testMeaningLabel => 'Significado en español';
	@override String get testTapToType => 'Toca para escribir';
	@override String testDrawThe({required Object script}) => 'Dibuja el ${script}';
	@override String testWhichIs({required Object script}) => '¿Cuál es este ${script}?';
	@override String get testKanjiMeaning => '¿Significado de este kanji?';
	@override String get statsNoDataTitle => 'Sin estadísticas';
	@override String get statsNoDataSubtitle => 'Completa algunos tests para desbloquear rachas y gráficos.';
	@override String get statsReset => 'Reiniciar estadísticas';
	@override String get statsActivity => 'Actividad diaria';
	@override String get statsActivitySubtitle => 'Últimos 14 días';
	@override String get statsEvolution => 'Evolución';
	@override String get statsEvolutionSubtitle => 'Correctas vs incorrectas';
	@override String get statsNoEvolution => 'Sin datos de evolución.';
	@override String get statsNoActivity => 'Sin actividad aún.';
	@override String get statsAccuracy => 'Precisión';
	@override String get statsStreak => 'Racha';
	@override String get statsLast7 => 'Últimos 7 días';
	@override String get statsLast30 => 'Últimos 30 días';
	@override String get statsSessions => 'sesiones';
	@override String statsBest({required Object days}) => 'Mejor ${days} días';
	@override String statsCorrect({required Object correct, required Object total}) => '${correct} / ${total} correctas';
	@override String get statsCorrectLabel => 'Correctas';
	@override String get statsIncorrectLabel => 'Incorrectas';
	@override String get statsMomentum => 'Momentum';
	@override String get statsView => 'Ver estadísticas';
	@override String get statsStartToUnlock => 'Empieza una práctica para desbloquear tus estadísticas.';
	@override String get dictionaryEmpty => 'Empieza a buscar una palabra.';
	@override String get searchHint => 'Buscar palabra, kana, romaji...';
	@override String get correct => '¡Correcto!';
	@override String get incorrect => 'Respuesta incorrecta';
	@override String get oops => 'Ups, fallaste...';
	@override String errorImporting({required Object error}) => 'Error al importar: ${error}';
	@override String importedEntries({required Object count, required Object file}) => 'Importadas ${count} entradas desde ${file}';
	@override String get noValidRows => 'No se encontraron filas válidas.';
	@override String get dataNotFound => 'No hay datos en el CSV.';
	@override String get materialsNeedImport => 'Importa un CSV y elige columnas antes de practicar.';
	@override String get materialsNeedStart => 'Primero inicia una pregunta con tu material.';
	@override String get language => 'Idioma';
	@override String get languageSubtitle => 'Elige el idioma de la app.';
	@override String get back => 'Atrás';
	@override String get ok => 'OK';
	@override String get yourAnswer => 'Tu respuesta';
	@override String statsStreakDays({required Object days}) => 'Racha de ${days} días';
	@override String get statsAttempts => 'intentos';
	@override String get scriptHiragana => 'Hiragana';
	@override String get scriptKatakana => 'Katakana';
	@override String get scriptKanji => 'Kanji';
	@override String get testModeDrawing => 'Dibujo';
	@override String get testModeQuiz => 'Quiz';
	@override String get dictionaryNotes => 'Notas';
	@override String get dictionarySeeAlso => 'Ver también';
	@override String get confirmActionTitle => 'Confirmar acción';
	@override String get confirmActionBody => '¿Seguro que quieres borrar TODAS las estadísticas?';
	@override String get cancel => 'Cancelar';
	@override String get delete => 'Eliminar';
	@override String get searchByMeaning => 'Buscar por significado';
	@override String get filterAll => 'Todo';
	@override String get tabStudy => 'Estudio';
	@override String get tabStats => 'Estadísticas';
	@override String get settingsHapticsTitle => 'Vibración';
	@override String get settingsHapticsSubtitle => 'Vibra al acertar o fallar.';
	@override String get settingsKanaSizeTitle => 'Tamaño del kana';
	@override String get settingsKanaSizeSubtitle => 'Ajusta el tamaño de los kana en la interfaz.';
	@override String settingsKanaSizeValue({required Object value}) => '${value}x';
	@override String get settingsKanjiJlptTitle => 'Nivel JLPT kanji';
	@override String get settingsKanjiJlptSubtitle => 'Limita los kanji a un nivel JLPT.';
	@override String get settingsUseModelHiraganaTitle => 'Modelo IA de hiragana';
	@override String get settingsUseModelHiraganaSubtitle => 'Usar reconocimiento por modelo en dibujo de hiragana.';
	@override String get settingsUseModelKatakanaTitle => 'Modelo IA de katakana';
	@override String get settingsUseModelKatakanaSubtitle => 'Usar reconocimiento por modelo en dibujo de katakana.';
	@override String get settingsUseModelKanjiTitle => 'Modelo IA de kanji';
	@override String get settingsUseModelKanjiSubtitle => 'Usar reconocimiento por modelo en dibujo de kanji.';
	@override String get kanjiFilterEmpty => 'No hay kanji para este nivel JLPT.';
	@override String get settingsBackupTitle => 'Copia de estadísticas';
	@override String get settingsBackupSubtitle => 'Exporta o importa tu progreso en un archivo JSON.';
	@override String get settingsBackupExportButton => 'Exportar';
	@override String get settingsBackupImportButton => 'Importar';
	@override String settingsBackupExported({required Object path}) => 'Copia exportada en ${path}';
	@override String settingsBackupImported({required Object count}) => 'Importadas ${count} respuestas';
	@override String settingsBackupError({required Object error}) => 'Error de copia: ${error}';
	@override String get settingsGeneralSection => 'General';
	@override String get settingsAiModelsSection => 'Modelos IA';
	@override String get settingsKanjiFilterSection => 'Kanji';
	@override String get settingsDataSection => 'Datos';
	@override String get testGuideShow => 'Mostrar guía';
	@override String get testGuideHide => 'Ocultar guía';
	@override String get testReportDrawing => 'Reportar dibujo';
	@override String get testReportConfirmBody => '¿Quieres enviar este informe ahora?';
	@override String get testReportThanks => 'Gracias. Informe preparado para revisar.';
	@override String get testReportError => 'No se pudo preparar el informe.';
	@override String get testKanjiTraceHint => 'Sigue el orden de trazos. Activa la guía si la necesitas.';
	@override String get aiInfoTitle => 'Modelos de IA en dibujo';
	@override String get aiInfoLine1 => 'El reconocimiento de IA puede fallar ocasionalmente.';
	@override String get aiInfoLine2 => 'Si falla, desactiva el modelo para usar una evaluación basada en trazos.';
	@override String get aiInfoLine3 => 'Puedes reportar falsos negativos para ayudarnos a mejorarlo.';
	@override String get premiumSectionTitle => 'Premium';
	@override String get premiumSectionSubtitle => 'Desbloquea todas las funciones y elimina anuncios.';
	@override String get premiumOpenButton => 'Mejorar';
	@override String get premiumLockedMessage => 'Función premium. Mejora para desbloquearla.';
	@override String get premiumTitle => 'KanaGo Premium';
	@override String get premiumSubtitle => 'Compra única, todas las funciones desbloqueadas.';
	@override String get premiumHeroTitle => 'Aprende sin límites';
	@override String get premiumHeroBody => 'Consigue la experiencia completa y apoya el proyecto.';
	@override String get premiumBenefitNoAds => 'Sin anuncios';
	@override String get premiumBenefitMaterials => 'Acceso al modo Material';
	@override String get premiumBenefitHard => 'Dificultad alta disponible';
	@override String get premiumBenefitAi => 'Opciones de modelos IA';
	@override String get premiumBenefitBackup => 'Exportar/importar estadísticas';
	@override String premiumBuyButton({required Object price}) => 'Comprar por ${price}';
	@override String get premiumRestoreButton => 'Restaurar compras';
	@override String get premiumOwnedBadge => 'Premium desbloqueado';
	@override String get premiumStoreUnavailable => 'Tienda no disponible. Inténtalo más tarde.';
	@override String premiumPurchaseError({required Object error}) => 'Compra fallida: ${error}';
	@override String get premiumPurchased => 'Compra completada. Premium desbloqueado.';
	@override String get premiumRestored => 'Compras restauradas.';
	@override String get testNext => 'Siguiente';
	@override String testCorrectAnswerWas({required Object answer}) => 'Respuesta correcta: ${answer}';
	@override String testQuestionProgress({required Object current, required Object total}) => 'Pregunta ${current} de ${total}';
	@override String get testKanjiReading => '¿Cómo se lee este kanji?';
	@override String get testTypeReading => 'Escribe la lectura (kana o romaji)';
	@override String get sessionSummaryTitle => 'Sesión completada';
	@override String get sessionReviewSummaryTitle => 'Repaso completado';
	@override String sessionScore({required Object correct, required Object total}) => '${correct} de ${total} correctas';
	@override String get sessionPerfect => '¡Perfecto! Sin fallos.';
	@override String get sessionMistakesTitle => 'Para repasar';
	@override String sessionReviewMistakes({required Object count}) => 'Repasar fallos (${count})';
	@override String get sessionNew => 'Nueva sesión';
	@override String get sessionExit => 'Terminar';
	@override String get practiceWhat => 'Qué practicar';
	@override String get practiceRowsBasic => 'Básicos';
	@override String get practiceRowsDakuten => 'Dakuten';
	@override String get practiceRowsCombos => 'Combinaciones';
	@override String get practiceSelectAll => 'Todos';
	@override String practiceItemsCount({required Object count}) => '${count} caracteres';
	@override String get practiceNotDrawable => 'Las combinaciones y la katakana con dakuten no se pueden dibujar, así que se omiten en el modo dibujo.';
	@override String get practiceNothingToDraw => 'Ninguno de los caracteres elegidos se puede dibujar. Elige otras filas o una dificultad menor.';
	@override String get practiceSessionLength => 'Preguntas por sesión';
	@override String get practiceSource => 'Preguntas de';
	@override String get practiceSourceAll => 'Todo';
	@override String practiceSourceMistakes({required Object count}) => 'Mis fallos (${count})';
	@override String get kanjiQuizMode => 'Preguntar por';
	@override String get kanjiModeMeaning => 'Significado';
	@override String get kanjiModeReading => 'Lectura';
	@override String get statsMasteryTitle => 'Dominio';
	@override String get statsMasterySubtitle => 'Dominas un carácter al acertarlo 3 veces seguidas.';
	@override String statsMasteredCount({required Object mastered, required Object total}) => '${mastered} de ${total} dominados';
	@override String get statsLegendMastered => 'Dominado';
	@override String get statsLegendLearning => 'Aprendiendo';
	@override String get statsLegendWeak => 'Por repasar';
	@override String get statsLegendNew => 'Sin ver';
	@override String get statsWeakest => 'Por repasar';
	@override String get learnDakutenTitle => 'Dakuten';
	@override String get learnCombosTitle => 'Combinaciones';
	@override String get settingsBackupImportConfirm => 'Importar sustituye todas tus estadísticas actuales. ¿Continuar?';
	@override String get dictionaryEnglishNote => 'Los resultados vienen de Jisho.org y están en inglés.';
	@override String get dictionaryError => 'No se pudo buscar. Revisa tu conexión e inténtalo de nuevo.';
	@override String materialsScore({required Object correct, required Object total}) => '${correct} / ${total} correctas';
	@override String get materialsClear => 'Quitar lista';
	@override String get premiumBenefitJlpt => 'Todos los niveles JLPT (N4–N1)';
	@override String get settingsThemeTitle => 'Apariencia';
	@override String get settingsThemeSubtitle => 'Claro, oscuro o según el sistema.';
	@override String get settingsThemeSystem => 'Automático';
	@override String get settingsThemeLight => 'Claro';
	@override String get settingsThemeDark => 'Oscuro';
	@override String get reminderChannelName => 'Recordatorio diario';
	@override String get reminderChannelDescription => 'Un aviso a las 19:00 si ese día aún no has practicado.';
	@override String get reminderStreakTitle => '🔥 ¡No pierdas tu racha!';
	@override String reminderStreakBody({required Object days}) => 'Llevas ${days} días seguidos. Practica unos minutos hoy para mantenerla.';
	@override String get reminderSecondDayTitle => '🔥 Suma tu segundo día';
	@override String get reminderSecondDayBody => 'Ayer practicaste. Repite hoy y empieza una racha.';
	@override String get reminderComebackTitle => '¿Unos minutos de japonés?';
	@override String get reminderComebackBody => 'Tus kana te esperan. Una sesión corta y empiezas una racha nueva.';
	@override String get reminderLastTitle => 'Te echamos de menos 👋';
	@override String get reminderLastBody => 'Vuelve cuando quieras: un repaso de 5 minutos ya cuenta.';
	@override String get settingsReminderTitle => 'Recordatorio diario';
	@override String get settingsReminderSubtitle => 'Te avisa a las 19:00 si ese día aún no has practicado.';
	@override String get settingsReminderBlocked => 'Las notificaciones de KanaGo están desactivadas. Actívalas en los ajustes del sistema.';
	@override String get settingsAdPrivacyTitle => 'Privacidad de anuncios';
	@override String get settingsAdPrivacySubtitle => 'Cambia tu consentimiento para los anuncios personalizados.';
}

// Path: exam
class _Translations$exam$es implements Translations$exam$en {
	_Translations$exam$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get tab => 'Examen';
	@override String get hubTitle => 'Simulador JLPT N5';
	@override String get hubSubtitle => 'Exámenes con el mismo formato que el real';
	@override String get daysLeft => 'días para el examen';
	@override String get examsToday => 'exámenes hoy';
	@override String get questionsSeen => 'preguntas vistas';
	@override String get fullExam => 'Examen completo';
	@override String get fullExamSubtitle => '20 + 40 + 30 min · 67 preguntas';
	@override String sectionCardSubtitle({required Object minutes, required Object count}) => '${minutes} min · ${count} preguntas';
	@override String get progressTitle => 'Evolución (examen completo)';
	@override String get weakPoints => 'Puntos débiles';
	@override String weakPointsSubtitle({required Object count}) => 'Aciertos por tipo de pregunta en tus últimos ${count} exámenes';
	@override String get history => 'Historial';
	@override String historyFullDetail({required Object date, required Object language, required Object listening}) => '${date} · Lenguaje ${language}/120 · Comprensión auditiva ${listening}/60';
	@override late final _Translations$exam$sections$es sections = _Translations$exam$sections$es._(_root);
	@override late final _Translations$exam$mondai$es mondai = _Translations$exam$mondai$es._(_root);
	@override String get createError => 'No se pudo crear el examen.';
	@override String get leaveTitle => '¿Salir del examen?';
	@override String get leaveBody => 'Se perderán las respuestas de este examen.';
	@override String get keepGoing => 'Seguir';
	@override String get leave => 'Salir';
	@override String sectionOf({required Object current, required Object total}) => 'Sección ${current} de ${total}';
	@override String sectionInfo({required Object minutes, required Object count}) => '${minutes} minutos · ${count} preguntas';
	@override String get listeningIntro => 'El audio avanza solo y se oye una sola vez, como en el examen. Responde mientras dura la pausa después de cada pregunta. Usa auriculares.';
	@override String get writtenIntro => 'Puedes moverte libremente entre las preguntas. Al acabarse el tiempo, la sección se entrega sola.';
	@override String get start => 'Empezar';
	@override String get timeUp => 'Se acabó el tiempo';
	@override String get submitTitle => '¿Entregar la sección?';
	@override String get submitAllAnswered => 'Has respondido todas las preguntas.';
	@override String submitUnanswered({required Object count}) => 'Preguntas sin responder: ${count}.';
	@override String get submit => 'Entregar';
	@override String get previous => 'Anterior';
	@override String get next => 'Siguiente';
	@override String questionOf({required Object current, required Object total}) => 'Pregunta ${current} de ${total}';
	@override String get resultTitle => 'Resultado';
	@override String get reviewAnswers => 'Revisar respuestas';
	@override String get back => 'Volver';
	@override String get passed => 'Aprobado';
	@override String get failed => 'Suspenso';
	@override String get scoreNote => 'Puntuación estimada: cada pregunta vale lo mismo. Para aprobar hacen falta 80/180 y un mínimo de 38 y 19 en cada parte.';
	@override String correctOf({required Object correct, required Object total}) => '${correct} de ${total} correctas';
	@override String get listeningHint => 'Mínimo para no suspender la comprensión auditiva: 19/60 (32 %). Para ir con margen, apunta a más del 60 %.';
	@override String get languageHint => 'Mínimo de la parte de lenguaje: 38/120 (32 %). Para ir con margen, apunta a más del 60 %.';
	@override String get reviewTitle => 'Revisión';
	@override String get onlyMistakes => 'Solo fallos';
	@override String get noMistakes => '¡Ningún fallo!';
	@override String get unanswered => 'Sin responder';
	@override String get correct => 'Correcta';
	@override String get incorrect => 'Incorrecta';
	@override String get translation => 'Traducción';
	@override String get showTextTranslation => 'Ver traducción del texto';
	@override String get hideTextTranslation => 'Ocultar traducción del texto';
	@override String get listen => 'Escuchar';
	@override String get stop => 'Parar';
	@override String get instructions => 'Instrucciones';
	@override String get listening => 'Escuchando…';
	@override String answerNow({required Object seconds}) => 'Responde · ${seconds} s';
	@override String get paused => 'En pausa';
	@override String get resume => 'Continuar';
	@override String get pause => 'Pausa';
}

// Path: exam.sections
class _Translations$exam$sections$es implements Translations$exam$sections$en {
	_Translations$exam$sections$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get vocabulary => 'Vocabulario y escritura';
	@override String get grammarReading => 'Gramática y lectura';
	@override String get listening => 'Comprensión auditiva';
}

// Path: exam.mondai
class _Translations$exam$mondai$es implements Translations$exam$mondai$en {
	_Translations$exam$mondai$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get kanjiReading => 'Lectura de kanji';
	@override String get orthography => 'Escritura';
	@override String get contextual => 'Vocabulario en contexto';
	@override String get paraphrase => 'Paráfrasis';
	@override String get grammarForm => 'Forma gramatical';
	@override String get sentenceOrder => 'Ordenar la frase';
	@override String get textGrammar => 'Gramática del texto';
	@override String get shortReading => 'Texto corto';
	@override String get midReading => 'Texto medio';
	@override String get infoSearch => 'Búsqueda de información';
	@override String get taskListening => 'Comprensión de tareas';
	@override String get pointListening => 'Comprensión de puntos clave';
	@override String get utterance => 'Expresión oral';
	@override String get quickResponse => 'Respuesta inmediata';
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.studyHubTitle' => 'Centro de estudio',
			'app.studyHubSubtitle' => 'Elige tu escritura y empieza a aprender o practicar.',
			'app.paths' => 'Rutas',
			'app.script' => 'Escritura',
			'app.difficulty' => 'Dificultad',
			'app.difficultyEasy' => 'Fácil',
			'app.difficultyMedium' => 'Media',
			'app.difficultyHard' => 'Difícil',
			'app.difficultyEasyDesc' => 'Opción única',
			'app.difficultyMediumDesc' => 'Texto',
			'app.difficultyHardDesc' => 'Dibujo',
			'app.learn' => 'Aprender',
			'app.learnSubtitle' => 'Explora caracteres y pistas de trazos.',
			'app.practice' => 'Practicar',
			'app.practiceSubtitle' => 'Reconocimiento, escritura y dibujo.',
			'app.materials' => 'Materiales',
			'app.materialsSubtitle' => 'Importa un CSV con tus propios datos.',
			'app.dictionary' => 'Diccionario',
			'app.dictionarySubtitle' => 'Busca palabras, kana y significados al instante.',
			'app.statistics' => 'Estadísticas',
			'app.statisticsSubtitle' => 'Consistencia, precisión y ritmo por tipo de kana.',
			'app.settings' => 'Ajustes',
			'app.learningDefaults' => 'Preferencias de estudio',
			'app.testDifficulty' => 'Dificultad del test',
			'app.testDifficultySubtitle' => 'Elige la dificultad para las prácticas.',
			'app.importCsv' => 'Importar CSV',
			'app.expectedFormatTitle' => 'Formato esperado',
			'app.expectedFormatBody' => 'Encabezados recomendados:\n\nIdioma | Romaji | Hiragana | Katakana | Kanji.\n\nPuedes mapear cualquier columna como pregunta o respuesta. CSV separado por comas.',
			'app.fileLabel' => ({required Object name, required Object count}) => 'Archivo: ${name} (${count} filas)',
			'app.askWith' => 'Preguntar con',
			'app.answerWith' => 'Responder con',
			'app.newQuestion' => 'Nueva pregunta',
			'app.checkAnswer' => 'Comprobar',
			'app.materialsEmpty' => 'Importa un CSV y pulsa "Nueva pregunta" para empezar.',
			'app.showAnswer' => 'Mostrar respuesta',
			'app.answerPrefix' => ({required Object answer}) => 'Respuesta: ${answer}',
			'app.beginSession' => 'Empezar sesión',
			'app.practiceStartSubtitle' => 'Comienza una nueva ronda y mantén la racha.',
			'app.testStayFocused' => 'Concéntrate y envía cuando estés listo.',
			'app.testSketchHint' => 'Dibuja dentro del lienzo',
			'app.testTypeRomaji' => 'Escribe el romaji',
			'app.testTypeMeaning' => 'Escribe el significado',
			'app.testRomajiLabel' => 'Lectura en romaji',
			'app.testMeaningLabel' => 'Significado en español',
			'app.testTapToType' => 'Toca para escribir',
			'app.testDrawThe' => ({required Object script}) => 'Dibuja el ${script}',
			'app.testWhichIs' => ({required Object script}) => '¿Cuál es este ${script}?',
			'app.testKanjiMeaning' => '¿Significado de este kanji?',
			'app.statsNoDataTitle' => 'Sin estadísticas',
			'app.statsNoDataSubtitle' => 'Completa algunos tests para desbloquear rachas y gráficos.',
			'app.statsReset' => 'Reiniciar estadísticas',
			'app.statsActivity' => 'Actividad diaria',
			'app.statsActivitySubtitle' => 'Últimos 14 días',
			'app.statsEvolution' => 'Evolución',
			'app.statsEvolutionSubtitle' => 'Correctas vs incorrectas',
			'app.statsNoEvolution' => 'Sin datos de evolución.',
			'app.statsNoActivity' => 'Sin actividad aún.',
			'app.statsAccuracy' => 'Precisión',
			'app.statsStreak' => 'Racha',
			'app.statsLast7' => 'Últimos 7 días',
			'app.statsLast30' => 'Últimos 30 días',
			'app.statsSessions' => 'sesiones',
			'app.statsBest' => ({required Object days}) => 'Mejor ${days} días',
			'app.statsCorrect' => ({required Object correct, required Object total}) => '${correct} / ${total} correctas',
			'app.statsCorrectLabel' => 'Correctas',
			'app.statsIncorrectLabel' => 'Incorrectas',
			'app.statsMomentum' => 'Momentum',
			'app.statsView' => 'Ver estadísticas',
			'app.statsStartToUnlock' => 'Empieza una práctica para desbloquear tus estadísticas.',
			'app.dictionaryEmpty' => 'Empieza a buscar una palabra.',
			'app.searchHint' => 'Buscar palabra, kana, romaji...',
			'app.correct' => '¡Correcto!',
			'app.incorrect' => 'Respuesta incorrecta',
			'app.oops' => 'Ups, fallaste...',
			'app.errorImporting' => ({required Object error}) => 'Error al importar: ${error}',
			'app.importedEntries' => ({required Object count, required Object file}) => 'Importadas ${count} entradas desde ${file}',
			'app.noValidRows' => 'No se encontraron filas válidas.',
			'app.dataNotFound' => 'No hay datos en el CSV.',
			'app.materialsNeedImport' => 'Importa un CSV y elige columnas antes de practicar.',
			'app.materialsNeedStart' => 'Primero inicia una pregunta con tu material.',
			'app.language' => 'Idioma',
			'app.languageSubtitle' => 'Elige el idioma de la app.',
			'app.back' => 'Atrás',
			'app.ok' => 'OK',
			'app.yourAnswer' => 'Tu respuesta',
			'app.statsStreakDays' => ({required Object days}) => 'Racha de ${days} días',
			'app.statsAttempts' => 'intentos',
			'app.scriptHiragana' => 'Hiragana',
			'app.scriptKatakana' => 'Katakana',
			'app.scriptKanji' => 'Kanji',
			'app.testModeDrawing' => 'Dibujo',
			'app.testModeQuiz' => 'Quiz',
			'app.dictionaryNotes' => 'Notas',
			'app.dictionarySeeAlso' => 'Ver también',
			'app.confirmActionTitle' => 'Confirmar acción',
			'app.confirmActionBody' => '¿Seguro que quieres borrar TODAS las estadísticas?',
			'app.cancel' => 'Cancelar',
			'app.delete' => 'Eliminar',
			'app.searchByMeaning' => 'Buscar por significado',
			'app.filterAll' => 'Todo',
			'app.tabStudy' => 'Estudio',
			'app.tabStats' => 'Estadísticas',
			'app.settingsHapticsTitle' => 'Vibración',
			'app.settingsHapticsSubtitle' => 'Vibra al acertar o fallar.',
			'app.settingsKanaSizeTitle' => 'Tamaño del kana',
			'app.settingsKanaSizeSubtitle' => 'Ajusta el tamaño de los kana en la interfaz.',
			'app.settingsKanaSizeValue' => ({required Object value}) => '${value}x',
			'app.settingsKanjiJlptTitle' => 'Nivel JLPT kanji',
			'app.settingsKanjiJlptSubtitle' => 'Limita los kanji a un nivel JLPT.',
			'app.settingsUseModelHiraganaTitle' => 'Modelo IA de hiragana',
			'app.settingsUseModelHiraganaSubtitle' => 'Usar reconocimiento por modelo en dibujo de hiragana.',
			'app.settingsUseModelKatakanaTitle' => 'Modelo IA de katakana',
			'app.settingsUseModelKatakanaSubtitle' => 'Usar reconocimiento por modelo en dibujo de katakana.',
			'app.settingsUseModelKanjiTitle' => 'Modelo IA de kanji',
			'app.settingsUseModelKanjiSubtitle' => 'Usar reconocimiento por modelo en dibujo de kanji.',
			'app.kanjiFilterEmpty' => 'No hay kanji para este nivel JLPT.',
			'app.settingsBackupTitle' => 'Copia de estadísticas',
			'app.settingsBackupSubtitle' => 'Exporta o importa tu progreso en un archivo JSON.',
			'app.settingsBackupExportButton' => 'Exportar',
			'app.settingsBackupImportButton' => 'Importar',
			'app.settingsBackupExported' => ({required Object path}) => 'Copia exportada en ${path}',
			'app.settingsBackupImported' => ({required Object count}) => 'Importadas ${count} respuestas',
			'app.settingsBackupError' => ({required Object error}) => 'Error de copia: ${error}',
			'app.settingsGeneralSection' => 'General',
			'app.settingsAiModelsSection' => 'Modelos IA',
			'app.settingsKanjiFilterSection' => 'Kanji',
			'app.settingsDataSection' => 'Datos',
			'app.testGuideShow' => 'Mostrar guía',
			'app.testGuideHide' => 'Ocultar guía',
			'app.testReportDrawing' => 'Reportar dibujo',
			'app.testReportConfirmBody' => '¿Quieres enviar este informe ahora?',
			'app.testReportThanks' => 'Gracias. Informe preparado para revisar.',
			'app.testReportError' => 'No se pudo preparar el informe.',
			'app.testKanjiTraceHint' => 'Sigue el orden de trazos. Activa la guía si la necesitas.',
			'app.aiInfoTitle' => 'Modelos de IA en dibujo',
			'app.aiInfoLine1' => 'El reconocimiento de IA puede fallar ocasionalmente.',
			'app.aiInfoLine2' => 'Si falla, desactiva el modelo para usar una evaluación basada en trazos.',
			'app.aiInfoLine3' => 'Puedes reportar falsos negativos para ayudarnos a mejorarlo.',
			'app.premiumSectionTitle' => 'Premium',
			'app.premiumSectionSubtitle' => 'Desbloquea todas las funciones y elimina anuncios.',
			'app.premiumOpenButton' => 'Mejorar',
			'app.premiumLockedMessage' => 'Función premium. Mejora para desbloquearla.',
			'app.premiumTitle' => 'KanaGo Premium',
			'app.premiumSubtitle' => 'Compra única, todas las funciones desbloqueadas.',
			'app.premiumHeroTitle' => 'Aprende sin límites',
			'app.premiumHeroBody' => 'Consigue la experiencia completa y apoya el proyecto.',
			'app.premiumBenefitNoAds' => 'Sin anuncios',
			'app.premiumBenefitMaterials' => 'Acceso al modo Material',
			'app.premiumBenefitHard' => 'Dificultad alta disponible',
			'app.premiumBenefitAi' => 'Opciones de modelos IA',
			'app.premiumBenefitBackup' => 'Exportar/importar estadísticas',
			'app.premiumBuyButton' => ({required Object price}) => 'Comprar por ${price}',
			'app.premiumRestoreButton' => 'Restaurar compras',
			'app.premiumOwnedBadge' => 'Premium desbloqueado',
			'app.premiumStoreUnavailable' => 'Tienda no disponible. Inténtalo más tarde.',
			'app.premiumPurchaseError' => ({required Object error}) => 'Compra fallida: ${error}',
			'app.premiumPurchased' => 'Compra completada. Premium desbloqueado.',
			'app.premiumRestored' => 'Compras restauradas.',
			'app.testNext' => 'Siguiente',
			'app.testCorrectAnswerWas' => ({required Object answer}) => 'Respuesta correcta: ${answer}',
			'app.testQuestionProgress' => ({required Object current, required Object total}) => 'Pregunta ${current} de ${total}',
			'app.testKanjiReading' => '¿Cómo se lee este kanji?',
			'app.testTypeReading' => 'Escribe la lectura (kana o romaji)',
			'app.sessionSummaryTitle' => 'Sesión completada',
			'app.sessionReviewSummaryTitle' => 'Repaso completado',
			'app.sessionScore' => ({required Object correct, required Object total}) => '${correct} de ${total} correctas',
			'app.sessionPerfect' => '¡Perfecto! Sin fallos.',
			'app.sessionMistakesTitle' => 'Para repasar',
			'app.sessionReviewMistakes' => ({required Object count}) => 'Repasar fallos (${count})',
			'app.sessionNew' => 'Nueva sesión',
			'app.sessionExit' => 'Terminar',
			'app.practiceWhat' => 'Qué practicar',
			'app.practiceRowsBasic' => 'Básicos',
			'app.practiceRowsDakuten' => 'Dakuten',
			'app.practiceRowsCombos' => 'Combinaciones',
			'app.practiceSelectAll' => 'Todos',
			'app.practiceItemsCount' => ({required Object count}) => '${count} caracteres',
			'app.practiceNotDrawable' => 'Las combinaciones y la katakana con dakuten no se pueden dibujar, así que se omiten en el modo dibujo.',
			'app.practiceNothingToDraw' => 'Ninguno de los caracteres elegidos se puede dibujar. Elige otras filas o una dificultad menor.',
			'app.practiceSessionLength' => 'Preguntas por sesión',
			'app.practiceSource' => 'Preguntas de',
			'app.practiceSourceAll' => 'Todo',
			'app.practiceSourceMistakes' => ({required Object count}) => 'Mis fallos (${count})',
			'app.kanjiQuizMode' => 'Preguntar por',
			'app.kanjiModeMeaning' => 'Significado',
			'app.kanjiModeReading' => 'Lectura',
			'app.statsMasteryTitle' => 'Dominio',
			'app.statsMasterySubtitle' => 'Dominas un carácter al acertarlo 3 veces seguidas.',
			'app.statsMasteredCount' => ({required Object mastered, required Object total}) => '${mastered} de ${total} dominados',
			'app.statsLegendMastered' => 'Dominado',
			'app.statsLegendLearning' => 'Aprendiendo',
			'app.statsLegendWeak' => 'Por repasar',
			'app.statsLegendNew' => 'Sin ver',
			'app.statsWeakest' => 'Por repasar',
			'app.learnDakutenTitle' => 'Dakuten',
			'app.learnCombosTitle' => 'Combinaciones',
			'app.settingsBackupImportConfirm' => 'Importar sustituye todas tus estadísticas actuales. ¿Continuar?',
			'app.dictionaryEnglishNote' => 'Los resultados vienen de Jisho.org y están en inglés.',
			'app.dictionaryError' => 'No se pudo buscar. Revisa tu conexión e inténtalo de nuevo.',
			'app.materialsScore' => ({required Object correct, required Object total}) => '${correct} / ${total} correctas',
			'app.materialsClear' => 'Quitar lista',
			'app.premiumBenefitJlpt' => 'Todos los niveles JLPT (N4–N1)',
			'app.settingsThemeTitle' => 'Apariencia',
			'app.settingsThemeSubtitle' => 'Claro, oscuro o según el sistema.',
			'app.settingsThemeSystem' => 'Automático',
			'app.settingsThemeLight' => 'Claro',
			'app.settingsThemeDark' => 'Oscuro',
			'app.reminderChannelName' => 'Recordatorio diario',
			'app.reminderChannelDescription' => 'Un aviso a las 19:00 si ese día aún no has practicado.',
			'app.reminderStreakTitle' => '🔥 ¡No pierdas tu racha!',
			'app.reminderStreakBody' => ({required Object days}) => 'Llevas ${days} días seguidos. Practica unos minutos hoy para mantenerla.',
			'app.reminderSecondDayTitle' => '🔥 Suma tu segundo día',
			'app.reminderSecondDayBody' => 'Ayer practicaste. Repite hoy y empieza una racha.',
			'app.reminderComebackTitle' => '¿Unos minutos de japonés?',
			'app.reminderComebackBody' => 'Tus kana te esperan. Una sesión corta y empiezas una racha nueva.',
			'app.reminderLastTitle' => 'Te echamos de menos 👋',
			'app.reminderLastBody' => 'Vuelve cuando quieras: un repaso de 5 minutos ya cuenta.',
			'app.settingsReminderTitle' => 'Recordatorio diario',
			'app.settingsReminderSubtitle' => 'Te avisa a las 19:00 si ese día aún no has practicado.',
			'app.settingsReminderBlocked' => 'Las notificaciones de KanaGo están desactivadas. Actívalas en los ajustes del sistema.',
			'app.settingsAdPrivacyTitle' => 'Privacidad de anuncios',
			'app.settingsAdPrivacySubtitle' => 'Cambia tu consentimiento para los anuncios personalizados.',
			'exam.tab' => 'Examen',
			'exam.hubTitle' => 'Simulador JLPT N5',
			'exam.hubSubtitle' => 'Exámenes con el mismo formato que el real',
			'exam.daysLeft' => 'días para el examen',
			'exam.examsToday' => 'exámenes hoy',
			'exam.questionsSeen' => 'preguntas vistas',
			'exam.fullExam' => 'Examen completo',
			'exam.fullExamSubtitle' => '20 + 40 + 30 min · 67 preguntas',
			'exam.sectionCardSubtitle' => ({required Object minutes, required Object count}) => '${minutes} min · ${count} preguntas',
			'exam.progressTitle' => 'Evolución (examen completo)',
			'exam.weakPoints' => 'Puntos débiles',
			'exam.weakPointsSubtitle' => ({required Object count}) => 'Aciertos por tipo de pregunta en tus últimos ${count} exámenes',
			'exam.history' => 'Historial',
			'exam.historyFullDetail' => ({required Object date, required Object language, required Object listening}) => '${date} · Lenguaje ${language}/120 · Comprensión auditiva ${listening}/60',
			'exam.sections.vocabulary' => 'Vocabulario y escritura',
			'exam.sections.grammarReading' => 'Gramática y lectura',
			'exam.sections.listening' => 'Comprensión auditiva',
			'exam.mondai.kanjiReading' => 'Lectura de kanji',
			'exam.mondai.orthography' => 'Escritura',
			'exam.mondai.contextual' => 'Vocabulario en contexto',
			'exam.mondai.paraphrase' => 'Paráfrasis',
			'exam.mondai.grammarForm' => 'Forma gramatical',
			'exam.mondai.sentenceOrder' => 'Ordenar la frase',
			'exam.mondai.textGrammar' => 'Gramática del texto',
			'exam.mondai.shortReading' => 'Texto corto',
			'exam.mondai.midReading' => 'Texto medio',
			'exam.mondai.infoSearch' => 'Búsqueda de información',
			'exam.mondai.taskListening' => 'Comprensión de tareas',
			'exam.mondai.pointListening' => 'Comprensión de puntos clave',
			'exam.mondai.utterance' => 'Expresión oral',
			'exam.mondai.quickResponse' => 'Respuesta inmediata',
			'exam.createError' => 'No se pudo crear el examen.',
			'exam.leaveTitle' => '¿Salir del examen?',
			'exam.leaveBody' => 'Se perderán las respuestas de este examen.',
			'exam.keepGoing' => 'Seguir',
			'exam.leave' => 'Salir',
			'exam.sectionOf' => ({required Object current, required Object total}) => 'Sección ${current} de ${total}',
			'exam.sectionInfo' => ({required Object minutes, required Object count}) => '${minutes} minutos · ${count} preguntas',
			'exam.listeningIntro' => 'El audio avanza solo y se oye una sola vez, como en el examen. Responde mientras dura la pausa después de cada pregunta. Usa auriculares.',
			'exam.writtenIntro' => 'Puedes moverte libremente entre las preguntas. Al acabarse el tiempo, la sección se entrega sola.',
			'exam.start' => 'Empezar',
			'exam.timeUp' => 'Se acabó el tiempo',
			'exam.submitTitle' => '¿Entregar la sección?',
			'exam.submitAllAnswered' => 'Has respondido todas las preguntas.',
			'exam.submitUnanswered' => ({required Object count}) => 'Preguntas sin responder: ${count}.',
			'exam.submit' => 'Entregar',
			'exam.previous' => 'Anterior',
			'exam.next' => 'Siguiente',
			'exam.questionOf' => ({required Object current, required Object total}) => 'Pregunta ${current} de ${total}',
			'exam.resultTitle' => 'Resultado',
			'exam.reviewAnswers' => 'Revisar respuestas',
			'exam.back' => 'Volver',
			'exam.passed' => 'Aprobado',
			'exam.failed' => 'Suspenso',
			'exam.scoreNote' => 'Puntuación estimada: cada pregunta vale lo mismo. Para aprobar hacen falta 80/180 y un mínimo de 38 y 19 en cada parte.',
			'exam.correctOf' => ({required Object correct, required Object total}) => '${correct} de ${total} correctas',
			'exam.listeningHint' => 'Mínimo para no suspender la comprensión auditiva: 19/60 (32 %). Para ir con margen, apunta a más del 60 %.',
			'exam.languageHint' => 'Mínimo de la parte de lenguaje: 38/120 (32 %). Para ir con margen, apunta a más del 60 %.',
			'exam.reviewTitle' => 'Revisión',
			'exam.onlyMistakes' => 'Solo fallos',
			'exam.noMistakes' => '¡Ningún fallo!',
			'exam.unanswered' => 'Sin responder',
			'exam.correct' => 'Correcta',
			'exam.incorrect' => 'Incorrecta',
			'exam.translation' => 'Traducción',
			'exam.showTextTranslation' => 'Ver traducción del texto',
			'exam.hideTextTranslation' => 'Ocultar traducción del texto',
			'exam.listen' => 'Escuchar',
			'exam.stop' => 'Parar',
			'exam.instructions' => 'Instrucciones',
			'exam.listening' => 'Escuchando…',
			'exam.answerNow' => ({required Object seconds}) => 'Responde · ${seconds} s',
			'exam.paused' => 'En pausa',
			'exam.resume' => 'Continuar',
			'exam.pause' => 'Pausa',
			_ => null,
		};
	}
}
