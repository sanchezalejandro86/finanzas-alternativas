import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:synapseslabs/screens/add_transaction.dart';

import 'components/fab_bottom__bar.dart';
import 'models/app_model.dart';
import 'screens/configuration_page.dart';
import 'screens/home_page.dart';
import 'screens/reports_page.dart';
import 'screens/transactions_page.dart';

void main() {
  initializeDateFormatting().then((_) {
    runApp(ChangeNotifierProvider(
        create: (context) => AppModel(), child: MyApp()));
  });
}

class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    TransactionsPage(),
    ReportsPage(),
    ConfigurationPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Finance Tracker',
        theme: ThemeData(
          primaryColor: Color(0xFF7060FC),
          accentColor: Color(0xFF7060FC),
        ),
        home: Scaffold(
          body: _children[_currentIndex],
          bottomNavigationBar: FABBottomAppBar(
            notchedShape: CircularNotchedRectangle(),
            color: Colors.blueGrey,
            selectedColor: Color(0xFF7060FC),
            onTabSelected: (int _index) {
              setState(() {
                _currentIndex = _index;
              });
            },
            items: [
              FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
              FABBottomAppBarItem(iconData: Icons.list, text: 'Transactions'),
              FABBottomAppBarItem(iconData: Icons.pie_chart, text: 'Reports'),
              FABBottomAppBarItem(iconData: Icons.settings, text: 'Settings'),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddTransactionPage()));
            },
            tooltip: 'Add Transaction',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        )
    );
  }
}
