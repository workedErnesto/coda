// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackModel _$TrackModelFromJson(Map<String, dynamic> json) => TrackModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  author: json['primary_artist_names'] as String,
  posterUrl: json['song_art_image_url'] as String,
);

// ignore: unused_element
Map<String, dynamic> _$TrackModelToJson(TrackModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'primary_artist_names': instance.author,
      'song_art_image_url': instance.posterUrl,
    };
