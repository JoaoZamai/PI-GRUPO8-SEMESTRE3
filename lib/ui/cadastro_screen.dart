import 'package:flutter/material.dart';

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.grey,
              child: Row(
                children: [
                  Image.asset(
                    "lib/assets/pblogo.png",
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),

            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    // botão voltar
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(25),
                          ),

                          child: Image.asset(
                            'lib/assets/voltar.png',
                            width: 40,
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),

                    Center(
                      child: Container(
                        width: 320,
                        height: 600,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 18,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),

                        child: Column(
                          children: [
                            Container(
                              //e-mail
                              margin: EdgeInsets.only(top: 50),
                              height: 60,
                              width: 250,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                'E-mail',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                            Container(
                              //usuario
                              margin: EdgeInsets.only(top: 50),
                              height: 60,
                              width: 250,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                'Nome de Usuário',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                            Container(
                              //senha
                              margin: EdgeInsets.only(top: 50),
                              height: 60,
                              width: 250,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                'Senha',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                            Container(
                              //Confirmar
                              margin: EdgeInsets.only(top: 50),
                              height: 60,
                              width: 250,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                'Confirmar Senha',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                            Container(
                              //criar
                              margin: EdgeInsets.only(top: 50),
                              height: 40,
                              width: 150,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
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
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 30,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
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
                'Ajuda',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),

            Container(height: 30, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
