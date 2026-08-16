// lib/src/providers/media_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/track.dart';
import '../data/repositories/media_repository.dart';

final mediaRepositoryProvider = Provider((ref) => MediaRepository());
final libraryProvider = FutureProvider<List<Track>>((ref) async {
  final repo = ref.read(mediaRepositoryProvider);
  return repo.scanLocalTracks();
});
