import 'package:profile/presentation/journey/main/main_routes.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static Map<String, WidgetBuilder> getAll() => {
        ...MainRoutes.all(),
      };
}
