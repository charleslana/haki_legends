import 'package:flutter/material.dart';
import 'package:haki_legends/src/pages/battle_page.dart';
import 'package:haki_legends/src/pages/home_page.dart';
import 'package:haki_legends/src/routes/routes.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.battle:
        return MaterialPageRoute(builder: (_) => const BattlePage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
