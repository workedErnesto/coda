import 'package:coda/features/track_detail/presentation/cubit/lyrics_type_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackLyricsLine extends StatelessWidget {
  const TrackLyricsLine({
    super.key,
    required this.originalLine,
    this.translatedlLine,
  });

  final String originalLine;
  final String? translatedlLine;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final LyricsType type = context.watch<LyricsTypeCubit>().state.type;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...switch (type) {
          LyricsType.original => [
            Text(
              originalLine,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
          LyricsType.translate => [
            Text(
              translatedlLine!,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
          LyricsType.mix => [
            Text(
              originalLine,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
            Text(
              translatedlLine!,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        },
      ],
    );
  }
}
