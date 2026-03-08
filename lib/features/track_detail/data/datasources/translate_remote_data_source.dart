import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:coda/features/track_detail/data/datasources/i_translate_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslateRemoteDataSource implements ITranslateRemoteDataSource {
  TranslateRemoteDataSource({required GoogleTranslator translator})
    : _translator = translator;

  final GoogleTranslator _translator;

  @override
  Future<String> translateLyrics(TrackEntity track) async {
    String result = track.originalLyrics;
    try {
      String textWithMarkers = track.originalLyrics
          .replaceAll('\n\n', '\n')
          .replaceAll('\n', '[BR]');

      var translation = await _translator.translate(
        textWithMarkers,
        from: 'en',
        to: 'ru',
      );
      return translation.text;
    } catch (e) {
      debugPrint("ошибка перевода: $e");
    }
    return result;
  }
}
