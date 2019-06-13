class ValidationMixin {
  String validationEmail(String value) {
    if (value.isEmpty ||
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return 'Please, enter a valid email.';
    }
    return null;
  }

  String validationPass(String value) {
    if (value.isEmpty) {
      return 'Please, enter a password.';
    } else if (value.length < 6) {
      return 'Password must have at least 6 characters.';
    }
    return null;
  }
}
