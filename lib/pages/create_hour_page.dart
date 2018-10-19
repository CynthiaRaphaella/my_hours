import 'package:flutter/material.dart';
import 'package:my_hours/data/hour.dart';

class CreateHourPage extends StatefulWidget {
  static const String route = '/create';
  @override
  State<StatefulWidget> createState() => CreateHourPageState();
}

class CreateHourPageState extends State<CreateHourPage> {
  Hour _hour = Hour.createByHour(TimeOfDay.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: InkWell(
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: 'Select a time',
              contentPadding: EdgeInsets.all(10.0),
            ),
            child: Row(
              children: <Widget>[
                Text(_hour.getHourFormated(context)),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
          onTap: () {_selectTime(context);},
        )
      )
    );
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now()
    );

    setState(() {
       _hour.setHour(picked);
    });
  }
}