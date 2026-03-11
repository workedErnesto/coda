part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavoritesTracks extends FavoriteEvent {}

class ToogleFavorite extends FavoriteEvent {
  const ToogleFavorite({required this.track});

  final TrackEntity track;
}

class DeleteAllFavoritesTracks extends FavoriteEvent {}
 