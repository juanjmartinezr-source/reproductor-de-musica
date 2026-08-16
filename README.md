# Reproductor de Música — Starter Scaffold

Este repositorio contiene el andamiaje inicial (starter scaffold) para una aplicación de reproductor de música multiplataforma construida en Flutter, inspirada en la interfaz limpia y minimalista de Oto Music.

Estado actual (esta PR inicial)

- Proyecto Flutter configurado para Android e iOS con dependencias clave:
  - just_audio, audio_service, audio_session — reproducción y servicio en background
  - flutter_riverpod — estado
  - dio — clientes HTTP
  - hive + hive_flutter — caché local y persistencia ligera
  - cached_network_image — cache de imágenes de portada
  - permission_handler — permisos de almacenamiento / media
  - flutter_localizations + intl — i18n desde el inicio
- Estructura base de carpetas (MVVM-ish usando Riverpod):
  - lib/src/core — tema, app router, punto de entrada
  - lib/src/data — modelos y repositorios (media repo de ejemplo)
  - lib/src/providers — providers de Riverpod
  - lib/src/ui — pantallas y widgets
  - lib/l10n — archivos ARB (es/en/pt)
- UI mínima funcional:
  - Pantalla Biblioteca (escanea /sdcard/Music para demo en Android)
  - Pantalla Reproduciendo ahora (Now Playing) con seek bar y controles básicos
  - Mini-player en la parte inferior
- Archivos y configuración iniciales:
  - README.md (este archivo)
  - pubspec.yaml con las dependencias listadas arriba
  - Android minSdkVersion = 24, iOS deployment target = 12.0

Objetivo del scaffold

El propósito de este PR inicial es entregar una base compilable que se pueda ejecutar con `flutter run` en Android (y en iOS con ajustes menores), y proveer el esqueleto sobre el que se desarrollarán las funcionalidades avanzadas: letras sincronizadas, búsqueda/descarga de portadas, listas de reproducción, persistencia de cola, ajustes de idioma/tema, etc.

Cómo ejecutar localmente

1. Instalar Flutter (canal estable) con Dart >= 3.0.0.
2. Clonar el repositorio y cambiar a la rama del scaffold:
   ```bash
   git clone https://github.com/juanjmartinezr-source/reproductor-de-musica.git
   git checkout feat/starter-scaffold
   ```
3. Obtener dependencias:
   ```bash
   flutter pub get
   ```
4. Ejecutar en Android (emulador o dispositivo físico):
   ```bash
   flutter run
   ```

Notas importantes para probar la demo

- La búsqueda de archivos local en esta versión demo revisa ` /sdcard/Music ` (Android). Asegúrate de que el emulador o dispositivo tenga archivos `.mp3` en esa ruta o ajusta `MediaRepository.scanLocalTracks()` para usar otra ruta o el MediaStore.
- Los permisos de lectura (READ_MEDIA_AUDIO / READ_EXTERNAL_STORAGE) han sido añadidos como snippets; en la siguiente iteración integraré la petición de permisos con `permission_handler` y el flujo de escaneo seguro.
- La lógica de audio está preparada para integrarse con `just_audio` y `audio_service`, pero el manejo completo de la cola y el servicio en background se implementará en PRs posteriores.

Decisiones técnicas y por qué

- Hive: elegido por su simplicidad y fácil integración con Flutter para caché ligera (letras, metadatos, configuraciones). Mínima sobrecarga para el MVP.
- Riverpod: gestión de estado moderna, testable y fácil de escalar para la arquitectura basada en providers/repositorios.
- just_audio + audio_service: combinación probada para reproducción local y background/lockscreen en Android e iOS.
- i18n desde el inicio: evitamos hardcodear strings; ARB + intl permiten agregar traducciones y cambiar idioma en futuro PR.

Estructura de carpetas (resumen)

- lib/
  - src/
    - core/ (MyApp, router, constantes)
    - data/
      - models/ (Track)
      - repositories/ (MediaRepository — demo)
    - providers/ (Riverpod providers)
    - ui/
      - screens/ (Library, NowPlaying)
      - widgets/ (SeekBar, MiniPlayer)
    - l10n/ (ARB files)

Próximos pasos (issues creados tras este PR)

1. Letras sincronizadas (LRCLIB): consulta a https://lrclib.net/api/get..., parser LRC, cache local, karaoke auto-scroll.
2. Arte de álbum automático: usar Deezer / iTunes Search API como respaldo cuando no haya artwork embebido.
3. Playlists y gestión de cola: crear/reordenar/persistir playlists y cola de reproducción.
4. Pantalla de Ajustes completa: selector de idioma, tema (light/dark/AMOLED), opciones de reproducción.
5. Opción traducir letras: mostrar letras originales y traducidas al idioma de UI.

Cómo contribuir

- Revisa las issues abiertas y asigna/crea PRs contra la rama `main` o nuestra rama de features.
- Ejecuta `flutter format` antes de enviar PRs y agrega tests básicos para la lógica (ej. parser LRC).

Contacto

Para dudas sobre el scaffold, responde en este hilo de PR o abre una issue.

---

Commit actual en la rama: feat/starter-scaffold
