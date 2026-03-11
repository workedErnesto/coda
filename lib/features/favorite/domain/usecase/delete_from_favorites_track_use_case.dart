import 'package:coda/features/favorite/domain/repository/i_favorite_tracks_repository.dart';

class DeleteFromFavoritesTrackUseCase {
  DeleteFromFavoritesTrackUseCase({required IFavoriteTracksRepository repository})
    : _repository = repository;

  final IFavoriteTracksRepository _repository;

  Future<void> call(int id) async => await _repository.deleteFromFavorites(id);
}
