import "dart:convert";
import 'package:synapseslabs/models/category.dart';

class Transaction{
  Transaction();

  int id;
  String detail;
  int category_id;
  num value;
  String date;
  int account_id;

  Category category;

  static final columns = ["id", "detail", "category_id", "value", "date", "account_id"];

  Map<String, dynamic> toMap(){
    Map <String, dynamic> map = {
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