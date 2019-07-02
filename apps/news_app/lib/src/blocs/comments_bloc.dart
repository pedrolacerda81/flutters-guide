//Packages Imports
import 'package:rxdart/rxdart.dart';
import 'dart:async';
//Pages Imports
import '../resources/repository.dart';
import '../models/item.dart';

//Bloc Class
class CommentsBloc {
  final _repository = Repository();
  final _commentsFetcher = PublishSubject<int>();
  final _commentsOutput = BehaviorSubject<Map<int, Future<Item>>>();

  //Getters to Streams
  Observable<Map<int, Future<Item>>> get itemWithComments =>
      _commentsOutput.stream;

  //Getters to Sinks
  Function(int) get fetchItemWithComments => _commentsFetcher.sink.add;

  //Constuctor Method
  CommentsBloc() {
    _commentsFetcher.stream
        .transform(_commentsTransformer())
        .pipe(_commentsOutput);
  }
  //Transformer Methods
  _commentsTransformer() {
    return ScanStreamTransformer<int, Map<int, Future<Item>>>(
      (cache, int id, int index) {
        print(index);
        cache[id] = _repository.fetchItem(id);
        cache[id].then((Item item) {
          item.kids.forEach((kidId) => fetchItemWithComments(kidId));
          return cache;
        });
      },
      <int, Future<Item>>{},
    );
  }

  //Methods
  dispose() {
    _commentsFetcher.close();
    _commentsOutput.close();
  }
}
