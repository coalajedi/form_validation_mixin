mixin FormValidatorMixin {
  bool requiredField(String? value) => value?.isNotEmpty ?? false;

  bool isPasswordValid(String? value) =>
      requiredField(value) && value!.length >= 8;

  bool isEmailValid(String? value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern.toString());
    return requiredField(value) && regex.hasMatch(value!);
  }
}
