//Packages Imports
import 'package:rxdart/rxdart.dart';
//Pages Imports
import '../resources/repository.dart';
import '../models/item.dart';

//Bloc Class
class StoriesBloc {
  //Variables and Keys
  final _topIds = PublishSubject<List<int>>();
  final _repository = Repository();
  //Getters to Streams
  Observable<List<int>> get topIds => _topIds.stream;
  //Methods
  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  dispose() {
    _topIds.close();
  }
}
