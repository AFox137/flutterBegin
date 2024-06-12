import 'package:flutter/material.dart';
import 'package:geko/URLs.dart';
import 'package:geko/subWidgets/drawer/drawer.dart';
import 'dart:async';
import 'dart:convert';
import '../functions/recibirDatos.dart';
import 'package:http/http.dart';

class visualizacion extends StatefulWidget {
  const visualizacion({super.key});

  @override
  State<visualizacion> createState() => _visualizacionState();
}

class _visualizacionState extends State<visualizacion> {

  List<RecibirDatos>  data = [];

  @override
  void initState() {
    super.initState();
    MostrarDatos().then((fetchedData) {
      setState(() {
        data = fetchedData;
      });
    });
  }

  Future<List<RecibirDatos>> MostrarDatos() async{
    
    final response = await get(Uri.parse('URLUsers'));

    // print('Código de estado de la respuesta: ${response.statusCode}');
    // print('Cuerpo de la respuesta: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);

      return jsonData.map((json) => RecibirDatos.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar datos');
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("visualizacion"),
          backgroundColor: Colors.lightBlue,
          actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              MostrarDatos().then((_) {
                print('Conexión establecida correctamente: código 200');
              }).catchError((error) {
                print('Error: $error');
              });
            },
          ),
        ],
        ),
        drawer: NavDrawer(),
         body: //data.isEmpty
        //   ? Center(child: CircularProgressIndicator())
           ListView(
              scrollDirection: Axis.horizontal,
              children: [
                DataTable(
                  columnSpacing: 10,
                  columns: [
                    DataColumn(label: Text('Nombre')),
                    DataColumn(label: Text('Teléfono')),
                    DataColumn(label: Text('Mail')),
                  ],
                  rows: data.map((item) {
                    return DataRow(cells: [
                      DataCell(Text(item.nombre)),
                      DataCell(Text(item.telefono.toString())),
                      DataCell(Text(item.mail)),
                    ]);
                  }).toList(),
                ),
              ],
            ),
      ),
    );
  }
}