import 'package:coda/core/data/model/track_model.dart';

abstract interface class ILocalFavoriteTracksDatasource {
  Future<List<TrackModel>> fetchFavoriteTracks();
  Future<TrackModel>? fetchFavoriteTrack(int id);
  Future<void> saveToFavorites(TrackModel track);
  Future<void> deleteFromFavorites(int id);
  Future<void> deleteCache();
}
