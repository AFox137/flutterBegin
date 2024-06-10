import 'package:flutter/material.dart';

class buttonForm extends StatefulWidget {
  final VoidCallback onPressed;
  buttonForm({required this.onPressed} );
  
  @override
  State<buttonForm> createState() => _buttonFormState();
}

class _buttonFormState extends State<buttonForm> {



  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(top: 20),
            child: ElevatedButton(
            
            onPressed: widget.onPressed,
            child: Text("Enviar")),
          );
  }
}

