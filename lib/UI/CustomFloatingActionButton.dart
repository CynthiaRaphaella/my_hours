import 'package:flutter/material.dart';
import 'package:my_hours/pages/create_hour_page.dart';

class CustomFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: (){_performAddNewHour(context); },
        tooltip: 'Add hour',
        child: Icon(Icons.add),
    );
  }

  _performAddNewHour(context) {
    Navigator.pushNamed(context, CreateHourPage.route);
  }
}