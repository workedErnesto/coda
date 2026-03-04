import 'package:coda/features/search/presentation/bloc/search_bloc.dart';
import 'package:coda/features/search/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class Keeper extends StatefulWidget {
  const Keeper({super.key});

  @override
  State<Keeper> createState() => _KeeperState();
}

class _KeeperState extends State<Keeper> {
  final _searchBloc = GetIt.I<SearchBloc>();

  @override
  void initState() {
    super.initState();
    _searchBloc.add(LoadPopularTracks());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: _searchBloc,
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
          return SliverToBoxAdapter(
            child: Center(child: Container(child: Text(state.error))),
          );
        }
        return SliverToBoxAdapter(child: Container(child: Text('data123')));
      },
    );
  }
}
