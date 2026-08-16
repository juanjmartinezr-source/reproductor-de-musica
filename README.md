# Reproductor de Música

Reproductor de Música es un proyecto starter en Flutter para un reproductor de audio local multiplataforma (Android + iOS), inspirado en la interfaz limpia y minimalista de Oto Music. Esta rama `main` contiene la documentación principal; el andamiaje inicial y los archivos de código se encuentran en la rama `feat/starter-scaffold`.

Estado actual (esta PR inicial)

- Scaffold Flutter con estructura MVVM-like usando Riverpod.
- Dependencias clave incluidas en el scaffold: just_audio, audio_service, audio_session, flutter_riverpod, dio, hive, hive_flutter, cached_network_image, permission_handler, flutter_localizations, intl.
- Pantallas mínimas: Biblioteca (escaneo demo), Reproduciendo ahora (Now Playing), Mini-player.
- i18n: ARB para español (por defecto), inglés y portugués.
- Configuración solicitada: Android minSdkVersion = 24, iOS deployment target = 12.0.

Objetivo

Este README documenta cómo ejecutar y probar la versión inicial del scaffold para que el equipo pueda iterar y añadir funcionalidades avanzadas: letras sincronizadas, portada automática, playlists, cola persistente, ajustes de idioma/tema y más.

Cómo ejecutar (rápido)

1. Clona el repositorio y cámbiate a la rama del scaffold (opcional, puedes probar desde `main`):

```bash
git clone https://github.com/juanjmartinezr-source/reproductor-de-musica.git
git checkout feat/starter-scaffold
```

2. Instala dependencias:

```bash
flutter pub get
```

3. Ejecuta en un dispositivo Android (o iOS tras ajustes):

```bash
flutter run
```

Notas para probar la demo

- El escaneo de archivos en esta versión demo busca ` /sdcard/Music ` (Android). Asegúrate de que tu emulador o dispositivo tenga archivos `.mp3` en esa ruta o modifica `lib/src/data/repositories/media_repository.dart` para usar otra ruta o el MediaStore.
- Los permisos de lectura (READ_MEDIA_AUDIO / READ_EXTERNAL_STORAGE) han sido añadidos como snippets en el scaffold; la petición de permisos en tiempo de ejecución se integrará en próximas PRs con `permission_handler`.
- El manejo completo del servicio en background (audio_service) y la gestión avanzada de la cola están preparados en la estructura pero serán implementados en PRs separadas.

Roadmap (issues principales)

- Letras sincronizadas (LRCLIB) — prioridad alta.
- Arte de álbum automático (Deezer / iTunes).
- Playlists y gestión de cola.
- Pantalla de Ajustes (idioma + tema).
- Opción de traducir letras.

Cómo contribuir

- Revisa las issues abiertas y toma tareas pequeñas para iterar rápido.
- Ejecuta `flutter format` antes de enviar PRs y añade pruebas cuando sea posible.
- Usa la rama `feat/*` para nuevas funcionalidades y abre PRs dirigidos a `main`.

Más información

- Andamiaje y archivos de ejemplo están en la rama `feat/starter-scaffold`.
- Para cualquier duda sobre el scaffold, abre una issue en este repositorio y etiqueta al equipo.

