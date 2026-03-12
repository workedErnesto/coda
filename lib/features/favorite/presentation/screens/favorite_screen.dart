import 'package:auto_route/auto_route.dart';
import 'package:coda/core/presentation/widgets/base_app_bar.dart';
import 'package:coda/core/presentation/widgets/track_list.dart';
import 'package:coda/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:coda/core/presentation/widgets/error_block.dart';
import 'package:coda/features/favorite/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(LoadFavoritesTracks());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ).copyWith(bottom: 16),
            child: CustomScrollView(
              slivers: [
                BaseAppBar(title: "Избранное"),
                if (state is FavoriteLoading)
                  SliverFillRemaining(child: CircularProgressIndicator()),
                if (state is FavoriteFailure)
                  ErrorBlock(
                    text: 'Не удалось\n загрузить треки :(',
                    onPressed: () =>
                        context.read<FavoriteBloc>().add(LoadFavoritesTracks()),
                  ),
                if (state is FavoriteLoaded)
                  state.isEmptyTracks
                      ? StubFavorite()
                      : TrackList(trackList: state.tracks),
              ],
            ),
          ),
        );
      },
    );
  }
}
