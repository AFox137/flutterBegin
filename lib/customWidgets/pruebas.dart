import 'package:flutter/material.dart';
import 'package:geko/subWidgets/drawer/drawer.dart';


class Prueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListTile with Popup Dialog'),
        ),
        drawer: NavDrawer(),
        body: ListTileExample(),
      ),
    );
  }
}

class ListTileExample extends StatelessWidget {
  void _showInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return InputDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Tap to open dialog'),
          onTap: () => _showInputDialog(context),
        ),
        // Puedes agregar más ListTiles aquí
      ],
    );
  }
}

class InputDialog extends StatefulWidget {
  @override
  _InputDialogState createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  final TextEditingController _textFieldController = TextEditingController();
  bool _isRequired = false;
  final TextEditingController _charCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Details'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(labelText: 'Enter text'),
            ),
            CheckboxListTile(
              title: Text('Is Required'),
              value: _isRequired,
              onChanged: (bool? value) {
                setState(() {
                  _isRequired = value ?? false;
                });
              },
            ),
            TextField(
              controller: _charCountController,
              decoration: InputDecoration(labelText: 'Character Count'),
              keyboardType: TextInputType.number,
            ),
            // Puedes agregar más campos aquí según tus necesidades
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Manejar la acción de agregar aquí
            print('Text: ${_textFieldController.text}');
            print('Is Required: $_isRequired');
            print('Character Count: ${_charCountController.text}');
            Navigator.of(context).pop();
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
