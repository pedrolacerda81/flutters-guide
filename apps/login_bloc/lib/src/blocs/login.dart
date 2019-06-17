//Packages Imports
import 'dart:async';
import 'package:rxdart/rxdart.dart';
//Pages Imports
import './validators.dart';

// Classes
class LoginBloc extends Object with Validators {
  //Variables
  // streamController gives the sink and stream
  final _email = BehaviorSubject<String>();
  final _pass = BehaviorSubject<String>();
  // Geters that allow add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _pass.stream.transform(validadePassword);
  //Combine two streams (ReactiveX)
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);
  // Change data of the stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePass => _pass.sink.add;
  // Submit Method
  loginSubmit() {
    final validEmail = _email.value;
    final validPass = _pass.value;

    print('Email: $validEmail');
    print('Pass: $validPass');
  }

  // Dispose function to close the stream controllers
  dispose() {
    _email.close();
    _pass.close();
  }
}

// The instance of Bloc that is exported to other models
// final loginBloc = LoginBloc(); -> global instance approach
