import 'package:auto_route/auto_route.dart';
import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/track_detail/presentation/cubit/lyrics_type_cubit.dart';
import 'package:coda/features/track_detail/presentation/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Lyrics { original, translate, mix }

@RoutePage()
class TrackDetailScreen extends StatelessWidget {
  const TrackDetailScreen({super.key, required this.track});

  final TrackEntity track;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LyricsTypeCubit(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            TrackDetailAppBar(track: track),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(child: FavoriteButton()),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(child: TrackSegmentedControl()),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            TrackLyricsBlock(track: track),
          ],
        ),
      ),
    );
  }
}
