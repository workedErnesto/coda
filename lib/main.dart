import 'package:coda/coda_app.dart';
import 'package:coda/core/data/datasources/i_theme_local_data_source.dart';
import 'package:coda/core/data/datasources/theme_local_data_source.dart';
import 'package:coda/core/data/datasources/tracks_local_data_source.dart';
import 'package:coda/core/data/i_tracks_local_data_source.dart';
import 'package:coda/core/data/repository/theme_repository.dart';
import 'package:coda/core/domain/repository/i_theme_repository.dart';
import 'package:coda/core/domain/usecase/fetch_current_theme_use_case.dart';
import 'package:coda/core/domain/usecase/save_theme_use_case.dart';
import 'package:coda/core/presentation/cubit/theme_cubit.dart';
import 'package:coda/features/search/data/datasources/genius_remote_data_source.dart';
import 'package:coda/features/search/data/datasources/i_genius_remote_data_source.dart';
import 'package:coda/features/search/data/datasources/i_lyrics_remote_data_source.dart';
import 'package:coda/core/data/model/track_model.dart';
import 'package:coda/features/track_detail/data/datasources/i_translate_remote_data_source.dart';
import 'package:coda/features/search/data/datasources/lyrics_remote_data_source.dart';
import 'package:coda/features/track_detail/data/datasources/translate_remote_data_source.dart';
import 'package:coda/features/search/data/repository/search_repository.dart';
import 'package:coda/features/search/domain/repository/i_search_repository.dart';
import 'package:coda/features/search/domain/usecase/fetch_popular_tracks_usecase.dart';
import 'package:coda/features/track_detail/data/repository/track_detail_repository.dart';
import 'package:coda/features/track_detail/domain/repository/i_track_detail_repository.dart';
import 'package:coda/features/track_detail/domain/usecase/fetch_track_usecase.dart';
import 'package:coda/features/search/presentation/bloc/search_bloc.dart';
import 'package:coda/features/track_detail/presentation/bloc/track_detail_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sl = GetIt.I;
  final prefs = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  Hive.registerAdapter(TrackModelAdapter());
  final trackBox = await Hive.openBox<TrackModel>('track_box');
  sl.registerSingleton<SharedPreferences>(prefs);
  sl.registerLazySingleton(
    () => Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 3),
      ),
    ),
  );

  sl.registerLazySingleton<GoogleTranslator>(() => GoogleTranslator());

  sl.registerLazySingleton<ITracksLocalDataSource>(() => TracksLocalDataSource(trackBox: trackBox));

  sl.registerLazySingleton<IGeniusRemoteDataSource>(
    () => GeniusRemoteDataSource(dio: sl()),
  );
  sl.registerLazySingleton<ILyricsRemoteDataSource>(
    () => LyricsRemoteDataSource(dio: sl()),
  );
  sl.registerLazySingleton<IThemeLocalDataSource>(
    () => ThemeLocalDataSource(prefs: prefs),
  );
  sl.registerLazySingleton<ITranslateRemoteDataSource>(
    () => TranslateRemoteDataSource(translator: sl()),
  );
  sl.registerLazySingleton<ITrackDetailRepository>(
    () => TrackDetailRepository(translateRemoteDataSource: sl(), tracksLocalDataSource: sl()),
  );
  sl.registerLazySingleton<IThemeRepository>(
    () => ThemeRepository(themeLocalDataSource: sl()),
  );
  sl.registerLazySingleton<FetchCurrentThemeUseCase>(
    () => FetchCurrentThemeUseCase(repository: sl()),
  );
  sl.registerLazySingleton<SaveThemeUseCase>(
    () => SaveThemeUseCase(repository: sl()),
  );
  sl.registerLazySingleton<FetchTrackUseCase>(
    () => FetchTrackUseCase(repository: sl()),
  );

  sl.registerLazySingleton<ISearchRepository>(
    () => SearchRepository(
      remoteDataSource: sl(),
      lyricsRemoteDataSource: sl(),
      translateRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<FetchPopularTracksUseCase>(
    () => FetchPopularTracksUseCase(repository: sl()),
  );

  sl.registerFactory<TrackDetailBloc>(
    () => TrackDetailBloc(fetchTrackUseCase: sl()),
  );

  sl.registerFactory<SearchBloc>(
    () => SearchBloc(fetchPopularTracksUseCase: sl()),
  );

  sl.registerFactory<ThemeCubit>(
    () => ThemeCubit(fetchCurrentThemeUseCase: sl(), saveThemeUseCase: sl()),
  );
  runApp(
    BlocProvider(create: (context) => sl<ThemeCubit>(), child: const CodaApp()),
  );
}
