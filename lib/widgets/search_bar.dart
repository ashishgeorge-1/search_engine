// lib/widgets/search_bar.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/search_provider.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.search(_searchController.text);
  }

  void _clearSearch(BuildContext context) {
    _searchController.clear();
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.search('');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => _clearSearch(context),
          ),
        ),
        onSubmitted: (_) => _performSearch(context),
      ),
    );
  }
}