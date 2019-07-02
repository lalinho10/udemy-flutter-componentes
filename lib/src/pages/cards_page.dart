import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Cards' )
      ),
      body: ListView(
        padding: EdgeInsets.all( 15.0 ),
        children: <Widget>[
          _getListViewCard1(),
          SizedBox( height: 30.0 ),
          _getListViewCard2(),
          SizedBox( height: 30.0 ),
          _getListViewCard1(),
          SizedBox( height: 30.0 ),
          _getListViewCard2(),
          SizedBox( height: 30.0 ),
          _getListViewCard1(),
          SizedBox( height: 30.0 ),
          _getListViewCard2(),
          SizedBox( height: 30.0 ),
          _getListViewCard1(),
          SizedBox( height: 30.0 ),
          _getListViewCard2()
        ],
      )
    );
  }

  Widget _getListViewCard1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular( 20.0 ) ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon( Icons.image, color: Colors.blue ),
            title: Text( 'Título de tarjeta' ),
            subtitle: Text( 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text( 'Cancelar' ),
                onPressed: () {},
              ),
              FlatButton(
                child: Text( 'Continuar' ),
                onPressed: () {},
              )
            ],
          )
        ],
      )
    );
  }

  Widget _getListViewCard2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage( 'assets/img/jar-loading.gif' ),
            image: NetworkImage( 'https://i.ytimg.com/vi/BfCwN4iy6T8/maxresdefault.jpg' ),
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 300,
            fit: BoxFit.cover
          ),
          Container(
            padding: EdgeInsets.all( 15.0 ),
            child: Text( 'Texto de prueba' )
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular( 20.0 ),
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset( 4.0, 10.0 )
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular( 20.0 ),
        child: card
      ),
    );
  }
}