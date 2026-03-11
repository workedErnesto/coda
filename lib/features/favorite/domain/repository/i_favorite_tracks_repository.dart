import 'package:coda/core/domain/entity/track_entity.dart';

abstract interface class IFavoriteTracksRepository {
  Future<List<TrackEntity>> fetchFavoriteTracks();
}
