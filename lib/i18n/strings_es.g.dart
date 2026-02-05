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
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppEs app = _TranslationsAppEs._(_root);
}

// Path: app
class _TranslationsAppEs implements TranslationsAppEn {
	_TranslationsAppEs._(this._root);

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
			_ => null,
		};
	}
}
