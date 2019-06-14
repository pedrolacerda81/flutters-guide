/* import 'dart:html';

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
} */
/*******************************************************/

import 'dart:html';
import 'dart:async';

void main() {
  final InputElement input = querySelector('input');
  final DivElement div = querySelector('div');

  final _validator =
      new StreamTransformer.fromHandlers(handleData: (inputValue, sink) {
    if (inputValue.contains('@')) {
      sink.add(inputValue);
    } else {
      sink.addError('Enter a valid email.');
    }
  });
  //div.innerHtml = 'Enter a valid email.';
  input.onInput.map((dynamic e) => e.target.value).transform(_validator).listen(
      (inputValue) => div.innerHtml = '',
      onError: (err) => div.innerHtml = err);
}
