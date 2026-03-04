import 'dart:convert';

import 'package:coda/features/search/data/model/track_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TracksRemoteDataSource {
  TracksRemoteDataSource({required Dio dio}) : _dio = dio;
  final Dio _dio;

  Future<List<TrackModel>> fetchPopularTracks() async {
    await dotenv.load(fileName: ".env");
    final token = dotenv.env['GENIUS_CLIENT_TOKEN'];
    final response = await _dio.get(
      'https://api.genius.com/search',
      queryParameters: {'q': 'a'},

      options: Options(
        responseType: ResponseType.json,
        contentType: 'application/json',
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ),
    );
    final Map<String, dynamic> data = response.data is String
        ? jsonDecode(response.data)
        : response.data;
    final List hits = data['response']['hits'];

    var list = hits.map((hit) {
      return TrackModel.fromJson(hit['result']);
    }).toList();

    return list;
  }
}
