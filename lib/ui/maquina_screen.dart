import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';
import 'package:flutter/material.dart';

class MachineScreen extends StatelessWidget {
  const MachineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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

      body: SingleChildScrollView(),
    );
  }
}
