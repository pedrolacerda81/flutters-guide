import 'dart:async';

class Cake {}

class Order {
  String type;
  Order(this.type);
}

void main() {
  final _streamController = StreamController();

  final orderOne = Order('banana');
  final orderTwo = Order('chocolate');

  final baker = StreamTransformer.fromHandlers(handleData: (cakeType, sink) {
    if (cakeType == 'chocolate') {
      sink.add(new Cake());
    } else {
      sink.addError('I cant bake that type!');
    }
  });

  _streamController.sink.add(orderOne);
  _streamController.sink.add(orderTwo);

  _streamController.stream.map((order) => order.type).transform(baker).listen(
      (cake) => print('Here is your cake $cake.'),
      onError: (err) => print(err));
}
/*******************************************************/
import 'dart:html';

void main() {
  
  final ButtonElement button = querySelector('button');
  final InputElement input = querySelector('input');
  
  
  button.onClick
    	.take(4)
    	.where((e) => input.value == 'banana')
    	.listen(
    		(e) => print('You got it!'),
    		onDone: () => print('Nope, bad guesses :(')
  	);
}
/*******************************************************/

import 'dart:html';
import 'dart:async';

void main() {
  final InputElement input = querySelector('input');
  final DivElement div = querySelector('div');
  
  final _validator = new StreamTransformer.fromHandlers(
  			handleData: (inputValue, sink) {
          if (inputValue.contains('@')) {
            sink.add(inputValue);
          } else {
            sink.addError('Enter a valid email.');
          }
        }	
  	);
  //div.innerHtml = 'Enter a valid email.';
  input.onInput
    .map((dynamic e) => e.target.value)
    .transform(_validator)
    .listen((inputValue) => div.innerHtml = '',
           onError: (err) => div.innerHtml = err);
}

/*******************************************************/

import 'dart:async';

void main() {
  final bloc = Bloc();
  
  /* bloc.emailController.stream.listen((value) {
    print(value);
  }); */
  
  bloc.email.listen((value) {
    print(value);
  });
  
  bloc.pass.listen((value) {
    if(value.isEmpty || value.length < 4) {
      print('Invalid pass.');
    } else {
      print('Valid pass.');
    }
  });
  
 // bloc.emailController.sink.add('My New Email');
  bloc.changeEmail('My Hello');
  bloc.changePass('123');
  bloc.changeEmail('pedro@email.com');
  bloc.changePass('1233456');
}

class Bloc {
  final emailController = StreamController<String>();
  final passController = StreamController<String>();
  // Add data to stream
  Function(String) get changeEmail => emailController.sink.add;
  Function(String) get changePass => passController.sink.add;
  // Retrieve data from stream
  Stream<String> get email => emailController.stream;
  Stream<String> get pass => passController.stream;
}
