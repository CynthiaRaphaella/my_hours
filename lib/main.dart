import 'package:flutter/material.dart';
import 'package:my_hours/data/hour.dart';
import 'package:my_hours/pages/create_hour_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        CreateHourPage.route: (BuildContext context) => CreateHourPage(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Hour> _hours = List<Hour>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _hours.map((h) => Text(h.getHourFormated(context))).toList()
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){_performAddNewHour(context);},
        tooltip: 'Add hour',
        child: Icon(Icons.add),
      ), 
    );
  }

  _performAddNewHour(context) {
    Navigator.pushNamed(context, CreateHourPage.route);
  }

}


