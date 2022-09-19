import 'package:flutter/material.dart';

import '../mixins/form_validator_mixin.dart';
import '../routes.dart';

class SignIn extends StatelessWidget with FormValidatorMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final String _appBarTitle = 'Sign In';
  final double _defaultPaddingValue = 8.0;
  final String _emailLabelText = 'Email';
  final String _emailErrorText = 'Invalid email';
  final String _passwordLabelText = 'Passowrd';
  final String _passwordErrorText = 'Invalid password';
  final String _submitButtonText = 'SUBMIT';

  SignIn({Key? key}) : super(key: key);

  static pushPage(BuildContext context) {
    Navigator.pushNamed(context, RouteName.signIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitle)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(_defaultPaddingValue),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: _emailLabelText,
                    filled: true,
                  ),
                  controller: _emailTextController,
                  validator: (value) {
                    return isEmailValid(value) ? null : _emailErrorText;
                  },
                ),
                Padding(padding: EdgeInsets.only(top: _defaultPaddingValue)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: _passwordLabelText,
                    filled: true,
                  ),
                  controller: _passwordTextController,
                  validator: (value) =>
                      isPasswordValid(value) ? null : _passwordErrorText,
                ),
                Padding(padding: EdgeInsets.only(top: _defaultPaddingValue)),
                ElevatedButton(
                  onPressed: _onPressedSubmitButton,
                  child: Text(_submitButtonText),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPressedSubmitButton() {
    if (_formKey.currentState?.validate() ?? false) {
      debugPrint('[ APPDEBUG ] _submit(): Signed in!!');
    }
  }
}
