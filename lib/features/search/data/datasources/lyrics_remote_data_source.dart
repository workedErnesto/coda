import 'package:coda/features/search/data/datasources/i_lyrics_remote_data_source.dart';
import 'package:coda/features/search/data/model/track_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LyricsRemoteDataSource implements ILyricsRemoteDataSource {
  LyricsRemoteDataSource({required Dio dio}) : _dio = dio;
  final Dio _dio;
  @override
  Future<List<TrackModel>> fetchTracks(List<TrackModel> tracks) async {
    final List<TrackModel> results = await Future.wait(
      tracks.map((t) async {
        try {
          final result = await _dio.get(
            'https://lrclib.net/api/search',
            queryParameters: {'artist_name': t.author, 'track_name': t.title},
          );

          if (result.statusCode == 200) {
            final trackData = result.data[0];
            final lyrics = trackData['plainLyrics'];
            return t.copyWith(originalLyrics: lyrics);
          }
        } catch (e) {
          debugPrint('ошибка на треке ${t.title}: $e');
        }
        return t;
      }),
    );
    return results.where((track) => track.originalLyrics != null).toList();
  }
}
