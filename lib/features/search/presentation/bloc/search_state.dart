part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  const SearchLoaded({required this.trackList});
  final List<TrackEntity> trackList;
}

final class SearchFailure extends SearchState {
  const SearchFailure({required this.error});
  final String error;
}
