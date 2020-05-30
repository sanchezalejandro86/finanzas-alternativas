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
      appBar: AppBar(
        title: Text("New Expense"),
        elevation: 0.0,
        backgroundColor: Colors.red,
      ),
      body: Column(
          children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, bottom: 10.0),
                alignment: Alignment.topLeft,
                color: Colors.red,
                child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total expense", style: TextStyle(color: Colors.white, fontSize: width * 0.04)),
                        TextField(
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
                      ],
                    )
              ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Detail',
                        contentPadding: EdgeInsets.all(20.0)
                    ),
                    controller: detailController,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20.0)
                    ),
                    value: "One",
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
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