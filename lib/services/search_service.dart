// lib/services/search_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/search_result.dart';

class SearchService {
  // Using DuckDuckGo API as an example (you may need to adjust based on the actual API)
  static const String baseUrl = 'https://api.duckduckgo.com/';

  Future<List<SearchResult>> search(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl?q=$query&format=json'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['RelatedTopics'] ?? [];
        
        return results.map((result) => SearchResult.fromJson({
          'title': result['Text']?.split(' - ').first ?? '',
          'description': result['Text'] ?? '',
          'url': result['FirstURL'] ?? '',
        })).toList();
      } else {
        throw Exception('Failed to fetch search results');
      }
    } catch (e) {
      throw Exception('Error performing search: $e');
    }
  }
}