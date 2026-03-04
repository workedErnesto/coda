import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/search/data/datasources/tracks_remote_data_source.dart';
import 'package:coda/features/search/domain/repository/i_search_repository.dart';

class SearchRepository implements ISearchRepository {
  final TracksRemoteDataSource _remoteDataSource;

  SearchRepository({required TracksRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<List<TrackEntity>> fetchPopularTracks() async {
    final trackModels = await _remoteDataSource.fetchPopularTracks();
    return trackModels.map((track) => track.toEntity()).toList();
  }

  @override
  Future<List<TrackEntity>> searchTracks(String query) async {
    // final trackModels = await _remoteDataSource();
    // return trackModels.map((track) => track.toEntity()).toList();
    return [];
  }
}
