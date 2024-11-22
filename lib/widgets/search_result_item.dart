// lib/widgets/search_result_item.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/search_result.dart';

class SearchResultItem extends StatelessWidget {
  final SearchResult result;

  const SearchResultItem({
    Key? key,
    required this.result,
  }) : super(key: key);

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(result.url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        title: InkWell(
          onTap: _launchUrl,
          child: Text(
            result.title,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(result.description),
        ),
      ),
    );
  }
}