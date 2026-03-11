import 'package:coda/core/data/datasources/i_tracks_local_data_source.dart';
import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/favorite/domain/repository/i_favorite_tracks_repository.dart';

class FavoriteTracksRepository implements IFavoriteTracksRepository {
  final ITracksLocalDataSource _tracksLocalDataSource;

  FavoriteTracksRepository({required ITracksLocalDataSource tracksLocalDataSource})
    : _tracksLocalDataSource = tracksLocalDataSource;

  @override
  Future<List<TrackEntity>> fetchFavoriteTracks() async {
    final tracks = _tracksLocalDataSource.fetchTracks().map(
      (t) => t.toEntity(),
    );
    return tracks.where((t) => t.isFavorite == true).toList();
  }  
}
