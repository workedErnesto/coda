import 'package:coda/core/data/model/track_model.dart';
import 'package:coda/features/favorite/data/datasources/i_local_favorite_tracks_datasource.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class FavoriteTracksDatasource implements ILocalFavoriteTracksDatasource {
  final Box<TrackModel> _favoriteBox;

  FavoriteTracksDatasource({required Box<TrackModel> favoriteBox})
    : _favoriteBox = favoriteBox;
  @override
  Future<void> deleteFromFavorites(int id) async =>
      await _favoriteBox.delete(id);

  @override
  Future<List<TrackModel>> fetchFavoriteTracks() async =>
      _favoriteBox.values.toList();

  @override
  Future<void> saveToFavorites(TrackModel track) async =>
      await _favoriteBox.put(track.id, track);

  @override
  Future<TrackModel>? fetchFavoriteTrack(int id) async =>
      _favoriteBox.values.firstWhere((t) => t.id == id);

  @override
  Future<void> deleteCache() async => _favoriteBox.clear();
}
