// lib/models/search_result.dart
class SearchResult {
  final String title;
  final String description;
  final String url;

  SearchResult({
    required this.title,
    required this.description,
    required this.url,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
    );
  }
}