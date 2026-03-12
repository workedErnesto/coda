import 'package:coda/core/data/model/track_model.dart';

abstract interface class ISearchRemoteDataSource {
  Future<List<TrackModel>> fetchPopularTracks();
  Future<List<TrackModel>> searchTracks(String query);
}
