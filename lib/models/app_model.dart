import 'package:flutter/foundation.dart';
import 'package:synapseslabs/models/transaction.dart';

class AppModel with ChangeNotifier{
  List<Transaction> transactions = List();

  double total = 0, income = 0, expenses = 0;

  DateTime actualDate = DateTime.now();

  void addAll(List<Transaction> result) {
    this.transactions = result;
    _refreshData();
    notifyListeners();
  }

  void add(Transaction tx){
    this.transactions.add(tx);
    _refreshData();
    notifyListeners();
  }

  void _refreshData(){
    this.total = 0;
    this.income = 0;
    this.expenses = 0;

    transactions.forEach((element) {
      total += element.value;
      if(element.value > 0){
        income += element.value;
      }else{
        expenses += element.value;
      }
    });
  }

}