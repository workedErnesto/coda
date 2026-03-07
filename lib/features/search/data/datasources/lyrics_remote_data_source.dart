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

          // ПРОВЕРКА: Если список пустой, data[0] вызовет краш. Проверяем заранее!
          if (result.statusCode == 200 && (result.data as List).isNotEmpty) {
            final trackData = result.data[0];
            final lyrics = trackData['plainLyrics'];

            debugPrint('✅ Нашел текст для: ${t.title}');
            return t.copyWith(originalLyrics: lyrics);
          }
        } catch (e) {
          debugPrint('❌ Ошибка на треке ${t.title}: $e');
        }

        // Если текста нет, возвращаем t (но помни, что там lyrics == null)
        return t;
      }),
    );

    // Если ты хочешь в итоге видеть ТОЛЬКО треки с текстом:
    return results.where((track) => track.originalLyrics != null).toList();
  }
}
