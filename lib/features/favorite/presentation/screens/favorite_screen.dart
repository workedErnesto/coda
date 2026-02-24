import 'package:auto_route/auto_route.dart';
import 'package:coda/core/widgets/base_app_bar.dart';
import 'package:coda/core/widgets/track_list.dart';
import 'package:coda/features/favorite/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ).copyWith(bottom: 16),
        child: CustomScrollView(
          slivers: [
            BaseAppBar(title: "Избранное"),
            [].isEmpty ? StubFavorite() : TrackList(),
          ],
        ),
      ),
    );
  }
}
