import 'package:coda/features/search/data/datasources/i_lyrics_remote_data_source.dart';
import 'package:coda/core/data/model/track_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LyricsDataSource implements ILyricsRemoteDataSource {
  LyricsDataSource({required Dio dio}) : _dio = dio;
  final Dio _dio;
  @override
  Future<List<TrackModel>> fetchTracks(List<TrackModel> tracks) async {
    final List<TrackModel> results = await _request(tracks);
    return results.where((track) => track.originalLyrics != null).toList();
  }

  @override
  Future<TrackModel>? translateTrack(TrackModel track) async {
    final tracks = await _request([track]);
    return tracks.first;
  }

  Future<List<TrackModel>> _request(List<TrackModel> tracks) {
    return Future.wait(
      tracks.map((t) async {
        try {
          final result = await _dio.get(
            'https://lrclib.net/api/search',
            queryParameters: {'artist_name': t.author, 'track_name': t.title},
          );

          if (result.statusCode == 200) {
            final trackData = result.data[0];
            final String lyrics = trackData['plainLyrics'];
            debugPrint(lyrics.isNotEmpty.toString());
            if (lyrics.isNotEmpty) {
              return t.copyWith(originalLyrics: lyrics);
            }
          }
        } catch (e) {
          debugPrint('ошибка на треке ${t.title}: $e');
        }
        return t;
      }),
    );
  }
}
