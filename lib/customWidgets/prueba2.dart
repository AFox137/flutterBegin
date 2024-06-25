import 'package:flutter/material.dart';
import 'package:geko/customWidgets/prueba3.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ViewDatabaseWidget extends StatefulWidget {
  final List<Map<String, dynamic>> fields;

  const ViewDatabaseWidget({required this.fields});

  @override
  _ViewDatabaseWidgetState createState() => _ViewDatabaseWidgetState();
}

class _ViewDatabaseWidgetState extends State<ViewDatabaseWidget> {
  late List<Map<String, dynamic>> fields;

  @override
  void initState() {
    super.initState();
    fields = widget.fields;
  }

  Future<void> _saveFields() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('fields', jsonEncode(fields));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vista de Base de Datos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Campos de la Base de Datos:'),
            Expanded(
              child: ListView.builder(
                itemCount: fields.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(fields[index]['name']),
                    subtitle: Text(
                        'Tipo: ${fields[index]['type']}, Requerido: ${fields[index]['required']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditFieldWidget(
                              field: fields[index],
                              onUpdate: (updatedField) {
                                setState(() {
                                  fields[index] = updatedField;
                                  _saveFields();
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
