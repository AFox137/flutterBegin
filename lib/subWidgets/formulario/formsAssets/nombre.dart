import 'package:flutter/material.dart';

class Nombre extends StatefulWidget {
  final TextEditingController controller;
  Nombre({required this.controller});

  @override
  State<Nombre> createState() => _NombreState();
}

class _NombreState extends State<Nombre> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: "Augusto",
        labelText: "Nombre",
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