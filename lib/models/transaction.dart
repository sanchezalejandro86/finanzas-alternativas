import "dart:convert";
import 'package:synapseslabs/models/category.dart';

class Transaction{
  Transaction();

  int id;
  String detail;
  int category_id;
  num value;
  DateTime date;
  int account_id;

  Category category;

  static final columns = ["id", "detail", "category_id", "value", "date", "account_id"];

  Map toMap(){
    Map map = {
      "detail": detail,
      "category_id": category_id,
      "value": value,
      "date": date,
      "account_id": account_id
    };

    if(id != null){
      map["id"] = id;
    }

    return map;
  }

  static fromMap(Map map){
    Transaction transaction = Transaction();
    transaction.id = map["id"];
    transaction.detail = map["detail"];
    transaction.category_id = map["category_id"];
    transaction.account_id = map["account_id"];
    transaction.value = map["value"];
    transaction.date = map["date"];

    return transaction;
  }
}