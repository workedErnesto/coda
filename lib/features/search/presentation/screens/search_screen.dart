import 'package:auto_route/auto_route.dart';
import 'package:coda/features/search/presentation/bloc/search_bloc.dart';
import 'package:coda/features/search/presentation/widgets/keeper.dart';
import 'package:flutter/material.dart';
import 'package:coda/features/search/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchBloc = GetIt.I<SearchBloc>();

  @override
  void initState() {
    super.initState();
    _searchBloc.add(LoadPopularTracks());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _searchBloc,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ).copyWith(bottom: 16),
          child: CustomScrollView(
            slivers: [
              BaseAppBar(title: 'Поиск', bottom: SearchField()),
              PopularTracksText(),
              Keeper(),
            ],
          ),
        ),
      ),
    );
  }
}
