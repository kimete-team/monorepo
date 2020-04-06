import 'package:flutter/material.dart';
import 'package:kimete/core/constants.dart';

import './router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'kimete',
            theme: ThemeData(
                primarySwatch: Colors.blue,
            ),
            initialRoute: RoutePaths.Home,
            onGenerateRoute: Router.generateRoute,
        );
    }
}
