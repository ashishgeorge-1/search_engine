import 'package:flutter/material.dart' hide SearchBar;
import '../widgets/search_bar.dart';
import '../widgets/search_results_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web Search'),
      ),
      body: Column(
        children: [
          const SearchBar(),
          const Expanded(
            child: SearchResultsList(),
          ),
        ],
      ),
    );
  }
}