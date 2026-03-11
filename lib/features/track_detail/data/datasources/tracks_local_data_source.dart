import 'package:coda/core/data/datasources/i_tracks_local_data_source.dart';
import 'package:coda/core/data/model/track_model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class TracksLocalDataSource implements ITracksLocalDataSource {
  final Box<TrackModel> _trackBox;

  TracksLocalDataSource({required Box<TrackModel> trackBox})
    : _trackBox = trackBox;
  @override
  Future<void> deleteCache() async => await _trackBox.clear();

  @override
  TrackModel? fetchTrackById(int id) => _trackBox.get(id);

  @override
  List<TrackModel> fetchTracks() => _trackBox.values.toList();

  @override
  Future<void> saveTrack(TrackModel track) async =>
      await _trackBox.put(track.id, track);
}
