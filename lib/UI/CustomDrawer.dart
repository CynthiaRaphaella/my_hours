import 'package:flutter/material.dart';
import 'package:my_hours/pages/hours_by_day_page.dart';
import 'package:my_hours/pages/hours_by_week_page.dart';

class CustomDrawer extends StatelessWidget {

  const CustomDrawer({
    this.title = 'Horários'
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(this.title, style: TextStyle(fontSize: 20.0)),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),
            ListTile(
              title: Text('Dia', style: TextStyle(fontSize: 20.0, color: Colors.black54)),
              trailing: Icon(Icons.calendar_view_day),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, HoursByDayPage.route);
              },
            ),
            ListTile(
              title: Text('Semana', style: TextStyle(fontSize: 20.0, color: Colors.black54)),
              trailing: Icon(Icons.calendar_today),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, HoursByWeekPage.route);
              },
            )
          ],
        ),
      );
  }
  
}