import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackItem extends StatelessWidget {
  const TrackItem({super.key, required this.track});
  final TrackEntity track;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        bool isFavorite = false;
        if (state is FavoriteLoaded) {
          isFavorite = state.isFavorite(track.id);
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      track.posterUrl,
                      width: 64,
                      height: 64,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          track.title,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          track.author,
                          maxLines: 1,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,

                            color: theme.hintColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            BounceTapper(
              highlightColor: Colors.transparent,
              child: IconButton(
                style: IconButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                ),
                onPressed: () => context.read<FavoriteBloc>().add(
                  ToogleFavorite(track: track),
                ),
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_outline,
                  size: 24,
                ),
                color: isFavorite ? Colors.redAccent[400] : theme.hintColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
