import 'package:auto_route/auto_route.dart';
import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/track_detail/presentation/bloc/track_detail_bloc.dart';
import 'package:coda/features/track_detail/presentation/cubit/lyrics_type_cubit.dart';
import 'package:coda/features/track_detail/presentation/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

enum Lyrics { original, translate, mix }

@RoutePage()
class TrackDetailScreen extends StatelessWidget {
  const TrackDetailScreen({super.key, required this.track});

  final TrackEntity track;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LyricsTypeCubit()),
        BlocProvider(
          create: (context) {
            final bloc = GetIt.I<TrackDetailBloc>();
            bloc.add(LoadTrackDetail(track: track));
            return bloc;
          },
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<TrackDetailBloc, TrackDetailState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                TrackDetailAppBar(track: track),
                if (state is TrackDetailLoading) SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
                
                if (state is TrackDetailFailure) SliverFillRemaining(child: Center(child: Text("ошибка"))),
                
                if (state is TrackDetailLoaded) ...[
                    SliverToBoxAdapter(child: SizedBox(height: 20)),
                    SliverToBoxAdapter(child: FavoriteButton(track: track,)),
                    SliverToBoxAdapter(child: SizedBox(height: 20)),
                    SliverToBoxAdapter(child: TrackSegmentedControl()),
                    SliverToBoxAdapter(child: SizedBox(height: 20)),
                    TrackLyricsBlock(track: state.track),
                  ],
              ],
            );
          },
        ),
      ),
    );
  }
}
