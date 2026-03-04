import 'package:coda/coda_app.dart';
import 'package:coda/features/search/data/datasources/tracks_remote_data_source.dart';
import 'package:coda/features/search/data/repository/search_repository.dart';
import 'package:coda/features/search/domain/repository/i_search_repository.dart';
import 'package:coda/features/search/domain/usecase/fetch_popular_tracks_usecase.dart';
import 'package:coda/features/search/presentation/bloc/search_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  final sl = GetIt.I;
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<TracksRemoteDataSource>(
    () => TracksRemoteDataSource(dio: sl()),
  );
  sl.registerLazySingleton<ISearchRepository>(
    () => SearchRepository(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<FetchPopularTracksUseCase>(
    () => FetchPopularTracksUseCase(repository: sl()),
  );
  sl.registerFactory<SearchBloc>(
    () => SearchBloc(fetchPopularTracksUseCase: sl()),
  );
  runApp(const CodaApp());
}
