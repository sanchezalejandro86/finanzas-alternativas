import 'package:synapseslabs/models/transaction.dart';
import 'package:synapseslabs/services/category_service.dart';
import 'package:synapseslabs/services/database_client.dart';

class TransactionService {
  DatabaseClient _database;
  CategoryService _categoryService;

  static final TransactionService _instance = TransactionService.internal();

  factory TransactionService() => _instance;

  TransactionService.internal(){
    _database = DatabaseClient();
    _categoryService = CategoryService();
  }

  Future<List<Transaction>> fetchTransactionsByDate(String date) async{
    var DB = await _database.db;

    //  List<Map> results = await DB.query("transactions", columns: Tx.Transaction.columns, where: "date LIKE '%?%'", whereArgs: [date]);
    List<Map> results = await DB.rawQuery("SELECT * FROM transactions WHERE date LIKE '%$date%'");

    List<Transaction> txs = List();
    results.forEach((result) async{
      Transaction tx = Transaction.fromMap(result);

      //tx.category = await _categoryService.fetchCategory(tx.category_id);

      txs.add(tx);
    });

    return txs;
  }

  Future<Transaction> upsertTransaction(Transaction transaction) async{
    var DB = await _database.db;

    if(transaction.id == null){
      transaction.id = await DB.insert("transactions", transaction.toMap());
    }else{
      await DB.update("transactions", transaction.toMap(), where: "id = ?", whereArgs: [transaction.id]);
    }

    return transaction;
  }

  Future<Transaction> fetchTransaction(int id) async{
    var DB = await _database.db;

    List<Map> results = await DB.query("transactions", columns: Transaction.columns, where: "id = ?", whereArgs: [id]);
    return Transaction.fromMap(results[0]);
  }
}