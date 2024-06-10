import 'package:flutter/material.dart';

class Apellido extends StatefulWidget {
  

  final TextEditingController controller;
  Apellido({required this.controller});

  @override
  State<Apellido> createState() => _ApellidoState();
  
}

class _ApellidoState extends State<Apellido> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: "Zelaya",
        labelText: "Apellido",
      ),
      validator: (value){
        if (value == null || value.isEmpty) {
          return 'Ingresa dato';
        }
        return null;
      },
    );
  }
}