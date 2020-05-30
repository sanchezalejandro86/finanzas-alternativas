import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:synapseslabs/models/app_model.dart';
import 'package:synapseslabs/services/transaction_service.dart';
import 'package:synapseslabs/widgets/balances_widget.dart';
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
            BalancesWidget(),
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