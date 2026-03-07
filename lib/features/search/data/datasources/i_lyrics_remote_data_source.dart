import 'package:coda/features/search/data/model/track_model.dart';

abstract interface class ILyricsRemoteDataSource {
  Future<List<TrackModel>> fetchTracks(List<TrackModel> tracks);
}

