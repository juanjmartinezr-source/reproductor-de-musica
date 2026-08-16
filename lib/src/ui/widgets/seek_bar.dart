// lib/src/ui/widgets/seek_bar.dart
import 'package:flutter/material.dart';

class SeekBar extends StatelessWidget {
  final double position;
  final double duration;
  final ValueChanged<double> onChanged;
  const SeekBar({super.key, required this.position, required this.duration, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final pct = (duration <= 0) ? 0.0 : (position / duration).clamp(0.0, 1.0);
    return Column(
      children: [
        Slider(value: pct, onChanged: (v) => onChanged(v * duration)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(_format(position)), Text(_format(duration))],
        )
      ],
    );
  }

  String _format(double seconds) {
    final s = seconds.toInt();
    final mm = (s ~/ 60).toString().padLeft(2, '0');
    final ss = (s % 60).toString().padLeft(2, '0');
    return '$mm:$ss';
  }
}
