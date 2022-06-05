import 'package:profile/presentation/app/route_constants.dart';
import 'package:profile/presentation/journey/main/main_routes.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static Map<String, WidgetBuilder> getAll() => {
        ...MainRoutes.all(),
      };

// static Route<dynamic> generateRoute(RouteSettings settings) {
//   WidgetBuilder builder;
//   switch (settings.name) {
//
//   }
//   return MaterialPageRoute(builder: builder, settings: settings);
// }
}
