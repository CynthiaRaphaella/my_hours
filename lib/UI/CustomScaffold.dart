import 'package:flutter/material.dart';
import 'package:my_hours/UI/CustomDrawer.dart';
import 'package:my_hours/UI/CustomFloatingActionButton.dart';

class CustomScaffold extends StatelessWidget {

  const CustomScaffold({
    @required this.body
  });

  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text('Minhas horas'),
            ),
            body: this.body,
            drawer: CustomDrawer(),
            floatingActionButton: CustomFloatingActionButton(), 
          );
  }

}