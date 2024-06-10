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
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child:
              Column(
                children: [
                  Text("Navegador", 
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              )     
          ),
          ListTile(
            title: Text("Main"),
            leading: Icon(Icons.laptop_windows),
            onTap: (){
              Navigator.popAndPushNamed(context, '/main');

            },
          ),

          ListTile(
            title: Text("Registro"),
            leading: Icon(Icons.app_registration),
            onTap: (){
              Navigator.popAndPushNamed(context, '/registro');

            },
          ),

          ListTile(
            title: Text("Visualizacion"),
            leading: Icon(Icons.view_cozy_outlined),
            onTap: () {
              Navigator.popAndPushNamed(context, '/visualizacion');
            },
          ),

        ],
      ),
    );
  }
}