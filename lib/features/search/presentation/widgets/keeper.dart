import 'package:coda/core/presentation/widgets/error_block.dart';
import 'package:coda/features/search/presentation/bloc/search_bloc.dart';
import 'package:coda/features/search/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Keeper extends StatefulWidget {
  const Keeper({super.key});

  @override
  State<Keeper> createState() => _KeeperState();
}

class _KeeperState extends State<Keeper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoaded) {
          return TrackList(trackList: state.trackList);
        }
        if (state is SearchLoading) {
          return SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is SearchFailure) {
            return ErrorBlock(
              text: 'Не удалось\n загрузить треки :(',
              onPressed: () =>
                  context.read<SearchBloc>().add(LoadPopularTracks()),
          );
        }
        return SliverToBoxAdapter(child: Container(child: Text('errrroooor')));
      },
    );
  }
}
