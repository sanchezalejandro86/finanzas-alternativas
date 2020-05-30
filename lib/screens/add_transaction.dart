import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:synapseslabs/models/app_model.dart';
import 'package:synapseslabs/models/transaction.dart';
import 'package:synapseslabs/services/transaction_service.dart';

class AddTransactionPage extends StatefulWidget {

  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  double width, height;

  final TextEditingController detailController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  final TransactionService transactionService = TransactionService();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
          children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 50.0, left: 5.0, bottom: 20.0),
                alignment: Alignment.topLeft,
                color: Colors.red,
                child:
                    Padding(
                      padding: const EdgeInsets.only(left: 00.0),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: BackButton(color: Colors.white,),
                              ),
                              Text("New Expense", style: TextStyle(color: Colors.white, fontSize: width * 0.05)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 20.0),
                            child: Row(
                                children: [
                                  Text("Total expense", style: TextStyle(color: Colors.white, fontSize: width * 0.04)),
                                ]
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "\$0.00",
                                          hintStyle: TextStyle(fontSize: 40.0, color: Colors.white),
                                          border: InputBorder.none
                                      ),
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(color: Colors.white, fontSize: 40.0),
                                      autofocus: true,
                                      controller: amountController,
                                    ),
                                  ),
                                ],
                            ),
                          ),
                        ],
                      ),
                    )
              ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Detail',
                        contentPadding: EdgeInsets.all(20.0)
                    ),
                    controller: detailController,
                  ),
                  DropdownButton(
                    value: "One",
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                    onChanged: (String newValue) {
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            )

          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Transaction tx = Transaction();
          tx.detail = detailController.text;
          tx.category_id = 0;
          tx.value = double.parse(amountController.text) * -1;
          tx.date = DateTime(2020, 5, 27).toString();
          tx.account_id = 0;
print(DateTime(2020, 5, 27).toString());
          transactionService.upsertTransaction(tx).then((value)  {
             Provider.of<AppModel>(context, listen: false).add(value);
             Navigator.pop(context);
          });

        },
        tooltip: 'Add Expense',
        child: Icon(Icons.check),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}