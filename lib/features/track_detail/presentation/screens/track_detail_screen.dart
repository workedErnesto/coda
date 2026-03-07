import 'package:auto_route/auto_route.dart';
import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/track_detail/presentation/widgets/widgets.dart';

import 'package:flutter/material.dart';

enum Lyrics { original, translate, mix }

@RoutePage()
class TrackDetailScreen extends StatelessWidget {
  const TrackDetailScreen({super.key, required this.track});

  final TrackEntity track;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          TrackDetailAppBar(track: track),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: FavoriteButton()),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: TrackSegmentedControl()),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          TrackLyricsBlock(track: track, type: LyricsType.original),
        ],
      ),
    );
  }
}
