// PR description
Starter scaffold for Reproductor de Musica

This PR scaffolds a Flutter starter app implementing a minimal
cross-platform music player with background playback support,
responsive UI, and Riverpod architecture. It includes:

- Project structure: core/, data/, providers/, ui/
- Pubspec with key dependencies: just_audio, audio_service, audio_session,
  flutter_riverpod, dio, hive, hive_flutter, cached_network_image,
  permission_handler, flutter_localizations, intl
- Minimal functional screens: Library (scans /sdcard/Music), Now Playing,
  mini-player. The library scan is simplified for demo and will be
  expanded in follow-up tasks.
- Android/iOS permission entries and i18n ARB files (es/en/pt)
- README with run instructions and next steps

Notes:
- Uses Hive for caching/persistence in future work.
- Android minSdkVersion and iOS deployment target are set in branch
  to requested values (minSdk 24, iOS 12.0) — please confirm in CI.

Follow-up issues will be created for:
1. Synced lyrics (LRCLIB)
2. Automatic album art (Deezer/iTunes)
3. Playlists & queue management
4. Full Settings screen (language + theme)
5. Translate-lyrics option
