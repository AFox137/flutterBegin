import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          
          DrawerHeader(child:
          Text("Navegador"),
          decoration: BoxDecoration(color: Colors.lightGreen)
          ),
          ListTile(
            title: Text("Visualizacion"),
            leading: Icon(Icons.view_cozy_outlined),
            onTap: () {
              
            },
          )
          
        ],
      ),
    );
  }
}