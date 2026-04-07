import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Image.asset(
          'lib/assets/pblogo.png',
          width: 160,
          height: 80,
          fit: BoxFit.contain,
        ),
      ),

      body: const Center(
        child: Text(
          "Tela de Configurações",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
