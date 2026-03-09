import 'package:coda/features/track_detail/presentation/cubit/lyrics_type_cubit.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackSegmentedControl extends StatelessWidget {
  const TrackSegmentedControl({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final type = context.watch<LyricsTypeCubit>().state.type;

    TextStyle? style(LyricsType lyricsType) {
      return theme.textTheme.bodyLarge?.copyWith(
        fontWeight: type == lyricsType ? FontWeight.w800 : FontWeight.w500,
      );
    }

    return Center(
      child: CustomSlidingSegmentedControl(
        fixedWidth: 110,
        initialValue: LyricsType.original,
        innerPadding: EdgeInsets.all(4),
        padding: 12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: theme.colorScheme.secondary,
        ),
        thumbDecoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(12),
        ),
        duration: Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        children: {
          LyricsType.original: Text(
            "Оригинал",
            style: style(LyricsType.original),
          ),
          LyricsType.translate: Text(
            "Перевод",
            style: style(LyricsType.translate),
          ),
          LyricsType.mix: Text("Микс", style: style(LyricsType.mix)),
        },
        onValueChanged: (type) =>
            context.read<LyricsTypeCubit>().changeType(type),
      ),
    );
  }
}
