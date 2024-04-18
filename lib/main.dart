// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'view/login_view.dart';
import 'view/cadastro_view.dart';
import 'view/esqueceu-senha_view.dart';
import 'view/principal_view.dart';
import 'view/sobre_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alexcolman - App Avaliação 1',
      home: LoginView(),
      //
      // ROTAS DE NAVEGAÇÂO
      //
      initialRoute: "t0",
      routes: {
        "t0": (context) => LoginView(),
        "t1": (context) => CadastroView(),
        't2': (context) => EsqueceuSenhaView(),
        't3': (context) => PrincipalView(),
        't4': (context) => SobreView()
      },
    );
  }
}
