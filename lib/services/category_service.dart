import 'package:sqflite/sqflite.dart';
import 'package:synapseslabs/models/category.dart';
import 'package:synapseslabs/services/database_client.dart';

class CategoryService {
  DatabaseClient _database;

  static final CategoryService _instance = CategoryService.internal();

  factory CategoryService() => _instance;

  CategoryService.internal(){
    _database = DatabaseClient();
  }

  Future<Category> upsertCategory(Category category) async{
    var DB = await _database.db;

    var count = Sqflite.firstIntValue(await DB.rawQuery("SELECT COUNT(*) FROM category WHERE name = ?", [category.name]));

    if( count == 0){
      category.id = await DB.insert("categories", category.toMap());
    }else{
      await DB.update("categories", category.toMap(), where: "id = ?", whereArgs: [category.id]);
    }

    return category;
  }

  Future<Category> fetchCategory(int id) async{
    var DB = await _database.db;

    List<Map> results = await DB.query("categories", columns: Category.columns, where: "id = ?", whereArgs: [id]);
    return Category.fromMap(results[0]);
  }
}