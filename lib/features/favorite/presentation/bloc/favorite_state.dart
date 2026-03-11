part of 'favorite_bloc.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  bool isFavorite(int id) => false;

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteLoaded extends FavoriteState {
  const FavoriteLoaded({required this.tracks, required this.isEmptyTracks});
  final List<TrackEntity> tracks;
  final bool isEmptyTracks;

  @override
  bool isFavorite(int id) => tracks.any((t) => t.id == id);

  @override
  List<Object> get props => [tracks, isEmptyTracks];
}

final class FavoriteFailure extends FavoriteState {}
