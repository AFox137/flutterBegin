import 'package:flutter/material.dart';
import '../functions/_addItem.dart';

class AddDataBase extends StatelessWidget {
  const AddDataBase({super.key});

  @override
  Widget build(BuildContext context) {
    void _showInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return InputDialog();
      },
    );
  }
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 50),
      child: ListTile(
        leading: Icon(Icons.document_scanner_sharp),
        title: Text('New DataBase'),
        onTap:() => _showInputDialog(context)
        
      )
    );
  }
  
}

