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
