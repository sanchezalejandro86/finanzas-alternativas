import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synapseslabs/models/app_model.dart';

class BalancesWidget extends StatelessWidget {
  double width, height;

  String format(double n) {
    return n.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: height * 0.37, //300,
          color: Colors.grey[100],
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
              width: double.infinity,
              height: height * 0.28, //250,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor, //Colors.indigo[400],
                borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(35.0, 10.0))
              )),
        ),
        Positioned(
          top: width * 0.1, //70
          left: width * 0.20, //30,
          child: Text(
            "FINANCE TRACKER",
            style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold //30
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: width * 0.07, // 30,
          right: width * 0.07, // 30,
          child: Container(
            width: width * 0.1, // 70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 5,
                      offset: Offset(0, 2))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.05,
                    top: width * 0.04,
                    bottom: width * 0.02,
                  ),
                  child: Text(
                    "Balance",
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: width * 0.05),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Consumer<AppModel>(
                          builder: (context, model, child){
                            return Text(
                              format(model.total).toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Theme.of(context).accentColor, //Colors.indigo[400],
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.1,
                                //width * 0.1 //_saldoTamanho(saldoAtual)
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 36.0,
                            width: 36.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.green,
                              boxShadow:  [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Icon(Icons.arrow_upward, size: 24, color: Colors.white,),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Income", style: TextStyle(fontSize: 14, color: Colors.grey[600],)),
                              Consumer<AppModel>(
                                  builder: (context, model, child){
                                    return Text("\$${model.income}",
                                        style: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.w600)
                                    );
                                  }
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 25.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 36.0,
                              width: 36.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Colors.red,
                                boxShadow:  [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Icon(Icons.arrow_downward, size: 24, color: Colors.white,),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Expenses", style: TextStyle(fontSize: 14, color: Colors.grey[600],)),
                                Consumer<AppModel>(
                                    builder: (context, model, child){
                                      return Text("\$${model.expenses}",
                                          style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.w600)
                                      );
                                    }
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
