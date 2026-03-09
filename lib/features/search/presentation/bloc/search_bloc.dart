import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/search/domain/usecase/fetch_popular_tracks_usecase.dart';
import 'package:coda/features/search/domain/usecase/search_tracks_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_event.dart';
part 'search_state.dart';

EventTransformer<E> debounce<E>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required SearchTracksUseCase searchTracksUseCase,
    required FetchPopularTracksUseCase fetchPopularTracksUseCase,
  }) : _searchTracksUseCase = searchTracksUseCase,
       _fetchPopularTracksUseCase = fetchPopularTracksUseCase,
       super(SearchInitial()) {
    on<LoadPopularTracks>((event, emit) async {
      emit(SearchLoading());
      try {
        final List<TrackEntity> trackList = await _fetchPopularTracksUseCase
            .call();
        emit(SearchLoaded(trackList: trackList, isPopular: true));
      } catch (e) {
        emit(SearchFailure(error: e.toString()));
      }
    });

    on<LoadSearchTracks> ( 
      _search,
      transformer: debounce(Duration(milliseconds: 500))
    );
  }

  Future<void> _search(
    LoadSearchTracks event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());
    try {
      if (event.query == null || event.query!.trim().isEmpty) {
        add(LoadPopularTracks());
        return;
      }
      final List<TrackEntity> trackList = await _searchTracksUseCase.call(
        event.query,
      );
      emit(SearchLoaded(trackList: trackList, isPopular: false));
    } catch (e) {
      emit(SearchFailure(error: e.toString()));
    }
  }

  final SearchTracksUseCase _searchTracksUseCase;
  final FetchPopularTracksUseCase _fetchPopularTracksUseCase;
}
