import 'package:flutter/material.dart';
import 'package:my_hours/UI/CustomScaffold.dart';

class HoursByWeekPage extends StatelessWidget {
  static const String route = '/week';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text('Horas para completar'),
            LinearProgressIndicator(value: 0.5),
          ],
        ),
      )
    );
  }
}