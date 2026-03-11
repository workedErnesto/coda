import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/favorite/domain/repository/i_favorite_tracks_repository.dart';

class SaveToFavoritesTrackUseCase {
  SaveToFavoritesTrackUseCase({required IFavoriteTracksRepository repository})
    : _repository = repository;

  final IFavoriteTracksRepository _repository;

  Future<void> call(TrackEntity track) async => await _repository.saveToFavorites(track);
}
