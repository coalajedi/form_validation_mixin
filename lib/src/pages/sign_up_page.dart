import 'package:flutter/material.dart';

import '../mixins/form_validator_mixin.dart';
import '../routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _Controller();

  static pushPage(BuildContext context) {
    Navigator.pushNamed(context, RouteName.signUp);
  }
}

class _Controller extends State<SignUpPage> with FormValidatorMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final String _emailErrorText = 'Invalid email';
  final String _passwordErrorText = 'Invalid password';
  final String _usernameErrorText = 'Required field';

  @override
  Widget build(BuildContext context) => _View(this);

  String? emailValidator(String? value) {
    return isEmailValid(value) ? null : _emailErrorText;
  }

  String? passwordValidator(String? value) {
    return isPasswordValid(value) ? null : _passwordErrorText;
  }

  String? usernameValidator(String? value) {
    return requiredField(value) ? null : _usernameErrorText;
  }

  void onPressedSubmitButton() {
    if (_formKey.currentState?.validate() ?? false) {
      debugPrint(
          '[ APPDEBUG ] _submit(): ${_usernameTextController.value.text}');
      debugPrint('[ APPDEBUG ] _submit(): ${_emailTextController.value.text}');
      debugPrint(
          '[ APPDEBUG ] _submit(): ${_passwordTextController.value.text}');
    }
  }
}

class _View extends StatelessWidget {
  final String _appBarTitle = 'Sign Up';
  final double _defaultPaddingValue = 8.0;
  final String _usernameLabel = 'Username';
  final String _emailLabelText = 'Email';
  final String _passwordLabelText = 'Passowrd';
  final String _submitButtonText = 'SUBMIT';

  final _Controller controller;

  const _View(
    this.controller, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitle)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(_defaultPaddingValue),
          child: Form(
            key: controller._formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: _usernameLabel,
                    filled: true,
                  ),
                  controller: controller._usernameTextController,
                  validator: controller.usernameValidator,
                ),
                Padding(padding: EdgeInsets.only(top: _defaultPaddingValue)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: _emailLabelText,
                    filled: true,
                  ),
                  controller: controller._emailTextController,
                  validator: controller.emailValidator,
                ),
                Padding(padding: EdgeInsets.only(top: _defaultPaddingValue)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: _passwordLabelText,
                    filled: true,
                  ),
                  controller: controller._passwordTextController,
                  validator: controller.passwordValidator,
                ),
                Padding(padding: EdgeInsets.only(top: _defaultPaddingValue)),
                ElevatedButton(
                  onPressed: controller.onPressedSubmitButton,
                  child: Text(_submitButtonText),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
