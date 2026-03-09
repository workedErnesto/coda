part of 'track_detail_bloc.dart';

sealed class TrackDetailEvent extends Equatable {
  const TrackDetailEvent();

  @override
  List<Object> get props => [];
}

final class LoadTrackDetail extends TrackDetailEvent {
    const LoadTrackDetail({required this.track});
  final TrackEntity track;
}
