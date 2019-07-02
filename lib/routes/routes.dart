import 'package:flutter/material.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/cards_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/input_fields.dart';
import 'package:componentes/src/pages/list_page.dart';
import 'package:componentes/src/pages/sliders_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/'        : ( BuildContext context ) => HomePage(),
    '/alert'   : ( BuildContext context ) => AlertPage(),
    '/animated': ( BuildContext context ) => AnimatedContainerPage(),
    '/avatar'  : ( BuildContext context ) => AvatarPage(),
    '/card'    : ( BuildContext context ) => CardsPage(),
    '/inputs'  : ( BuildContext context ) => InputFieldsPage(),
    '/slider'  : ( BuildContext context ) => SlidersPage(),
    '/list'    : ( BuildContext context ) => ListPage()
  };
}