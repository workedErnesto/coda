import 'package:coda/core/data/model/track_model.dart';
import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/favorite/data/datasources/i_local_favorite_tracks_datasource.dart';
import 'package:coda/features/favorite/domain/repository/i_favorite_tracks_repository.dart';

class FavoriteTracksRepository implements IFavoriteTracksRepository {
  final ILocalFavoriteTracksDatasource _favoriteTracksDatasource;

  FavoriteTracksRepository({
    required ILocalFavoriteTracksDatasource favoriteTracksDatasource,
  }) : _favoriteTracksDatasource = favoriteTracksDatasource;
  @override
  Future<void> deleteFromFavorites(int id) async =>
      await _favoriteTracksDatasource.deleteFromFavorites(id);

  @override
  Future<List<TrackEntity>> fetchListFavorites() async {
    final tracks = await _favoriteTracksDatasource.fetchFavoriteTracks();
    return tracks.map((t) => t.toEntity()).toList();
  }

  @override
  Future<void> saveToFavorites(TrackEntity track) async =>
      await _favoriteTracksDatasource.saveToFavorites(
        TrackModel.fromEntity(track),
      );

  @override
  Future<void> deleteCache() async =>
      await _favoriteTracksDatasource.deleteCache();
}
