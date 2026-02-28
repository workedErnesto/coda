import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/search/domain/repository/i_search_repository.dart';

class FetchPopularTracksUseCase {
  FetchPopularTracksUseCase({required this.repository});
  final ISearchRepository repository;

  Future<List<TrackEntity>> call() async {
    return await repository.fetchPopularTracks();
  }
}
