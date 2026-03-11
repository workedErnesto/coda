import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'track_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class TrackModel extends Equatable {
  @JsonKey(name: 'id')
  @HiveField(0)
  final int id;

  @JsonKey(name: 'title')
  @HiveField(1)
  final String title;

  @JsonKey(name: 'primary_artist_names')
  @HiveField(2)
  final String author;

  @JsonKey(name: 'song_art_image_url')
  @HiveField(3)
  final String posterUrl;

  @JsonKey(includeFromJson: false)
  @HiveField(4)
  final String? originalLyrics;

  @JsonKey(includeFromJson: false)
  @HiveField(5)
  final String? translatedLyrics;

  const TrackModel({
    required this.id,
    required this.title,
    required this.author,
    required this.posterUrl,
    this.originalLyrics,
    this.translatedLyrics,
  });

  factory TrackModel.fromJson(Map<String, dynamic> json) =>
      _$TrackModelFromJson(json);

  TrackEntity toEntity() => TrackEntity(
    id: id,
    title: title,
    author: author,
    posterUrl: posterUrl,
    originalLyrics: originalLyrics ?? '',
    translatedLyrics: translatedLyrics ?? '',
  );

  factory TrackModel.fromEntity(TrackEntity track) => TrackModel(
    id: track.id,
    title: track.title,
    author: track.author,
    posterUrl: track.posterUrl,
    originalLyrics: track.originalLyrics,
    translatedLyrics: track.translatedLyrics,
  );

  TrackModel copyWith({
    int? id,
    String? title,
    String? author,
    String? posterUrl,
    String? originalLyrics,
    bool? isFavorite,
  }) {
    return TrackModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      posterUrl: posterUrl ?? this.posterUrl,
      originalLyrics: originalLyrics ?? this.originalLyrics,
    );
  }

  @override
  List<Object?> get props => [id, title, author, posterUrl];
}
