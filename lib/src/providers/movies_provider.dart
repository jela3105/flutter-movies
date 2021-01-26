import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movies/src/models/movie_model.dart';

class MoviesProvider {
  String _apikey = '89dfc9b9b3c6b18b70807e9e688aa95e';
  String _url = 'api.themoviedb.org';
  String _language = 'en-US';

  Future<List<Movie>> getPopular() async {
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }
}
