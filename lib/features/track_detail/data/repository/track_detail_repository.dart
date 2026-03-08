import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/track_detail/data/datasources/i_translate_remote_data_source.dart';
import 'package:coda/features/track_detail/domain/repository/i_track_detail_repository.dart';

class TrackDetailRepository implements ITrackDetailRepository {
  final ITranslateRemoteDataSource _translateRemoteDataSource;

  TrackDetailRepository({
    required ITranslateRemoteDataSource translateRemoteDataSource,
  }) : _translateRemoteDataSource = translateRemoteDataSource;

  Future<String> _fetchTranslateLyrics(TrackEntity track) async =>
      await _translateRemoteDataSource.translateLyrics(track);

  @override
  Future<TrackEntity> fetchTrack(TrackEntity track) async {
    final translatedLyrics = await _fetchTranslateLyrics(track);
    return track.copyWith(translatedLyrics: translatedLyrics);
  }
}
