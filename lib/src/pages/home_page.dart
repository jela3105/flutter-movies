import 'package:flutter/material.dart';

import 'package:movies/src/providers/movies_provider.dart';
import 'package:movies/src/providers/movies_provider.dart';
import 'package:movies/src/widges/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
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
        child: Column(children: <Widget>[_swiperCards()]),
      ),
    );
  }

  Widget _swiperCards() {
    final moviesProvider = new MoviesProvider();
    moviesProvider.getPopular();
    return CardSwiper(
      movies: [1, 2, 3, 4, 5],
    );
  }
}
