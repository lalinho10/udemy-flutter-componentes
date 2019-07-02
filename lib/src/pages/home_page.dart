import 'package:flutter/material.dart';

import 'package:componentes/providers/menu.provider.dart';
import 'package:componentes/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Componentes' ),
      ),
      body: _crearListView()
    );
  }

  Widget _crearListView() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ) {
        return ListView(
          children: _crearListTiles( snapshot.data, context ),
        );
      },
    );
  }

  List<Widget> _crearListTiles( List<dynamic> data, BuildContext context ) {
    final List<Widget> opciones = [];

    data.forEach( ( item ) {
      final widget = ListTile(
        leading: getIcon( item[ 'icon' ] ),
        title: Text( item[ 'texto' ] ),
        trailing: Icon( Icons.keyboard_arrow_right, color: Colors.blue ),
        onTap: (){

          Navigator.pushNamed( context, '/' + item[ 'ruta' ] );

        }
      );

      opciones..add( widget )
              ..add( Divider() );
    });

    return opciones;    
  }

}