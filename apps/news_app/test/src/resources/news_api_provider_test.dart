//Packages Imports
import 'package:news_app/src/resources/news_api_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart';
import 'dart:convert';
//Pages Imports

//Main Method
void main() {
  //Test Methods
  test('FetchTopIds returns a list of ids<int>', () async {
    final newsApi = NewsApiProvider();
    // mockClient returns our requests. Whatever we put in that client
    // is what our code thinks that is been return
    newsApi.client = MockClient((Request request) async {
      // you can use the request :)
      //creating a fake list of ids
      return Response(json.encode([1, 2, 3, 4]), 200);
    });
    // call the function thar we want to test
    final ids = await newsApi.fetchTopIds();
    // declares a expectation value
    expect(ids, [1, 2, 3, 4]);
  });

  test('FetchItem returns a Item (model)', () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((Request request) async {
      final jsonMap = {'id': 123};
      return Response(json.encode(jsonMap), 200);
    });

    final item = await newsApi.fetchItem(81); // random number

    expect(item.id, 123);
  });
}

/* EXAMPLE 
  test('sumTwo returns a sum<int>', () {
     setup of test case
    final sum = 1 + 3;
     expectation
    expect(sum, 4); 
  });
*/
