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
      List<String> lines = result.replaceAll('\n\n', '\n').split("\n");

      String textWithMarkers = lines.join(" ___ ");

      var translation = await _translator.translate(
        textWithMarkers,
        from: 'en',
        to: 'ru',
      );

      return translation.text.replaceAll(" ___ ", '\n');
    } catch (e) {
      debugPrint("ошибка перевода: $e");
    }
    return result;
  }
}
