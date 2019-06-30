//Packages Imports
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io';

//Pages Imports
import '../models/item.dart';
import 'repository.dart';

//Class
class NewsDbProvider implements Source, Cache {
  //Varibles
  Database db;
  //Constructor
  NewsDbProvider() {
    init();
  }
  //Init Method
  //thats because the constructor cant be async
  void init() async {
    // get the directory
    Directory documentsDerectory = await getApplicationDocumentsDirectory();
    //declares a path
    final path = join(documentsDerectory.path, 'items1.db');
    //open or create the db
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, version) {
        newDb.execute("""
          CREATE TABLE Items(
            id INTEGER PRIMARY KEY,
            deleted INTEGER,
            type TEXT,
            by TEXT,
            time TEXT,
            text TEXT,
            dead INTEGER,
            parent INTEGER,
            kids BLOB,
            url TEXT,
            score INTEGER,
            title TEXT,
            descendants INTEGER
          )
        """);
      },
    );
  }

  //Other Methods
  Future<Item> fetchItem(int id) async {
    final itemsMaps = await db.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );

    if (itemsMaps.length > 0) {
      return Item.fromDb(itemsMaps.first);
    }

    return null;
  }

  //TODO: Store and fetch top ids.
  Future<List<int>> fetchTopIds() {
    return null;
  }

  Future<int> addItem(Item item) {
    return db.insert("Items", item.toMapForDb(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}

//Opened Instance
final newsDbProvider = NewsDbProvider();
