import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/search/domain/repository/i_search_repository.dart';

class SearchTracksUseCase {
  SearchTracksUseCase({required this.repository, required this.query});
  final ISearchRepository repository;
  final String query;

  Future<List<TrackEntity>> call() async =>
     await repository.searchTracks(query);
  
}
