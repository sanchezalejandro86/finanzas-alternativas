import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synapseslabs/models/app_model.dart';

class TransactionsPage extends StatelessWidget {
  double width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
        child: Column(children: <Widget>[
           Container(
             padding: EdgeInsets.only(top: 50.0, left: 25.0, bottom: 20.0),
             alignment: Alignment.topLeft,
             color: Colors.blue,
             child: Text("Transactions", style: TextStyle(color: Colors.white, fontSize: width * 0.06)),
           ),
           Consumer<AppModel>(
             builder: (context, model, child){
              return ListView.builder(
                shrinkWrap: true,
                itemCount: model.transactions.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(model.transactions[index].detail),
                  );
                }
              );
            }
           ),
        ])
    );
  }
}
