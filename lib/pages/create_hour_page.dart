import 'package:flutter/material.dart';
import 'package:my_hours/data/hour.dart';

class CreateHourPage extends StatefulWidget {
  static const String route = '/create';
  @override
  State<StatefulWidget> createState() => CreateHourPageState();
}

class CreateHourPageState extends State<CreateHourPage> {
  Hour _hour = Hour.createByHour(TimeOfDay.now());
  List<String> itens = ['primeira', 'segunda', 'terceira'];
  String _selectedItem = '';

  @override
  void initState() {
    super.initState();
    _selectedItem = itens.elementAt(0);
  }

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
    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Escolha uma categoria',
        contentPadding: EdgeInsets.all(10.0),
      ),
      child: DropdownButton(
        onChanged: (option) {
          _selectCategory(option);
        },
        value: _selectedItem,
        items: itens
            .map((item) => DropdownMenuItem(child: Text(item), value: item))
            .toList()));
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
