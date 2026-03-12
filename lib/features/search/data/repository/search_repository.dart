import 'package:coda/core/data/datasources/i_tracks_local_data_source.dart';
import 'package:coda/core/data/model/track_model.dart';
import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/search/data/datasources/i_search_remote_data_source.dart';
import 'package:coda/features/search/data/datasources/i_lyrics_remote_data_source.dart';
import 'package:coda/features/track_detail/data/datasources/i_translate_remote_data_source.dart';
import 'package:coda/features/search/domain/repository/i_search_repository.dart';

class SearchRepository implements ISearchRepository {
  final ISearchRemoteDataSource _searchRemoteDataSource;
  final ITracksLocalDataSource _tracksLocalDataSource;
  final ILyricsRemoteDataSource _lyricsRemoteDataSource;
  final ITranslateRemoteDataSource _translateRemoteDataSource;

  SearchRepository({
    required ISearchRemoteDataSource searchRemoteDataSource,
    required ILyricsRemoteDataSource lyricsRemoteDataSource,
    required ITranslateRemoteDataSource translateRemoteDataSource,
    required ITracksLocalDataSource tracksLocalDataSource,
  }) : _tracksLocalDataSource = tracksLocalDataSource,
       _translateRemoteDataSource = translateRemoteDataSource,
       _lyricsRemoteDataSource = lyricsRemoteDataSource,
       _searchRemoteDataSource = searchRemoteDataSource;

  @override
  Future<List<TrackEntity>> fetchPopularTracks() async {
    final models = await _searchRemoteDataSource.fetchPopularTracks();
    var updatedModels = await Future.wait(
      models.map((t) async {
        final localTrack = await _tracksLocalDataSource.fetchTrackById(t.id);
        if (localTrack != null) {
          return localTrack;
        } else {
          return await _lyricsRemoteDataSource.translateTrack(t);
        }
      }),
    );

    return updatedModels
        .whereType<TrackModel>()
        .where((t) => t.originalLyrics?.isNotEmpty ?? false)
        .map((t) => t.toEntity())
        .toList();
  }

  @override
  Future<List<TrackEntity>> searchTracks(String? query) async {
    if (query == null) {
      return fetchPopularTracks();
    } else {
      final models = await _searchRemoteDataSource.searchTracks(query);
      final modelsWithLyrics = await _lyricsRemoteDataSource.fetchTracks(
        models,
      );
      return modelsWithLyrics.map((model) => model.toEntity()).toList();
    }
  }

  @override
  Future<String> fetchTranslateLyrics(TrackEntity track) async =>
      await _translateRemoteDataSource.translateLyrics(track);
}
