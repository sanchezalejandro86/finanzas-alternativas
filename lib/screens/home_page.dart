import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:synapseslabs/models/app_model.dart';
import 'package:synapseslabs/services/transaction_service.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarController calendarController;
  var width, height;

  /* TODO Meter todo esto en un Utils */
  DateTime dataAtual = new DateTime.now();
  //DateFormat formatterCalendar = new DateFormat('MM-yyyy');
  DateFormat formatterCalendar = new DateFormat('yyyy-MM');

  TransactionService _transactionService = TransactionService();

  Map<String, double> dataMap = new Map();

  String format(double n) {
    return n.toStringAsFixed(2);
  }
  /* ---- */

  void _allTransactionsByMonth(DateTime date){
    var formatedDate = formatterCalendar.format(date);
    _transactionService.fetchTransactionsByDate(formatedDate).then((result){
      Provider.of<AppModel>(context, listen: false).addAll(result);
    });
  }

  @override
  void initState() {
    super.initState();
    calendarController = CalendarController();
    //calendarController.setSelectedDay(DateTime.now()); FIXME
    //calendarController.setCalendarFormat(CalendarFormat.month); FIXME

    _allTransactionsByMonth(dataAtual);

    dataMap.putIfAbsent("ALGO", () => 0);
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: height * 0.4, //300,
                  color: Colors.white,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      width: double.infinity,
                      height: height * 0.28, //250,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[700], //Colors.indigo[400],
                      )),
                ),
                Positioned(
                  top: width * 0.15, //70
                  left: width * 0.07, //30,
                  child: Text(
                    "Finance Tracker",
                    style: TextStyle(
                        color: Colors.white, fontSize: width * 0.074 //30
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: width * 0.07, // 30,
                  right: width * 0.07, // 30,
                  child: Container(
                    height: height * 0.25, //150,
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
                            "Total",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: width * 0.05),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.05),
                              child: Container(
                                width: width * 0.6,
                                child: Consumer<AppModel>(
                                  builder: (context, model, child){
                                    return Text(
                                      format(model.total).toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.lightBlue[700], //Colors.indigo[400],
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.1,
                                        //width * 0.1 //_saldoTamanho(saldoAtual)
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            /*Padding(
                              padding: EdgeInsets.only(right: width * 0.04),
                              child: GestureDetector(
                                onTap: () {
                                },
                                child: Container(
                                  width: width * 0.12,
                                  height: width * 0.12, //65,
                                  decoration: BoxDecoration(
                                      color: Colors
                                          .lightBlue[700], //Colors.indigo[400],
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 7,
                                          offset: Offset(2, 2),
                                        )
                                      ]),
                                  child: Icon(
                                    Icons.add,
                                    size: width * 0.07,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )*/
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 20.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: Colors.green,
                                        ),
                                        child: Icon(Icons.arrow_upward, size: 30, color: Colors.white,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("Ingresos", style: TextStyle(fontSize: 14)),
                                            Consumer<AppModel>(
                                                builder: (context, model, child){
                                                  return Text("\$${model.income}",
                                                      style: TextStyle(fontSize: 18, color: Colors.green)
                                                  );
                                                }
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                              ),
                              Spacer(),
                              Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: Colors.red,
                                        ),
                                        child: Icon(Icons.arrow_downward, size: 30, color: Colors.white,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("Egresos", style: TextStyle(fontSize: 14)),
                                            Consumer<AppModel>(
                                                builder: (context, model, child){
                                                  return Text("\$${model.expenses}",
                                                      style: TextStyle(fontSize: 18, color: Colors.green)
                                                  );
                                                }
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
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
            ),
            TableCalendar(
              calendarController: calendarController,
              //locale: "es_ES",
              headerStyle: HeaderStyle(
                formatButtonShowsNext: false,
                formatButtonVisible: false,
                centerHeaderTitle: true,
              ),
              calendarStyle: CalendarStyle(outsideDaysVisible: false),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.transparent),
                weekendStyle: TextStyle(color: Colors.transparent),
              ),
              rowHeight: 0,
              initialCalendarFormat: CalendarFormat.month,
              onVisibleDaysChanged: (dateFirst, dateLast, CalendarFormat cf) {
                  print(dateFirst);
                  _allTransactionsByMonth(dateFirst);
                },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: PieChart(
                dataMap: dataMap,
                chartType: ChartType.ring,
              ),
            )
          ]
      ),
    );
  }
}