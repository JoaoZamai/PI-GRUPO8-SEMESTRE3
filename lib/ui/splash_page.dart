import 'dart:async';
import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:PIGRUPO8SEMESTRE3main/ui/login_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),

            Center(
              child: Column(
                children: [
                  Image.asset("lib/assets/maquina.png", height: 250),
                  const SizedBox(height: 20),
                  Image.asset("lib/assets/pbtexto.png", height: 40),
                ],
              ),
            ),

            const Spacer(),

            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
