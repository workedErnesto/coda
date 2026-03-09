import 'package:coda/core/data/model/track_model.dart';

abstract interface class ILyricsRemoteDataSource {
  Future<List<TrackModel>> fetchTracks(List<TrackModel> tracks);
}

