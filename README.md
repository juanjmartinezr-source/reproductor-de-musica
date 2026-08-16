# Reproductor de Musica - Starter Scaffold

This repository contains a starter Flutter music player scaffold. The app is a minimal cross-platform player with background playback support and a responsive UI. It is the initial scaffold for the full project and is intended as a baseline to implement features such as synced lyrics and album art fetching.

## Features included in this scaffold

- Flutter project configured for Android + iOS
- Dependencies: just_audio, audio_service, audio_session, flutter_riverpod, dio, hive, hive_flutter, cached_network_image, permission_handler, flutter_localizations, intl
- MVVM-like structure using Riverpod
- Basic screens: Library (scans local media), Now Playing, Mini-player
- Background playback wiring via audio_service + just_audio
- i18n skeleton with ARB files for Spanish (default), English, Portuguese
- Responsive layout (two-pane on wide screens)
- Android & iOS permission entries in manifest/plist

## How to run

1. Install Flutter (stable) with Dart >=3.0.0
2. flutter pub get
3. flutter run (on Android device/emulator or iOS simulator/device)

## Next steps

Follow-up issues were created for:
1. Synced lyrics (LRCLIB)
2. Automatic album art (Deezer / iTunes)
3. Playlists & queue management
4. Full Settings screen (language + theme)
5. Translate-lyrics option
