import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10.0),
      height: 300.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            "http://via.placeholder.com/350x150",
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        itemWidth: 200.0,
        pagination: new SwiperPagination(),
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
