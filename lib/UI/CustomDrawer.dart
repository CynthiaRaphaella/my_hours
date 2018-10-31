import 'package:flutter/material.dart';

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
            ),
            ListTile(
              title: Text('Semana', style: TextStyle(fontSize: 20.0, color: Colors.black54)),
              trailing: Icon(Icons.calendar_today),
            )
          ],
        ),
      );
  }
  
}