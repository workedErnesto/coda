import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/track_detail/domain/usecase/clear_cache_tracks_use_case.dart';
import 'package:coda/features/track_detail/domain/usecase/fetch_track_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'track_detail_event.dart';
part 'track_detail_state.dart';

class TrackDetailBloc extends Bloc<TrackDetailEvent, TrackDetailState> {
  TrackDetailBloc({
    required FetchTrackUseCase fetchTrackUseCase, required ClearCacheTracksUseCase clearCacheTracksUseCase,

  }) : _clearCacheTracksUseCase = clearCacheTracksUseCase, 
       _fetchTrackUseCase = fetchTrackUseCase,
       super(TrackDetailInitial()) {
    on<LoadTrackDetail>((event, emit) async {
      emit(TrackDetailLoading());
      try {
        final track = await _fetchTrackUseCase(event.track);
        emit(TrackDetailLoaded(track: track));
      } catch (e) {
        emit(TrackDetailFailure());
      }
    });

    on<DeleteCacheTrackDetail>((event, emit) async {
      await _clearCacheTracksUseCase();
    });
  }

  final FetchTrackUseCase _fetchTrackUseCase;
  final ClearCacheTracksUseCase _clearCacheTracksUseCase;
}
