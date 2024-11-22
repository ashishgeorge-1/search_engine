// lib/providers/search_provider.dart
import 'package:flutter/foundation.dart';
import '../models/search_result.dart';
import '../services/search_service.dart';

class SearchProvider with ChangeNotifier {
  final SearchService _searchService = SearchService();
  List<SearchResult> _searchResults = [];
  bool _isLoading = false;
  String _error = '';

  List<SearchResult> get searchResults => _searchResults;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> search(String query) async {
    if (query.isEmpty) {
      _searchResults = [];
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _searchResults = await _searchService.search(query);
    } catch (e) {
      _error = e.toString();
      _searchResults = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
