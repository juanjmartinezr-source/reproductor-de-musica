// lib/src/ui/screens/library_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/media_provider.dart';
import '../../data/models/track.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lib = ref.watch(libraryProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Library')),
      body: lib.when(
        data: (tracks) => tracks.isEmpty
            ? Center(child: Text('No tracks found'))
            : ListView.builder(
                itemCount: tracks.length,
                itemBuilder: (context, i) => TrackTile(track: tracks[i]),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error loading library')),
      ),
      bottomNavigationBar: const SizedBox(height: 72, child: MiniPlayer()),
    );
  }
}

class TrackTile extends StatelessWidget {
  final Track track;
  const TrackTile({super.key, required this.track});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(track.title),
      subtitle: Text(track.artist),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => NowPlayingScreen.initial(track)));
      },
    );
  }
}

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Row(
        children: [
          const SizedBox(width: 8),
          const Expanded(child: Text('Nothing playing')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.play_arrow)),
        ],
      ),
    );
  }
}
