import 'package:flutter/material.dart';
import 'package:my_hours/data/hour.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HoursByDayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HoursByDayPageState();
}

class HoursByDayPageState extends State<HoursByDayPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getAllCategories(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Text('Carregando...');
          }
          else {
            return Column(
              children: snapshot.data.map((data) => _buildHourWidget(data)).toList(),
            );
          }
        }
      );
  }

  Widget _buildHourWidget(String category) {
    return Container(
      child: StreamBuilder(
          stream: Firestore.instance.collection('hours').where('category', isEqualTo: category).snapshots(),
          builder: (context, snapshot) {
            if(!snapshot.hasData) {
              return Text('Carregando');
            }
            else {
              List<String> hoursByCategory = _retrieveHours(snapshot.data.documents, context);
              return ListView.builder(
                shrinkWrap: true,
                itemCount: hoursByCategory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(hoursByCategory[index]),
                    subtitle: Text(category),
                  );
                },
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

  List<String> _retrieveHours(List<DocumentSnapshot> document, BuildContext context) {
    List<String> list = new List();
    document.forEach((doc) => list.add(Hour(doc['day']).getHourFormated(context)));
    return list;
  }
}