import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class Mail extends StatefulWidget {
  final TextEditingController controller;
  Mail({required this.controller});

  @override
  State<Mail> createState() => _MailState();
}

class _MailState extends State<Mail> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: "aezb15@gmail.com",
        labelText: "Mail",
      ),
      
      validator: (value){
        if (value == null || value.isEmpty) {
          return 'Ingresa dato';
        }else if(!EmailValidator.validate(value)){
          return 'El mail no es valido';
        }
        return null;
      },
    );
  }
}