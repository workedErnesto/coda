import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/search/domain/usecase/fetch_popular_tracks_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required this.fetchPopularTracksUseCase})
    : super(SearchInitial()) {
    on<LoadPopularTracks>((event, emit) async {
      emit(SearchLoading());
      try {
        final List<TrackEntity> trackList = await fetchPopularTracksUseCase
            .call();
        emit(SearchLoaded(trackList: trackList));
      } catch (e) {
        emit(SearchFailure(error: e.toString()));
      }
    });
  }

  final FetchPopularTracksUseCase fetchPopularTracksUseCase;
}
