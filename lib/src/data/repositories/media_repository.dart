// lib/src/data/repositories/media_repository.dart
import 'dart:io';

import 'package:flutter/foundation.dart';
import '../models/track.dart';

class MediaRepository {
  Future<List<Track>> scanLocalTracks() async {
    // Very simplified: look for .mp3 files in app documents directory for demo purposes
    final dir = Directory('/sdcard/Music');
    if (!await dir.exists()) return [];
    final files = dir.listSync(recursive: true).whereType<File>().where((f) => f.path.endsWith('.mp3'));
    final tracks = <Track>[];
    for (final f in files) {
      tracks.add(Track(id: f.path, title: f.uri.pathSegments.last, artist: 'Unknown', path: f.path, durationMs: 0));
    }
    return tracks;
  }
}
