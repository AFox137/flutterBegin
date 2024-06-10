import 'package:flutter/material.dart';

class Telefono extends StatefulWidget {
  final TextEditingController controller;
  Telefono({required this.controller});

  @override
  State<Telefono> createState() => _TelefonoState();
}

class _TelefonoState extends State<Telefono> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: "381555999",
        labelText: "Telefono",
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