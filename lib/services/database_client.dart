import "dart:async";
import "dart:io";
import "package:path/path.dart";
import "package:sqflite/sqflite.dart";
import "package:path_provider/path_provider.dart";
import 'package:synapseslabs/models/category.dart';
import 'package:synapseslabs/models/transaction.dart' as Tx;

class DatabaseClient{
  static final DatabaseClient _instance = DatabaseClient.internal();

  factory DatabaseClient() => _instance;

  DatabaseClient.internal();

  Database _db;

  Future<Database> get db async{
    if(_db != null){
      return _db;
    }else{
      _db = await initDb();
      return _db;
    }
  }

  Future initDb() async{
    Directory path = await getApplicationDocumentsDirectory();
    String dbPath = join(path.path, 'database.db');

    return await openDatabase(dbPath, version: 1, onCreate: this._create);
  }

  Future _create(Database db, int version) async{
    // Categories table
    await db.execute("""
            CREATE TABLE categories (
              id INTEGER PRIMARY KEY,
              name TEXT NOT NULL,
              type INTEGER NOT NULL
            )
        """);

    // Transactions table
    await db.execute("""
            CREATE TABLE transactions (
              id INTEGER PRIMARY KEY,
              detail TEXT NOT NULL,
              category_id INTEGER NOT NULL,
              value FLOAT NOT NULL,
              date TEXT NOT NULL,
              account_id INTEGER NOT NULL,
              FOREIGN KEY (category_id) REFERENCES category (id)
                ON DELETE NO ACTION ON UPDATE NO ACTION
            )
        """);

  }

}