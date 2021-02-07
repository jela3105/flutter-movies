import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  String selected = '';
  final movies = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam',
    'Wonder Woman',
    'Soul',
  ];

  final recentMovies = ['Spiderman', 'Captain America'];

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions of our app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icon to the left of the appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Create the results we are gonne show
    return Center(
        child: Container(
      height: 100.0,
      width: 100.0,
      color: Colors.blueAccent,
      child: Text(selected),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Are the suggest show when the person writes

    final suggestedList = (query.isEmpty)
        ? recentMovies
        : movies
            .where((m) => m.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestedList.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(suggestedList[i]),
          onTap: () {
            selected = suggestedList[i];
            showResults(context);
          },
        );
      },
    );
  }
}
