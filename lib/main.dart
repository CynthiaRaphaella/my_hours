import 'package:flutter/material.dart';
import 'package:my_hours/pages/create_hour_page.dart';
import 'package:my_hours/pages/home_page.dart';
import 'package:my_hours/pages/hours_by_day_page.dart';
import 'package:my_hours/pages/hours_by_week_page.dart';

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
        HoursByDayPage.route: (BuildContext context) => HoursByDayPage(),
        HoursByWeekPage.route: (BuildContext context) => HoursByWeekPage()
      },
      home: MyHomePage(),
    );
  }
}


