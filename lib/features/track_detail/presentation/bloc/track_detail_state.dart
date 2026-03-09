part of 'track_detail_bloc.dart';

sealed class TrackDetailState extends Equatable {
  const TrackDetailState();

  @override
  List<Object> get props => [];
}

final class TrackDetailInitial extends TrackDetailState {}

final class TrackDetailLoading extends TrackDetailState {}

final class TrackDetailLoaded extends TrackDetailState {
  const TrackDetailLoaded({required this.track});
  final TrackEntity track;
}

final class TrackDetailFailure extends TrackDetailState {}
