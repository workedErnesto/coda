import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'lyrics_type_state.dart';

class LyricsTypeCubit extends Cubit<LyricsTypeState> {
  LyricsTypeCubit() : super(LyricsTypeState(type: LyricsType.original));

  void changeType(LyricsType type) => emit(LyricsTypeState(type: type));
}
