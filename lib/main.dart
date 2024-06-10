import 'package:flutter/material.dart';
import 'package:geko/subWidgets/drawer/drawer.dart';
import 'package:geko/widgets/registro.dart';
import 'package:geko/widgets/visualizacion.dart';

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
      routes: {
        '/visualizacion': (context) => visualizacion(),
        '/registro': (context) => registro(),
        '/main': (context) => MyApp(),

      },
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: Text('HAL'),
          ),
          body: Center(
            child: Container(
              child: Image.asset('assets/zorro.jpg'),
          ),
            
          ),
          drawer: NavDrawer(),
          ),
      ),
    );
  }
}
