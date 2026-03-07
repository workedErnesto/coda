import 'package:coda/core/domain/entity/track_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'track_model.g.dart';

@JsonSerializable()
class TrackModel extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'primary_artist_names')
  final String author;

  @JsonKey(name: 'song_art_image_url')
  final String posterUrl;

  @JsonKey(includeFromJson: false)
  final String? originalLyrics;

  const TrackModel({
    required this.id,
    required this.title,
    required this.author,
    required this.posterUrl,
    this.originalLyrics,
  });

  factory TrackModel.fromJson(Map<String, dynamic> json) =>
      _$TrackModelFromJson(json);

  TrackEntity toEntity() => TrackEntity(
    id: id,
    title: title,
    author: author,
    posterUrl: posterUrl,
    originalLyrics: originalLyrics ?? 'kek',
  );

  TrackModel copyWith({
    int? id,
    String? title,
    String? author,
    String? posterUrl,
    String? originalLyrics,
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
