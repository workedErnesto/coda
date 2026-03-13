import 'package:auto_route/auto_route.dart';
import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/core/presentation/widgets/widgets.dart';
import 'package:coda/core/router/router.gr.dart';
import 'package:coda/features/search/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TrackList extends StatelessWidget {
  const TrackList({super.key, required this.trackList});
  final List<TrackEntity> trackList;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return SliverMainAxisGroup(
      slivers: [
        SliverList.separated(
          itemCount: trackList.length,
          itemBuilder: (context, index) {
            return BaseContainer(
              child: OutlinedButton(
                onPressed: () => context.router.push(
                  TrackDetailRoute(track: trackList[index]),
                ),
                style: OutlinedButton.styleFrom(
                  elevation: 1,
                  side: isDark
                      ? BorderSide.none
                      : BorderSide(color: theme.hintColor.withOpacity(0.15)),
                  padding: EdgeInsets.zero.copyWith(left: 12, right: 2),
                  minimumSize: Size.fromHeight(88),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: theme.colorScheme.onPrimary,
                ),
                child: TrackItem(track: trackList[index]),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 12);
          },
        ),
        SliverToBoxAdapter(child: SizedBox(height: bottomPadding)),
      ],
    );
  }
}
