import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

 
import 'package:componentes/routes/routes.dart';
import 'package:componentes/src/pages/not_found_page.dart';

void main() => runApp( MyApp() );
 
class MyApp extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('es')
      ],
      routes: getAppRoutes(),
      onUnknownRoute: ( RouteSettings settings ) {
        return new MaterialPageRoute(
          builder: ( context ) => NotFoundPage()
        );
      }
    );
  }

}