import 'package:flutter/material.dart';
import 'package:geko/subWidgets/drawer/drawer.dart';
import 'package:geko/widgets/registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SafeArea(child:
        Scaffold(
          appBar: AppBar(
            title: Text("Registro de clientes"),
            backgroundColor: Colors.lightBlue,
          ),
          drawer: NavDrawer(),
          
          body: registro() 
          ),
        )
      );
  }
}

