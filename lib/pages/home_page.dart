import 'package:flutter/material.dart';
import 'package:my_hours/UI/CustomDrawer.dart';
import 'package:my_hours/UI/CustomFloatingActionButton.dart';
import 'package:my_hours/pages/hours_by_day_page.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas horas'),
      ),
      body: HoursByDayPage(),
      drawer: CustomDrawer(),
      floatingActionButton: CustomFloatingActionButton(), 
    );
  }
}