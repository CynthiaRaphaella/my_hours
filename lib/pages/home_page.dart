import 'package:flutter/material.dart';
import 'package:my_hours/data/hour.dart';
import 'package:my_hours/pages/create_hour_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: Firestore.instance.collection('hours').where('category', isEqualTo: 'Projeto').snapshots(),
          builder: (context, snapshot) {
            if(!snapshot.hasData) {
              return Text('Carregando');
            }
            else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildHours(snapshot.data.documents, context),
              );
            }
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){_performAddNewHour(context);},
        tooltip: 'Add hour',
        child: Icon(Icons.add),
      ), 
    );
  }

  List<Text> _buildHours(List<DocumentSnapshot> document, BuildContext context) {
    List<Text> list = new List();
    document.forEach((doc) => list.add(Text(Hour(doc['day']).getHourFormated(context))));
    return list;
  }

  _performAddNewHour(context) {
    Navigator.pushNamed(context, CreateHourPage.route);
  }
}