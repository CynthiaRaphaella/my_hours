import 'package:flutter/material.dart';
import 'package:my_hours/pages/create_hour_page.dart';
import 'package:my_hours/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minhas horas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        CreateHourPage.route: (BuildContext context) => CreateHourPage(),
      },
      home: MyHomePage(title: 'Minhas horas'),
    );
  }
}


