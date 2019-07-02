import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Página no encontrada' ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon( Icons.warning ),
            Text( 'La página solicitada no existe, favor de verificar.' )
          ],
        )
      )
    );
  }

}