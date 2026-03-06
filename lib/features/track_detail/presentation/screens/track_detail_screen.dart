import 'package:auto_route/auto_route.dart';
import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/track_detail/presentation/widgets/widgets.dart';

import 'package:flutter/material.dart';

@RoutePage()
class TrackDetailScreen extends StatelessWidget {
  const TrackDetailScreen({super.key, required this.track});

  final TrackEntity track;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: TrackDetailAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(0),
        child: Center(
          child: Column(
            children: [
              TrackInfoBlock(track: track),
              SizedBox(height: 20),
              FavoriteButton(),
            ],
          ),
        ),
      ),
    );
  }
}
