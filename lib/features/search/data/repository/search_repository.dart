import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/search/data/datasources/i_genius_remote_data_source.dart';
import 'package:coda/features/search/data/datasources/i_lyrics_remote_data_source.dart';
import 'package:coda/features/track_detail/data/datasources/i_translate_remote_data_source.dart';
import 'package:coda/features/search/domain/repository/i_search_repository.dart';

class SearchRepository implements ISearchRepository {
  final IGeniusRemoteDataSource _remoteDataSource;
  final ILyricsRemoteDataSource _lyricsRemoteDataSource;
  final ITranslateRemoteDataSource _translateRemoteDataSource;

  SearchRepository({
    required IGeniusRemoteDataSource remoteDataSource,
    required ILyricsRemoteDataSource lyricsRemoteDataSource,
    required ITranslateRemoteDataSource translateRemoteDataSource,
  }) : _translateRemoteDataSource = translateRemoteDataSource,
       _lyricsRemoteDataSource = lyricsRemoteDataSource,
       _remoteDataSource = remoteDataSource;

  @override
  Future<List<TrackEntity>> fetchPopularTracks() async {
    final models = await _remoteDataSource.fetchPopularTracks();
    final modelsWithLyrics = await _lyricsRemoteDataSource.fetchTracks(models);
    return modelsWithLyrics.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<TrackEntity>> searchTracks(String? query) async {
    if (query == null) {
      return fetchPopularTracks();
    } else {
      final models = await _remoteDataSource.searchTracks(query);
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
