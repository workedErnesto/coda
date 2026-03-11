import 'package:coda/core/domain/entity/track_entity.dart';

abstract interface class IFavoriteTracksRepository {
  Future<List<TrackEntity>> fetchListFavorites();
  Future<void> saveToFavorites(TrackEntity track);
  Future<void> deleteFromFavorites(int id);
  Future<void> deleteCache();
}
