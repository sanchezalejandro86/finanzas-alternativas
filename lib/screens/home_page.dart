import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = new Map();
    dataMap.putIfAbsent("Flutter", () => 5);
    dataMap.putIfAbsent("React", () => 3);
    dataMap.putIfAbsent("Xamarin", () => 2);
    dataMap.putIfAbsent("Ionic", () => 2);

    return Column(
        children: <Widget>[
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                    child: Text("Mes", style: TextStyle(fontSize: 24))
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    alignment: Alignment.center,
                    child: Text(
                        "Saldo en las cuentas", style: TextStyle(fontSize: 18))
                ),
                Container(
                    alignment: Alignment.center,
                    child: Text("\$118.000,00", style: TextStyle(fontSize: 36))
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    20)),
                                color: Colors.green,
                              ),
                              child: Icon(Icons.arrow_upward, size: 42,
                                color: Colors.white,),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Ingresos", style: TextStyle(
                                    fontSize: 18)),
                                Text("\$120.000,00", style: TextStyle(
                                    fontSize: 24, color: Colors.green))
                              ],
                            )
                          ],
                        )
                    ),
                    Container(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    20)),
                                color: Colors.red,
                              ),
                              child: Icon(Icons.arrow_downward, size: 42,
                                color: Colors.white,),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Egresos", style: TextStyle(fontSize: 18)),
                                Text("\$5.000,00", style: TextStyle(
                                    fontSize: 24, color: Colors.red))
                              ],
                            )
                          ],
                        )
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: PieChart(
              dataMap: dataMap,
              chartType: ChartType.ring,
            ),
          )
        ]
    );
  }
}