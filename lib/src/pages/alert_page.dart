import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Alerts' ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text( 'Presiona el botón para mostrar una alerta.' ),
            RaisedButton(
              child: Text( 'Alerta' ),
              color: Colors.blue,
              textColor: Colors.white,
              shape: StadiumBorder(),
              onPressed: () => _showAlert( context )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.flip_to_back ),
        onPressed: () {
          Navigator.pop( context );
        }
      ),
    );
  }

  void _showAlert( BuildContext context ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ( context ) {
        return AlertDialog(
          title: Text( 'Título de la modal' ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text( 'Contenido de la modal' ),
              FlutterLogo( size: 80.0 )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text( 'Cancelar' ),
              onPressed: () => Navigator.of( context ).pop(),
            ),
            FlatButton(
              child: Text( 'Continuar' ),
              onPressed: (){
                Navigator.of( context ).pop();
              },
            )
          ]
        );
      }
    );
  }
}