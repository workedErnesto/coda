import 'package:coda/core/domain/entity/track_entity.dart';

abstract interface class ITranslateRemoteDataSource {
  Future<String> translateLyrics(TrackEntity track);
}
