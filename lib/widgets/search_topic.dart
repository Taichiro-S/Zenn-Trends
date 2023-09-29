import 'package:flutter/material.dart';
import '/screens/ranking.dart';

class SearchTopic extends StatefulWidget {
  const SearchTopic({Key? key}) : super(key: key);

  @override
  State<SearchTopic> createState() => _SearchTopicState();
}

class _SearchTopicState extends State<SearchTopic> {
  final _searchController = TextEditingController();
  String? _searchText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Topic'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search topic',
              suffixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                _searchText = value;
              });
            },
          ),
          Expanded(
            child: _searchText == null
                ? const Center(child: Text('Enter a search term'))
                : Ranking(searchText: _searchText!),
          ),
        ],
      ),
    );
  }
}
