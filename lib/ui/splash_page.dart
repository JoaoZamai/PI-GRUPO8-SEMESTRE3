import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.deepOrange,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("lib/assets/maquina.png", height: 250),
                    SizedBox(height: 20),
                    Image.asset("lib/assets/pbtexto.png", height: 40),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 40,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 18,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Text(
                'Entrar',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),

            SizedBox(height: 10),

            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 40,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 18,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Text(
                'Criar Conta',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}