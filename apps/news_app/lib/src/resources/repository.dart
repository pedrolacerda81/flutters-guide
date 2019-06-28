//Packages Imports
import 'dart:async';
//Pages Imports
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item.dart';

//Classes
class Repository {
  //more reusable way
  List<Source> sources = <Source>[
    newsDbProvider,
    NewsApiProvider(),
  ];
  List<Cache> caches = <Cache>[
    newsDbProvider,
  ];
  //TODO: Iterate over sources when NewsDbProvider
  // get fetchTopIds implemented
  Future<List<int>> fetchTopIds() {
    return sources[1].fetchTopIds();
  }

  Future<Item> fetchItem(int id) async {
    Item item;
    var source;

    for (source in sources) {
      item = await source.fetchItem(id);
      if (item != null) {
        break;
      }
    }

    for (var cache in caches) {
      if (cache != source) {
      cache.addItem(item);
      }
    }

    return item;
  }
}

//Abstract Classes
abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<Item> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(Item item);
}
