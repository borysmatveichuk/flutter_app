import 'dart:io';
import 'package:flutter_app/model/Client.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class Tables {
  Tables._();

  static const String CLIENT = "Client";
}

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
//    print("tables: ");
//    print(await _database.query("sqlite_master"));
//    print("dump: ");
//    print(await _database.query(Tables.CLIENT));
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "FlutterAppDb.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(createUserTableSql);
    });
  }

  Future<int> insertClient(Client client) async {
    final db = await database;
    var res = await db.insert(Tables.CLIENT, client.toJson());
    return res;
  }

  Future<List<Client>> getAllClients() async {
    final db = await database;
    var res = await db.query(Tables.CLIENT);
    List<Client> list =
        res.isNotEmpty ? res.map((c) => Client.fromJson(c)).toList() : [];
    return list;
  }

  static final String createUserTableSql =
      "CREATE TABLE IF NOT EXISTS ${Tables.CLIENT} ("
      "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "
      "firstName TEXT, "
      "lastName TEXT, "
      "blocked BIT"
      ")";
}
