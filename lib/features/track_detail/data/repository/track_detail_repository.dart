import 'package:coda/core/data/datasources/i_tracks_local_data_source.dart';
import 'package:coda/core/data/model/track_model.dart';
import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/track_detail/data/datasources/i_translate_remote_data_source.dart';
import 'package:coda/features/track_detail/domain/repository/i_track_detail_repository.dart';

class TrackDetailRepository implements ITrackDetailRepository {
  final ITranslateRemoteDataSource _translateRemoteDataSource;
  final ITracksLocalDataSource _tracksLocalDataSource;

  TrackDetailRepository({
    required ITranslateRemoteDataSource translateRemoteDataSource,
    required ITracksLocalDataSource tracksLocalDataSource,
  }) : _tracksLocalDataSource = tracksLocalDataSource,
       _translateRemoteDataSource = translateRemoteDataSource;

  Future<String> _fetchTranslateLyrics(TrackEntity track) async =>
      await _translateRemoteDataSource.translateLyrics(track);

  @override
  Future<TrackEntity> fetchTrack(TrackEntity track) async {
    final localTrack = _tracksLocalDataSource.fetchTrackById(track.id);
    if (localTrack == null) {
      final translatedLyrics = await _fetchTranslateLyrics(track);
      final localTrack = track.copyWith(translatedLyrics: translatedLyrics);
      await _tracksLocalDataSource.saveTrack(TrackModel.fromEntity(localTrack));
      return localTrack;
    } else {
      return localTrack.toEntity();
    }
  }

  @override
  Future<void> saveTrack(TrackEntity track) async =>
      await _tracksLocalDataSource.saveTrack(TrackModel.fromEntity(track));
}
