import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text( 'Avatar' ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only( right: 20.0 ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage( 'https://vignette.wikia.nocookie.net/lossimpson/images/c/cf/Harry_Potter.png/revision/latest?cb=20110718030202&path-prefix=es' )
                  ),
                  SizedBox( width: 15.0 ),
                  CircleAvatar(
                    child: Text( 'HP' ),
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  )
                ],
              )
            )
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all( 15.0 ),
                child: Text( 'Avatar' )
              ),
              FadeInImage(
                placeholder: AssetImage( 'assets/img/jar-loading.gif' ),
                image: NetworkImage( 'https://vignette.wikia.nocookie.net/lossimpson/images/1/1a/Harry_Potter2.png/revision/latest?cb=20110209022812&path-prefix=es' )
              )
            ],
          )
        )
      )
    );
  }

}