import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synapseslabs/components/expense_icon.dart';
import 'package:synapseslabs/models/app_model.dart';

class TransactionsPage extends StatelessWidget {
  double width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text("Transactions"),
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 50.0,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              alignment: Alignment.center,
              child:
                Text("May 2020", style: TextStyle(color: Colors.white, fontSize: 18.0, ),)
            ),
            Expanded(
              child: Consumer<AppModel>(
                  builder: (context, model, child){
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: model.transactions.length,
                        itemBuilder: (context, index){
                          return
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                              padding: EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      ExpenseIcon(),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Category", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                                          Text(model.transactions[index].detail, style: TextStyle(fontSize: 12.0)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text("\$${model.transactions[index].value}",
                                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.red)),
                                      Text("")
                                    ],
                                  )

                                ],
                              ),
                            );
                        }
                    );
                  }
              ),
            )
          ],
        )
    );
  }
}
