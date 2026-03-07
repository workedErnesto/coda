import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

enum LyricsType { original, translate, mix }

class TrackLyricsBlock extends StatelessWidget {
  const TrackLyricsBlock({super.key, required this.track, required this.type});

  final TrackEntity track;
  final LyricsType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<String> lyrics = track.originalLyrics.split('\n');
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverStack(
        children: [
          SliverPositioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverList.separated(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...switch (type) {
                      LyricsType.original => [
                        Text(
                          lyrics[index],
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                      LyricsType.translate => [
                        Text(
                          lyrics[index],
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                      LyricsType.mix => [
                        Text(
                          lyrics[index],
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          lyrics[index],
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ],
                    },
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20);
              },
              itemCount: lyrics.length,
            ),
          ),
        ],
      ),
    );
  }
}
