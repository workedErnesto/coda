import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/favorite/domain/repository/i_favorite_tracks_repository.dart';

class FetchFavoritesTrackUseCase {
  FetchFavoritesTrackUseCase({required IFavoriteTracksRepository repository})
    : _repository = repository;

  final IFavoriteTracksRepository _repository;

  Future<List<TrackEntity>> call() => _repository.fetchFavoriteTracks();
}
