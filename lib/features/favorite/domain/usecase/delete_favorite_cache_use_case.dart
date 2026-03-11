import 'package:coda/features/favorite/domain/repository/i_favorite_tracks_repository.dart';

class DeleteFavoriteCacheUseCase {
  DeleteFavoriteCacheUseCase({required IFavoriteTracksRepository repository})
    : _repository = repository;

  final IFavoriteTracksRepository _repository;

  Future<void> call() async => await _repository.deleteCache();
}
