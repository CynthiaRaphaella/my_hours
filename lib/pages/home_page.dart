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
      body: FutureBuilder(
        future: _getAllCategories(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Text('a');
          }
          else {
            return Column(
              children: snapshot.data.map((data) => _buildHourWidget(data)).toList(),
            );
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){_performAddNewHour(context); },
        tooltip: 'Add hour',
        child: Icon(Icons.add),
      ), 
    );
  }

  Widget _buildHourWidget(String category) {
    return Card(
        margin: EdgeInsets.all(20.0),
        color: Color(Colors.blueAccent.value),
        child: StreamBuilder(
          stream: Firestore.instance.collection('hours').where('category', isEqualTo: category).snapshots(),
          builder: (context, snapshot) {
            if(!snapshot.hasData) {
              return Text('Carregando');
            }
            else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _retrieveHours(snapshot.data.documents, context),
              );
            }
          }
        ),
      );
  }

  Future<List<String>> _getAllCategories() async{
    List<String> allCategories = new List();
    QuerySnapshot snapshot = await Firestore.instance.collection('categories').getDocuments();
    snapshot.documents.forEach((doc) => allCategories.add(doc['name']));
    return allCategories;
  }

  List<Text> _retrieveHours(List<DocumentSnapshot> document, BuildContext context) {
    List<Text> list = new List();
    document.forEach((doc) => list.add(Text(Hour(doc['day']).getHourFormated(context))));
    return list;
  }

  _performAddNewHour(context) {
    Navigator.pushNamed(context, CreateHourPage.route);
  }
}