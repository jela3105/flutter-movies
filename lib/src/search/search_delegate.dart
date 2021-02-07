import 'package:flutter/material.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/providers/movies_provider.dart';

class DataSearch extends SearchDelegate {
  String selected = '';
  final moviesProvider = new MoviesProvider();
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
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: moviesProvider.searchMovie(query),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          final movies = snapshot.data;
          return ListView(
            children: movies.map((movie) {
              return ListTile(
                  leading: FadeInImage(
                    image: NetworkImage(movie.getPosterImg()),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                  ),
                  title: Text(movie.title),
                  subtitle: Text(movie.originalTitle),
                  onTap: () {
                    close(context, null);
                    movie.uniqueId = '';
                    Navigator.pushNamed(context, 'detail', arguments: movie);
                  });
            }).toList(),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
