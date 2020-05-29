import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synapseslabs/models/app_model.dart';

class TransactionsPage extends StatelessWidget {
  double width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    /*return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
           Container(
             padding: EdgeInsets.only(top: 50.0, left: 25.0, bottom: 20.0),
             alignment: Alignment.topLeft,
             color: Colors.blue,
             child: Text("Transactions", style: TextStyle(color: Colors.white, fontSize: width * 0.06)),
           ),
           Consumer<AppModel>(
             builder: (context, model, child){
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: model.transactions.length,
                itemBuilder: (context, index){
                  return
                    Container(
                      height: 50,
                      child:  Text(model.transactions[index].detail),
                    );
                }
              );
            }
           ),
        ])
        )
    );*/
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0), // here the desired height
            child: Container(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.only(top: 45.0, left: 20.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Transactions", style: TextStyle(color: Colors.white, fontSize: 24)),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("May 2020", style: TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    )

                 ],
                ),
              ),
            ),
        ),
        body: Consumer<AppModel>(
            builder: (context, model, child){
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: model.transactions.length,
                  itemBuilder: (context, index){
                    return
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Icon(Icons.arrow_downward, size: 35, color: Colors.white),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red[400],
                                    blurRadius: 5,
                                    offset: Offset(0, 2))
                                ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                   children: <Widget>[
                                     Text("Category", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
                                     Text("\$${model.transactions[index].value}",
                                         style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.red)),
                                   ],
                                  ),
                                  Text(model.transactions[index].detail),
                                ],
                              )
                            ),
                          ],
                        ),
                      );
                  }
              );
            }
        )
    );
  }
}
