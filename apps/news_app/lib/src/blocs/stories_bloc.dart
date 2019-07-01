//Packages Imports
import 'package:rxdart/rxdart.dart';
import 'dart:async';
//Pages Imports
import '../resources/repository.dart';
import '../models/item.dart';

//Bloc Class
class StoriesBloc {
  //Variables and Keys
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<Item>>>();
  final _itemsFetcher = PublishSubject<int>();

  //Getters to Streams
  Observable<List<int>> get topIds => _topIds.stream;
  Observable<Map<int, Future<Item>>> get items => _itemsOutput.stream;

  //Getters to Sinks
  Function(int) get fetchItem => _itemsFetcher.sink.add;

  //Constructor
  //invoked once, makes the itemsTransformer be called once too
  StoriesBloc() {
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
  }

  //Transformer Methods
  _itemsTransformer() {
    return ScanStreamTransformer(
      (Map<int, Future<Item>> cache, int id, int index) {
        print(index);
        cache[id] = _repository.fetchItem(id);
        return cache;
      },
      <int, Future<Item>>{}, //initial valor == empty map
    );
  }

  //Methods
  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  clearCache() {
    return _repository.clearCache();
  }

  dispose() {
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();
  }
}
