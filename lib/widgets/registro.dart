import 'package:flutter/material.dart';
import 'package:geko/subWidgets/drawer/drawer.dart';
import 'package:geko/subWidgets/formulario/formulario.dart';


class registro extends StatefulWidget {
  const registro({super.key});

  @override
  State<registro> createState() => _registroState();
}

class _registroState extends State<registro> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text("Registro de clientes"),
            backgroundColor: Colors.lightBlue
            ),
      drawer: NavDrawer(),      
      body: formulario()
      );
  }
}