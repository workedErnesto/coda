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
}
