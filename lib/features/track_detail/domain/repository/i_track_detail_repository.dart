import 'package:coda/core/domain/entity/track_entity.dart';

abstract interface class ITrackDetailRepository {
    Future<TrackEntity> fetchTrack(TrackEntity track);

}
