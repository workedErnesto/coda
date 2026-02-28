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

  const TrackModel({
    required this.id,
    required this.title,
    required this.author,
    required this.posterUrl,
  });

  factory TrackModel.fromJson(Map<String, dynamic> json) =>
      _$TrackModelFromJson(json);

  @override
  List<Object?> get props => [id, title, author, posterUrl];
}
