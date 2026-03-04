import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:flutter/material.dart';

class TrackItem extends StatelessWidget {
  const TrackItem({super.key, required this.track});
  final TrackEntity track;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: theme.hintColor,
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  track.title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  track.author,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: theme.hintColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton.filled(
          style: IconButton.styleFrom(backgroundColor: Colors.transparent),
          onPressed: () {},
          icon: Icon(Icons.favorite_outline, color: theme.hintColor, size: 24),
        ),
      ],
    );
  }
}
