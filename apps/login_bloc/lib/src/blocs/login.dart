//Packages Imports
import 'dart:async';
//Pages Imports
import './validators.dart';

// Classes
class LoginBloc extends Object with Validators {
  //Variables
  // streamController gives the sink and stream
  final _email = StreamController<String>();
  final _pass = StreamController<String>();
  // Geters that allow add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _pass.stream.transform(validadePassword);
  // Change data of the stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePass => _pass.sink.add;
  // dispose function to close the stream controllers
  dispose() {
    _email.close();
    _pass.close();
  }
}

// The instance of Bloc that is exported to other models
final loginBloc = LoginBloc();
