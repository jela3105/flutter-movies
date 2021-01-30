import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import 'package:movies/src/models/movie_model.dart';

class MoviesProvider {
  String _apikey = '89dfc9b9b3c6b18b70807e9e688aa95e';
  String _url = 'api.themoviedb.org';
  String _language = 'en-US';
  int _popularPage = 0;

  List<Movie> _popular = new List();
  final _popularStream = StreamController();

  Future<List<Movie>> _processResponse(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _language,
    });

    return _processResponse(url);
  }

  Future<List<Movie>> getPopular() async {
    _popularPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': _popularPage.toString(),
    });

    return _processResponse(url);
  }
}
