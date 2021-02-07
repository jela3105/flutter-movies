import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/models/actors_model.dart';

class MoviesProvider {
  String _apikey = '89dfc9b9b3c6b18b70807e9e688aa95e';
  String _url = 'api.themoviedb.org';
  String _language = 'en-US';
  int _popularPage = 0;
  bool _loading = false;

  List<Movie> _popular = new List();
  final _popularStream = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularSink => _popularStream.sink.add;

  Stream<List<Movie>> get popularStream => _popularStream.stream;

  void disposeStreams() {
    _popularStream?.close();
  }

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _language,
    });

    return _processResponse(url);
  }

  Future<List<Movie>> getPopular() async {
    if (_loading) return [];
    _loading = true;
    _popularPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': _popularPage.toString(),
    });

    final resp = await _processResponse(url);
    _popular.addAll(resp);
    popularSink(_popular);
    _loading = false;
    return resp;
  }

  Future<List<Actor>> getCast(String movieId) async {
    final url = Uri.https(_url, '3/movie/$movieId/credits', {
      'api_key': _apikey,
      'language': _language,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final cast = new Cast.fromJsonList(decodedData['cast']);
    return cast.actors;
  }

  Future<List<Movie>> _processResponse(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }
}
