import 'package:flutter/material.dart';

import 'routes.dart';

class App extends StatelessWidget {
  final String _appTitle = 'Form Validation Mixin';

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      theme: ThemeData.dark().copyWith(useMaterial3: true),
      routes: routes,
    );
  }
}
