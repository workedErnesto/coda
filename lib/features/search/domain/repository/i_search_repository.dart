import 'package:coda/core/domain/entity/track_entity.dart';

abstract interface class ISearchRepository {
  Future<List<TrackEntity>> fetchPopularTracks();
  Future<List<TrackEntity>> searchTracks(String query);
}
