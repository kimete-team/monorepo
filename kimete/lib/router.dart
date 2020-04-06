import 'package:flutter/material.dart';
import 'package:kimete/core/constants.dart';
import 'package:kimete/widgets/home.dart';

class Router {
    static Route generateRoute(RouteSettings settings) {
        switch (settings.name) {
            case RoutePaths.Home:
                return MaterialPageRoute(builder: (_) => Home());
            default:
                return MaterialPageRoute(
                    builder: (_) => Scaffold(
                        body: Center(
                            child: Text(
                                "No route defined for ${settings.name}"
                            ),
                        ),
                    )
                );
        }
    }
}
