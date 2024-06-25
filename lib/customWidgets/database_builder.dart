import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geko/customWidgets/add_data_base.dart';
import 'package:geko/functions/_addItem.dart';
import 'package:geko/subWidgets/drawer/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataBaseBuilder extends StatefulWidget {
  const DataBaseBuilder({super.key});

  @override
  State<DataBaseBuilder> createState() => _DataBaseBuilderState();
}

class _DataBaseBuilderState extends State<DataBaseBuilder> {
  final List fields = ['1', '2', '3'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text('DataBase Builder'),
        ),
        body: Center(
          child: Container(
            color: Colors.grey,
            width: 300,
            height: 600,
            child: Column(children: [
              Image.asset('assets/zorro.jpg',
                  width: 80,
                  fit: BoxFit.contain,
                  height: 80,
                  color: Colors.grey,
                  colorBlendMode: BlendMode.darken),
              Expanded(child: 
                ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return AddDataBase();
                }
              )
              )
            ]),
          ),
        ),
        drawer: NavDrawer(),
      ),
    );
  }
}
