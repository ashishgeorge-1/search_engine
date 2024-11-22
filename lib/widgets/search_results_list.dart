// lib/widgets/search_results_list.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/search_provider.dart';
import 'search_result_item.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, searchProvider, _) {
        if (searchProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (searchProvider.error.isNotEmpty) {
          return Center(
            child: Text(
              searchProvider.error,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (searchProvider.searchResults.isEmpty) {
          return const Center(
            child: Text('No results found'),
          );
        }

        return ListView.builder(
          itemCount: searchProvider.searchResults.length,
          itemBuilder: (context, index) {
            final result = searchProvider.searchResults[index];
            return SearchResultItem(result: result);
          },
        );
      },
    );
  }
}