//Packages Imports
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'dart:async';

//Pages Imports
import '../models/item.dart';
import 'repository.dart';

//Class
class NewsApiProvider implements Source {
  //Variables and Keys
  Client client = Client();
  String _rootUrl = 'https://hacker-news.firebaseio.com/v0';
  //Methods
  Future<List<int>> fetchTopIds() async {
    final response = await client.get('$_rootUrl/topstories.json');
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  Future<Item> fetchItem(int id) async {
    final response = await client.get('$_rootUrl/item/$id.json');
    final parsedJson = json.decode(response.body);
    return Item.fromJson(parsedJson);
  }
}
