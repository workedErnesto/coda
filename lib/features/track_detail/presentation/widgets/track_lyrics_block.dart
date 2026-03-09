import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/track_detail/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class TrackLyricsBlock extends StatefulWidget {
  const TrackLyricsBlock({super.key, required this.track});

  final TrackEntity track;

  @override
  State<TrackLyricsBlock> createState() => _TrackLyricsBlockState();
}

class _TrackLyricsBlockState extends State<TrackLyricsBlock> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<String> lyrics = widget.track.originalLyrics
        .replaceAll('\n\n', '\n')
        .split('\n');
    final List<String> translatedLyrics = widget.track.translatedLyrics!.split(
      "\n",
    );
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
                return TrackLyricsLine(
                  originalLine: lyrics[index],
                  translatedlLine: index < translatedLyrics.length ? translatedLyrics[index] : "",
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
