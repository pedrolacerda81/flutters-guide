//Packages Imports
import 'dart:async';

//Classes
class Validators {
  //Validation Methods
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.isNotEmpty && email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
    }
  });

  final validadePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.isNotEmpty && password.length > 4) {
      sink.add(password);
    } else {
      sink.addError('Password must be at least 4 characters');
    }
  });

  final toggleObscureText = StreamTransformer<bool, bool>.fromHandlers(
      handleData: (obscureText, sink) {
    obscureText = !obscureText;
  });
  /**/
}
