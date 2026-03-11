class TrackEntity {
  final int id;
  final String title;
  final String author;
  final String posterUrl;
  final String originalLyrics;
  final String? translatedLyrics;

  TrackEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.posterUrl,
    required this.originalLyrics,
    this.translatedLyrics,
  });

  TrackEntity copyWith({
    int? id,
    String? title,
    String? author,
    String? posterUrl,
    String? originalLyrics,
    String? translatedLyrics,
    bool? isFavorite,
  }) {
    return TrackEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      posterUrl: posterUrl ?? this.posterUrl,
      originalLyrics: originalLyrics ?? this.originalLyrics,
      translatedLyrics: translatedLyrics ?? this.translatedLyrics,
    );
  }
}
