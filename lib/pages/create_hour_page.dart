import 'package:flutter/material.dart';
import 'package:my_hours/data/hour.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateHourPage extends StatefulWidget {
  static const String route = '/create';
  @override
  State<StatefulWidget> createState() => CreateHourPageState();
}

class CreateHourPageState extends State<CreateHourPage> {
  Hour _hour = Hour.createByHour(TimeOfDay.now());
  String _selectedItem = 'Escolha uma categoria';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Adicionar hora'),
        ),
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                _buildTimePicker(),
                _buildCategories()
              ],
            )));
  }

  Widget _buildCategories() {
    return StreamBuilder(
      stream: Firestore.instance.collection('categories').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) {
          return Text('Carregando');
        }
        else {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: 'Escolha uma categoria',
              contentPadding: EdgeInsets.all(10.0),
            ),
            child: 
            DropdownButton(
              onChanged: (option) {
                _selectCategory(option);
              },
              hint: Text(_selectedItem),
              items: _buildDropdownList(snapshot.data.documents)));
        }
      });
  }

  List<DropdownMenuItem<String>> _buildDropdownList(List<DocumentSnapshot> document){
    List<DropdownMenuItem<String>> list = new List();
    document.forEach((doc) => list.add(DropdownMenuItem(child: new Text(doc['name']), value: doc['name'],)));
    return list;
  }

  void _selectCategory(option) {
    setState(() {
      _selectedItem = option;
    });
  }

  Widget _buildTimePicker() {
    return InkWell(
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Escolha uma hora',
          contentPadding: EdgeInsets.all(10.0),
        ),
        child: Row(
          children: <Widget>[
            Text(_hour.getHourFormated(context)),
            Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
      onTap: () {
        _selectTime(context);
      },
    );
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    setState(() {
      if(picked != null) {
        _hour.setHour(picked);
      }
    });
  }
}
