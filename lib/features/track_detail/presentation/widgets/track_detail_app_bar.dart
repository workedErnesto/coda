import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/track_detail/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TrackDetailAppBar extends StatelessWidget {
  const TrackDetailAppBar({super.key, required this.track});

  final TrackEntity track;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      expandedHeight: 490,
      leadingWidth: 80,
      pinned: true,
      leading: IconButton.filled(
        style: IconButton.styleFrom(
          backgroundColor: theme.hintColor.withOpacity(0.3),
          padding: EdgeInsets.all(12),
        ),
        onPressed: () => context.router.maybePop(),
        icon: Icon(Icons.arrow_back_outlined, size: 32, color: Colors.white),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              track.posterUrl,
              height: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        // theme.scaffoldBackgroundColor.withOpacity(0.5),
                        theme.scaffoldBackgroundColor,
                      ],
                      stops: [0.8, 1],
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: TrackInfoBlock(track: track),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
