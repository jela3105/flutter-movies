import 'package:flutter/material.dart';

import 'package:movies/src/providers/movies_provider.dart';
import 'package:movies/src/providers/movies_provider.dart';
import 'package:movies/src/widges/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  final moviesProvider = new MoviesProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies at the cinema'),
        centerTitle: false,
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperCards(),
            footer(context),
          ],
        ),
      ),
    );
  }

  Widget _swiperCards() {
    return FutureBuilder(
      future: moviesProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(movies: snapshot.data);
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text('Popular', style: Theme.of(context).textTheme.subtitle1),
          FutureBuilder(
            future: moviesProvider.getPopular(),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Container(child: Text('Popular'));
            },
          ),
        ],
      ),
    );
  }
}
