import 'package:flutter/material.dart';
import 'package:form_validation_with_mixin/src/routes.dart';

class HomePage extends StatelessWidget {
  final String _signInButtonText = 'SIGN IN';
  final String _signUpButtonText = 'SIGN UP';
  final double _defaultPaddingValue = 8.0;

  const HomePage({Key? key}) : super(key: key);

  static pushPage(BuildContext context) {
    Navigator.pushNamed(context, RouteName.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(_defaultPaddingValue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _onPressedSignInButton(context),
                child: Text(_signInButtonText),
              ),
              Padding(padding: EdgeInsets.only(top: _defaultPaddingValue)),
              ElevatedButton(
                onPressed: () => _onPressedSignUpButton(context),
                child: Text(_signUpButtonText),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressedSignInButton(BuildContext context) {
    Navigator.of(context).pushNamed(RouteName.signIn);
  }

  void _onPressedSignUpButton(BuildContext context) {
    Navigator.of(context).pushNamed(RouteName.signUp);
  }
}
