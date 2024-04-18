// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  @override
  Widget build(BuildContext context) {
    // final String usuario = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      //Barra de Título
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        title: const Text('Lista de Compras',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text('Perfil', style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ListTile(
                leading: Icon(
                  Icons.info_outline,
                ),
                title: const Text('Sobre'),
                onTap: () {
                  Navigator.pushNamed(context, "t4");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                ),
                title: const Text('Sair'),
                onTap: () {
                  Navigator.pushNamed(context, "t0");
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
          //child: Text(usuario),
          ),
    );
  }
}
