import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/search/domain/repository/i_search_repository.dart';

class SearchTracksUseCase {
  SearchTracksUseCase({required this.repository});
  final ISearchRepository repository;

  Future<List<TrackEntity>> call(String? query) async =>
     await repository.searchTracks(query);
  
}
