import 'package:flutter/material.dart';

class Hour {
  DateTime _day;

  DateTime get day => _day;

  Hour(DateTime day) {
    _day = day;
  }

  String getHourFormated(context) {
    TimeOfDay time = TimeOfDay.fromDateTime(_day);
    return time.format(context);
  }

}