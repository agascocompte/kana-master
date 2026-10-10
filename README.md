# KanaGo

**KanaGo** es una aplicación para aprender **hiragana**, **katakana** y **kanji** de forma interactiva, disponible en 11 idiomas.

## Características

- **Aprender**: tablas de kana (con dakuten y combinaciones como きゃ) y kanji por nivel JLPT, con animación del orden de trazos.
- **Práctica por sesiones** de 10, 20 o 40 preguntas, con resumen final y repaso de fallos:
  - **Fácil**: elegir la respuesta correcta entre 4 opciones del mismo grupo.
  - **Medio**: escribir la respuesta. Acepta variantes de romanización (si/shi, tu/tsu…) y, para lecturas de kanji, kana o romaji.
  - **Difícil** (premium): dibujar el carácter. Se evalúa con un modelo de IA o comparando los trazos.
- **Qué practicar**: filas de kana, combinaciones, nivel JLPT, kanji por significado o por lectura, o solo los caracteres que fallas.
- **Repetición adaptativa**: cada respuesta guarda el carácter preguntado, y los que fallas o no has visto salen más a menudo.
- **Estadísticas**: precisión, racha, actividad, evolución y dominio por carácter.
- **Materiales** (premium): importa un CSV propio y practica con él. La lista se guarda.
- **Diccionario**: búsqueda en Jisho.org (resultados en inglés).
- **Copia de seguridad** (premium) de las estadísticas en JSON.

## Desarrollo

Requisitos: Flutter estable (3.47 o superior).

```bash
flutter pub get
flutter run
```

Código generado:

```bash
dart run slang                                         # traducciones (lib/i18n/*.i18n.json)
dart run build_runner build --delete-conflicting-outputs  # inyección de dependencias
```

Tests:

```bash
flutter test
```

### Estructura

- `lib/domain/quiz_engine.dart`: construcción de preguntas, corrección de respuestas y elección ponderada (Dart puro, con tests en `test/`).
- `lib/domain/kana_converter.dart`: conversión romaji ↔ kana.
- `lib/pages/test_kana/`: sesiones de práctica (bloc y widgets).
- `assets/i18n/kanji_*.json`: significados de los kanji por idioma (el principal primero).
- `assets/csv/kanji_data.csv`: kanji, lecturas y nivel JLPT.

## Publicación

Sube la versión en `pubspec.yaml` (`version: x.y.z+build`); el número de build debe ser mayor que el último subido a la tienda.

### iOS (en un Mac)

```bash
git pull
flutter clean && flutter pub get
cd ios && pod install --repo-update && cd ..
flutter build ios --release
```

Abre **`ios/Runner.xcworkspace`** (no el `.xcodeproj`), elige *Any iOS Device*, **Product → Archive** y **Distribute App → App Store Connect**.

### Android

La firma de release se lee de `android/key.properties` (no se sube al repositorio):

```properties
storeFile=/ruta/a/upload-keystore.jks
storePassword=...
keyAlias=upload
keyPassword=...
```

Sin ese fichero, la build de release se firma con la clave de debug.

```bash
flutter build appbundle
```

## Imágenes de entrenamiento

![image](https://github.com/user-attachments/assets/ad3a28d1-e67d-42f9-a445-b84789c7af33)

![image](https://github.com/user-attachments/assets/f3b50ee3-0dfa-4235-9463-30c780ca1d84)

## Tecnologías

- **Flutter** con BLoC, go_router, injectable y slang.
- **TensorFlow Lite** para reconocer la escritura a mano.
- **SQLite** (sqflite) para estadísticas y ajustes.
- **AdMob** e **In-App Purchase** para la monetización.
