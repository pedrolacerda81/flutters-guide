//Packages Imports
import 'package:http/http.dart' show Client;
import 'dart:convert';

//Pages Imports
import '../models/item.dart';

//Class
class NewsApiProvider {
  //Variables and Keys
  Client client = Client();
  String _rootUrl = 'https://hacker-news.firebaseio.com/v0';
  //Methods
  fetchTopIds() async {
    final response = await client.get('$_rootUrl/topstories.json');
    final ids = json.decode(response.body);
    return ids;
  }

  fetchItem(int id) async {
    final response = await client.get('$_rootUrl/item/$id.json');
    final parsedJson = json.decode(response.body);
    return Item.fromJson(parsedJson);
  }
}
