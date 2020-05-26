import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'components/fab_bottom__bar.dart';
import 'screens/home_page.dart';
import 'screens/transactions_page.dart';
import 'screens/reports_page.dart';
import 'screens/configuration_page.dart';

void main() {

  initializeDateFormatting().then((_){
    runApp(
        MaterialApp(
          title: 'Finanzas Alternativas',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyApp(title: 'Finanzas Alternativas'),
        )
    );
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
    return Scaffold(
    /*  appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: _children[_currentIndex],
      bottomNavigationBar: FABBottomAppBar(
        notchedShape: CircularNotchedRectangle(),
        color: Colors.blueGrey,
        selectedColor: Theme.of(context).primaryColor,
        onTabSelected: (int _index){
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
