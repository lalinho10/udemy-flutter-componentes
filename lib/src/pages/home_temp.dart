
import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final colores = [ 'Blanco', 'Azul', 'Negro', 'Verde', 'Rojo', 'Amarillo', 'Rosa', 'Café', 'Gris', 'Morado' ];

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Componentes' )
      ),
      body: Center(
        child: ListView(
          children: _crearListTilesCorta()
        )
      )
    );
  }

  /*List<Widget> _crearListTiles() {
    List<Widget> lista = new List<Widget>();

    for ( String color in colores ) {
      final listTile = new ListTile(
        title: Text( color ),
      );

      lista..add( listTile )
           ..add( Divider() );
    }

    return lista;
  }*/

  List<Widget> _crearListTilesCorta() {
    return colores.map(( String color ) {
      return Column(
        children: <Widget> [
          ListTile(
            leading: Icon( Icons.account_balance_wallet ),
            title: Text( color ),
            trailing: Icon( Icons.keyboard_arrow_right ),
            onTap: (){},
          ),
          Divider()
        ]
      );
    }).toList();
  }
}