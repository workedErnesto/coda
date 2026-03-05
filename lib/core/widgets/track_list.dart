import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/core/widgets/widgets.dart';
import 'package:coda/features/search/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TrackList extends StatelessWidget {
  const TrackList({super.key, required this.trackList});
  final List<TrackEntity> trackList;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return SliverList.separated(
      itemCount: trackList.length,
      itemBuilder: (context, index) {
        return BaseContainer(
          child: OutlinedButton(
            onPressed: () {},
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
    );
  }
}
