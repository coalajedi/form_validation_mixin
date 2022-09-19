import 'package:flutter/material.dart';

import 'pages/pages.dart';

class RouteName {
  static const String home = '/';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign-up';
}

Map<String, WidgetBuilder> routes = {
  RouteName.home: (context) => const HomePage(),
  RouteName.signIn: (context) => SignIn(),
  RouteName.signUp: (context) => const SignUpPage(),
};
