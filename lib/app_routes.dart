import 'package:flutter/material.dart';
// Models
import 'package:flutter_06_auth/shared/models/_models.dart';
// Auth routes
import 'package:flutter_06_auth/auth/routes.dart';
// Home routes
import 'package:flutter_06_auth/home/routes.dart';

class AppRoutes {
  static final appRoutes = <RouteModel>[...homeRoutes, ...authRoutes];

  static Map<String, Widget Function(BuildContext)> generateRoutes() {
    final Map<String, Widget Function(BuildContext)> routes = {};
    for (final route in appRoutes) {
      routes.addAll({route.routeName: (ctx) => route.screen});
    }
    return routes;
  }
}
