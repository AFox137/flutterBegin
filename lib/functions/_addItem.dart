import 'package:flutter/material.dart';
import 'package:geko/subWidgets/formulario/formsAssets/button.dart';

class InputDialog extends StatefulWidget {
  @override
  _InputDialogState createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  final TextEditingController _dataBaseName = TextEditingController();
  final TextEditingController _textFieldController = TextEditingController();
  bool _isRequired = false;
  final TextEditingController _charCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _dataBaseName,
              decoration: InputDecoration(hintText: 'DataBase Name'),
            ),
            Divider(height: 30),
            //los campos
            Title(
              color: Colors.black, 
              child: Text('Campos'),
              ),
            TextButton(
              child: Text('Agregar Campo'),
              onPressed: () {
                
              },
                
            ),

            
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