import 'package:coda/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:coda/features/track_detail/presentation/bloc/track_detail_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  Future<void> clearCache() async {
    GetIt.I<FavoriteBloc>().add(DeleteAllFavoritesTracks());
    GetIt.I<TrackDetailBloc>().add(DeleteCacheTrackDetail());
  }
}
