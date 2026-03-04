import 'package:auto_route/auto_route.dart';
import 'package:coda/features/search/presentation/widgets/keeper.dart';
import 'package:flutter/material.dart';
import 'package:coda/features/search/presentation/widgets/widgets.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
