import 'package:flutter/material.dart';
import 'package:projetogrupo8/ui/login_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Projeto Grupo 8",
      theme: ThemeData(useMaterial3: true),
      home: LoginScreen(),
      //Ainda nao conectamos as telas, pode alternar trocando LoginScreen por CadastroScreen para testar a tela de cadastro
    ),
  );
}
