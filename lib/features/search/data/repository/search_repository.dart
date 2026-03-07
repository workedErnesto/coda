import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/search/data/datasources/i_genius_remote_data_source.dart';
import 'package:coda/features/search/data/datasources/i_lyrics_remote_data_source.dart';
import 'package:coda/features/search/domain/repository/i_search_repository.dart';
import 'package:flutter/widgets.dart';

class SearchRepository implements ISearchRepository {
  final IGeniusRemoteDataSource _remoteDataSource;
  final ILyricsRemoteDataSource _lyricsRemoteDataSource;

  SearchRepository({
    required IGeniusRemoteDataSource remoteDataSource,
    required ILyricsRemoteDataSource lyricsRemoteDataSource,
  }) : _lyricsRemoteDataSource = lyricsRemoteDataSource,
       _remoteDataSource = remoteDataSource;

  @override
  Future<List<TrackEntity>> fetchPopularTracks() async {
    final models = await _remoteDataSource.fetchPopularTracks();
    final modelsWithLyrics = await _lyricsRemoteDataSource.fetchTracks(models);
    debugPrint('Загружено треков: ${modelsWithLyrics.length}');
    return modelsWithLyrics.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<TrackEntity>> searchTracks(String query) async {
    // final trackModels = await _remoteDataSource();
    // return trackModels.map((track) => track.toEntity()).toList();
    return [];
  }
}
