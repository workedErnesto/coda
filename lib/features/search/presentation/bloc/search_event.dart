part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class LoadPopularTracks extends SearchEvent {}

class LoadSearchTracks extends SearchEvent {
  const LoadSearchTracks({required this.query});
  final String? query;
}
