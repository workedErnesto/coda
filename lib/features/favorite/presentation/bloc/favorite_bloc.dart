import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/favorite/domain/usecase/delete_favorite_cache_use_case.dart';
import 'package:coda/features/favorite/domain/usecase/delete_from_favorites_track_use_case.dart';
import 'package:coda/features/favorite/domain/usecase/fetch_favorites_track_use_case.dart';
import 'package:coda/features/favorite/domain/usecase/save_to_favorites_track_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc({
    required FetchFavoritesTrackUseCase favoritesTrackUseCase,
    required DeleteFromFavoritesTrackUseCase deleteFromFavoritesTrackUseCase,
    required SaveToFavoritesTrackUseCase saveToFavoritesTrackUseCase,
    required DeleteFavoriteCacheUseCase deleteFavoriteCacheUseCase,
  }) : _deleteFavoriteCacheUseCase = deleteFavoriteCacheUseCase,
       _deleteFromFavoritesTrackUseCase = deleteFromFavoritesTrackUseCase,
       _saveToFavoritesTrackUseCase = saveToFavoritesTrackUseCase,
       _favoritesTrackUseCase = favoritesTrackUseCase,
       super(FavoriteInitial()) {
    on<LoadFavoritesTracks>((event, emit) async {
      emit(FavoriteLoading());
      try {
        final List<TrackEntity> tracks = await _favoritesTrackUseCase();
        emit(FavoriteLoaded(tracks: tracks, isEmptyTracks: tracks.isEmpty));
      } catch (e) {
        emit(FavoriteFailure());
      }
    });

    on<ToogleFavorite>((event, emit) async {
      final List<TrackEntity> tracks = await _favoritesTrackUseCase();
      final bool isFavorite = tracks.any((t) => t.id == event.track.id);
      isFavorite
          ? await _deleteFromFavoritesTrackUseCase(event.track.id)
          : await _saveToFavoritesTrackUseCase(event.track);
      add(LoadFavoritesTracks());
    });

    on<DeleteAllFavoritesTracks>((event, emit) async {
      await _deleteFavoriteCacheUseCase();
      add(LoadFavoritesTracks());
    });
  }

  final FetchFavoritesTrackUseCase _favoritesTrackUseCase;
  final DeleteFromFavoritesTrackUseCase _deleteFromFavoritesTrackUseCase;
  final SaveToFavoritesTrackUseCase _saveToFavoritesTrackUseCase;
  final DeleteFavoriteCacheUseCase _deleteFavoriteCacheUseCase;
}
