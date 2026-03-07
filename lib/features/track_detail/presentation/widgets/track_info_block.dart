import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:flutter/material.dart';

class TrackInfoBlock extends StatelessWidget {
  const TrackInfoBlock({super.key, required this.track});

  final TrackEntity track;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(track.posterUrl, width: 300, height: 300),
          ),
          SizedBox(height: 20),
          Text(
            track.title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            track.author,
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 24,
              color: theme.hintColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
