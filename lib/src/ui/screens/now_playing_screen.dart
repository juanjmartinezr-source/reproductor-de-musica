// lib/src/ui/screens/now_playing_screen.dart
import 'package:flutter/material.dart';
import '../widgets/seek_bar.dart';
import '../../data/models/track.dart';

class NowPlayingScreen extends StatefulWidget {
  final Track? track;
  const NowPlayingScreen({super.key, this.track});

  static Route initial(Track track) => MaterialPageRoute(builder: (_) => NowPlayingScreen(track: track));

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  double _position = 0;
  double _duration = 100;

  @override
  Widget build(BuildContext context) {
    final title = widget.track?.title ?? 'No track';
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(child: Center(child: Text(title, style: Theme.of(context).textTheme.headlineSmall))),
            SeekBar(position: _position, duration: _duration, onChanged: (p) => setState(() => _position = p)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.skip_previous)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.play_arrow)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.skip_next)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
