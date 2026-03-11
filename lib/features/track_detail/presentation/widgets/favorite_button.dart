import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/core/presentation/widgets/widgets.dart';
import 'package:coda/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.track});
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
        return Center(
          child: BounceTapper(
            onTap: () =>
                context.read<FavoriteBloc>().add(ToogleFavorite(track: track)),
            child: BaseContainer(
              color: isFavorite ? Colors.redAccent[400] : null,
              borderRadius: BorderRadius.circular(50),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isFavorite ? "В избранном" : "В избранное",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isFavorite
                          ? Colors.white
                          : theme.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_outline_outlined,
                    color: isFavorite
                        ? Colors.white
                        : theme.colorScheme.onSurface,
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
