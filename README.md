# Kana Master

**Kana Master** es una aplicación para aprender **Hiragana** y **Katakana** de forma interactiva. Con esta app, podrás visualizar la escritura de cada carácter, poner a prueba tus conocimientos con diferentes niveles de dificultad y mejorar con la ayuda de inteligencia artificial. 

##  Características

- **Modo de estudio** : Aprende Hiragana y Katakana viendo cómo se escriben.
- **Modo de test** : Comprueba tu conocimiento con tres niveles de dificultad:
  - **Fácil**: Se muestra un kana y el usuario elige la lectura correcta entre 4 opciones en romaji.
  - **Medio**: Se muestra un kana y el usuario debe escribir manualmente la lectura en romaji.
  - **Difícil**: Además de escribir la lectura en romaji, en algunas preguntas se pedirá dibujar el carácter.
- **Reconocimiento de escritura** : Se ha entrenado un modelo de **IA con Deep Learning** para reconocer los caracteres escritos a mano y validar si son correctos.
- **Estadísticas** : Lleva un registro de aciertos y errores para ver tu progreso.

##  Instalación

1. Clona este repositorio:
   ```bash
   git clone https://github.com/tu-usuario/kana-master.git
   ```
2. Accede a la carpeta del proyecto:
   ```bash
   cd kana-master
   ```
3. Instala las dependencias necesarias:
   ```bash
   flutter pub get
   ```
4. Ejecuta la app en un dispositivo o emulador:
   ```bash
   flutter run
   ```

##  Imágenes de entrenamiento

![image](https://github.com/user-attachments/assets/ad3a28d1-e67d-42f9-a445-b84789c7af33)

![image](https://github.com/user-attachments/assets/f3b50ee3-0dfa-4235-9463-30c780ca1d84)

##  Tecnologías Utilizadas

- **Flutter**  - Para la interfaz y funcionalidad.
- **TensorFlow / Keras**  - Para el modelo de IA de reconocimiento de escritura.
- **SQLite / SharedPreferences**  - Para guardar estadísticas de usuario.
