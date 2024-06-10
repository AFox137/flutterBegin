import 'dart:async';
import 'package:geko/URLs.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:geko/subWidgets/formulario/formsAssets/apellido.dart';
import 'package:geko/subWidgets/formulario/formsAssets/button.dart';
import 'package:geko/subWidgets/formulario/formsAssets/mail.dart';
import 'package:geko/subWidgets/formulario/formsAssets/nombre.dart';
import 'package:geko/subWidgets/formulario/formsAssets/telefono.dart';

class formulario extends StatefulWidget {
  const formulario({super.key});
  @override
  State<formulario> createState() => _formularioState();
  
}

class _formularioState extends State<formulario> {
  final _formKey = GlobalKey<FormState>();
  final _nombre = TextEditingController();
  final _apellido = TextEditingController();
  final _telefono = TextEditingController();
  final _mail = TextEditingController();


  void enviarDatos() async{
  if (_formKey.currentState!.validate()) {
    
    final nombre = _nombre.text;
    final apellido = _apellido.text;
    final telefono = _telefono.text;
    final mail = _mail.text;
    
    
    // debug!!!
    
    // print("nombre: $nombre");
    // print("apellido: $apellido");
    // print("telefono: $telefono");
    // print("mail: $mail");

    try {
      final url = Uri.parse(URLPost) ;  
      var response = await http.post(url,
      body: {
        'nombre': nombre,
        'apellido': apellido,
        'telefono': telefono,
        'mail': mail,
      }
      );
      if (response.statusCode == 200) {
        print('Datos enviados correctamente:');
        print(response.body);
      } else {
        print('Error al enviar los datos. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      print('Excepción al enviar los datos: $e');
    }
    
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('procesando')),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container( 
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10),),
              Nombre(controller:  _nombre,),
              Apellido(controller: _apellido,),
              Telefono(controller: _telefono),
              Mail(controller: _mail,), 
              buttonForm(onPressed: enviarDatos),   
            ],
          ),
        )
    );
  }

}

  
