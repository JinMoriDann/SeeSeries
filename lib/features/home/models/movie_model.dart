class SerieModel {
  final int id;
  final String url;
  final String name;
  final List<String> genres;
  final double rating;
  final String urlImageMedium;
  final String urlImageOriginal;
  final String summary;

  const SerieModel({
    required this.id,
    required this.url,
    required this.name,
    required this.genres,
    required this.rating,
    required this.urlImageMedium,
    required this.urlImageOriginal,
    required this.summary,
  });

  factory SerieModel.fromJson(Map<String, dynamic> json) {
    return SerieModel(
      id: json['id'] ?? 0,
      url: json['url'] ?? '',
      name: json['name'] ?? '',
      genres:
          (json['genres'] as List?)?.map((e) => e.toString()).toList() ?? [],
      rating: (json['rating']?['average'] as num?)?.toDouble() ?? 0.0,
      urlImageMedium: json['image']?['medium'] ?? '',
      urlImageOriginal: json['image']?['original'] ?? '',
      summary: _cleanSummary(json['summary'] ?? ''),
    );
  }

  static String _cleanSummary(String htmlText) {
    final regex = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: false);
    return htmlText.replaceAll(regex, '').trim();
  }
}
