import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/favorite/domain/usecase/fetch_favorites_track_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc({required FetchFavoritesTrackUseCase favoritesTrackUseCase}) : _favoritesTrackUseCase = favoritesTrackUseCase, super(FavoriteInitial()) {
    on<LoadFavoritesTracks>((event, emit) async {
      emit(FavoriteLoading());
      try {
        final List<TrackEntity> tracks = await _favoritesTrackUseCase();
        emit(FavoriteLoaded(tracks: tracks, isEmptyTracks: tracks.isEmpty));
      } catch (e) {
        emit(FavoriteFailure());
      }
    });
  }
  final FetchFavoritesTrackUseCase _favoritesTrackUseCase;
}
