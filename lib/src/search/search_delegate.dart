import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
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
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Are the suggest show when the person writes
    return Container();
  }
}
