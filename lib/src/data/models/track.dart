// lib/src/data/models/track.dart
class Track {
  final String id;
  final String title;
  final String artist;
  final String path;
  final int durationMs;

  Track({required this.id, required this.title, required this.artist, required this.path, required this.durationMs});
}
