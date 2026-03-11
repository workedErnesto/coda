import 'package:coda/features/track_detail/domain/repository/i_track_detail_repository.dart';

class ClearCacheTracksUseCase {
  ClearCacheTracksUseCase({required ITrackDetailRepository repository})
    : _repository = repository;
  final ITrackDetailRepository _repository;
  Future<void> call() async => await _repository.deleteCache();
}
