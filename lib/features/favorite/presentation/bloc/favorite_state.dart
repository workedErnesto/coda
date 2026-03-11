part of 'favorite_bloc.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteLoaded extends FavoriteState {
  final List<TrackEntity> tracks;
  final bool isEmptyTracks;

  const FavoriteLoaded({required this.tracks, required this.isEmptyTracks});
}

final class FavoriteFailure extends FavoriteState {}
