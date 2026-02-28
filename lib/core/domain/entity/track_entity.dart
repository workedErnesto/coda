class TrackEntity {
  final String title;
  final String author;
  final String posterUrl;
  final String originalLyrics;
  final String? translatedLyrics;

  TrackEntity({
    required this.title,
    required this.author,
    required this.posterUrl,
    required this.originalLyrics,
    required this.translatedLyrics,
  });
}
