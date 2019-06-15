import 'dart:async';

class LoginBloc {
  // streamController gives the sink and stream
  final _email = StreamController<String>();
  final _pass = StreamController<String>();
  // Geters that allow add data to stream
  Stream<String> get email => _email.stream;
  Stream<String> get password => _pass.stream;
  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePass => _pass.sink.add;
}
