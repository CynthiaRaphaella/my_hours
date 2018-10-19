import 'package:flutter/material.dart';

class Hour {
  DateTime _day;
  TimeOfDay _hour;

  DateTime get day => _day;
  TimeOfDay get hour => _hour;

  void setDay(DateTime day) {
    _day = day;
  }

  void setHour(TimeOfDay hour) {
    _hour = hour;
  }

  String getHourFormated(context) {
    return _hour.format(context);
  }

  Hour(this._day) {
    _hour = TimeOfDay.fromDateTime(_day);
  }

  Hour.createByHour(this._hour);
}