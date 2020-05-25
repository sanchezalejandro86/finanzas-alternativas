import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/transactions_page.dart';
import 'screens/reports_page.dart';
import 'screens/configuration_page.dart';

void main() {
  runApp(
      MaterialApp(
        title: 'Finanzas Alternativas',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyApp(title: 'Finanzas Alternativas'),
      )
  );
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (int _index){
          setState(() {
            _currentIndex = _index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Inicio")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text("Transacciones")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            title: Text("Informes")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Configuración")
          ),
        ]
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
