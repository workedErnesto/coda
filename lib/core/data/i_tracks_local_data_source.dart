import 'package:coda/core/data/model/track_model.dart';

abstract interface class ITracksLocalDataSource {
  List<TrackModel> fetchTracks();
  TrackModel? fetchTrackById(int id);
  Future<void> saveTrack(TrackModel track);
  Future<void> deleteCache();
}
