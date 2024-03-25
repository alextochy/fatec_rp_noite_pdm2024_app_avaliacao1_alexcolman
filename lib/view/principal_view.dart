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
    return Scaffold(
      //Barra de Título
      appBar: AppBar(
        toolbarHeight: 50,
        leading: Icon(Icons.account_circle_rounded),
        title: Text('App Avaliação 1', style: TextStyle(color: Colors.white)),
        actions: [
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
