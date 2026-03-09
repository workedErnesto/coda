part of 'lyrics_type_cubit.dart';

enum LyricsType { original, translate, mix }

class LyricsTypeState extends Equatable {
  const LyricsTypeState({required this.type});
  final LyricsType type;

  @override
  List<Object> get props => [type];
}

