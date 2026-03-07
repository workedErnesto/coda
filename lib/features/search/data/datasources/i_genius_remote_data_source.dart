import 'package:coda/features/search/data/model/track_model.dart';

abstract interface class IGeniusRemoteDataSource {
  Future<List<TrackModel>> fetchPopularTracks();
}
