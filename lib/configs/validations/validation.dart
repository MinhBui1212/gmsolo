//validation
mixin ValidationType {
  static const String email = 'email';
  static const String password = 'password';
  static const String phone = 'phone';
  static const String required = 'required';
}

mixin ValidationMixin {
  bool isRequired(String? input) {
    return input != null && input.isNotEmpty;
  }

  bool isPasswordValid(String inputPassword) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,12}$';
    RegExp regexp = RegExp(pattern);
    return regexp.hasMatch(inputPassword);
  }

  bool isEmailValid(String inputEmail) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))';
    RegExp regexp = RegExp(pattern);
    return regexp.hasMatch(inputEmail);
  }
}
