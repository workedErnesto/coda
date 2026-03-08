import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/track_detail/domain/repository/i_track_detail_repository.dart';

class FetchTrackUseCase {
  FetchTrackUseCase({required ITrackDetailRepository repository})
    : _repository = repository;
  final ITrackDetailRepository _repository;
  Future<TrackEntity> call(TrackEntity track) async =>
      await _repository.fetchTrack(track);
}
