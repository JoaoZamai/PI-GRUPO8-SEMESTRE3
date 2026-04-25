import 'package:PIGRUPO8SEMESTRE3main/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';
import 'package:PIGRUPO8SEMESTRE3main/viewmodels/firebase_data/maquina.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Future<String?> _nomeMaquinaFuture;
  late final Future<bool?> _estadoMaquinaFuture;

  @override
  void initState() {
    super.initState();
    _nomeMaquinaFuture = lerNomeMaquina();
    _estadoMaquinaFuture = lerEstadoMaquina();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.branco,
      appBar: AppBar(
        backgroundColor: AppColors.cinza,
        iconTheme: IconThemeData(
          color: AppColors.preto,
        ),
        centerTitle: true,
        title: Image.asset(
          AppColors.logo,
          key: ValueKey(AppColors.logo),
          width: 160,
          height: 80,
          fit: BoxFit.contain,
        ),
        actions: [
          ElevatedButton(
            onPressed: (){
              setState(() {
                AppColors.mudarContraste();
              });
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10),
              backgroundColor: AppColors.cinzaClaro,
            ), 
            child: 
              Icon(Icons.accessibility, size: 30, color: AppColors.preto)
          ),
        ]
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cinza,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.pretoClaro,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Visualização Inteligente",
                        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.preto),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.lightbulb, color: AppColors.laranja),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Visualize seus dispositivos e monitore cada um deles.\n"
                    "Receba estimativas e previsões de produção.\n\n"
                    "Verifique o estado do dispositivo se está ativo ou não.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: AppColors.preto),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Icon(Icons.arrow_downward, size: 28, color: AppColors.preto),

            const SizedBox(height: 20),

            /// CARD DISPOSITIVO
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.cinzaClaro,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.pretoClaro,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<String?>(
                    future: _nomeMaquinaFuture,
                    builder: (context, snapshot) {
                      String textoNome = 'Nome da Máquina: ';

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        textoNome += 'Carregando...';
                      } else if (snapshot.hasError) {
                        textoNome += 'Erro ao carregar';
                      } else if (snapshot.hasData &&
                          snapshot.data!.isNotEmpty) {
                        textoNome += snapshot.data!;
                      } else {
                        textoNome +=
                            'Usuário precisa selecionar um dispositivo';
                      }

                      return Text(
                        textoNome,
                        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.preto),
                      );
                    },
                  ),
                  FutureBuilder<bool?>(
                    future: _estadoMaquinaFuture,
                    builder: (context, snapshot) {
                      String estadoTexto = 'Estado: ';

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        estadoTexto += 'Carregando...';
                      } else if (snapshot.hasError) {
                        estadoTexto += 'Erro ao carregar';
                      } else if (snapshot.hasData) {
                        estadoTexto += snapshot.data! ? 'OPERANDO' : 'PARADO';
                      } else {
                        estadoTexto += 'Indisponível';
                      }

                      return Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 15,
                            color: snapshot.data == false
                                ? Colors.red
                                : Colors.green,
                          ),
                          Text(
                            estadoTexto,
                            style: TextStyle(fontSize: 11, color: AppColors.preto),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.memory, size: 40, color: AppColors.preto),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.preto,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.machine);
                        },
                        child: Text(
                          "VISUALIZAR",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.branco,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            /// OUTROS DISPOSITIVOS
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: AppColors.cinzaClaro,
                borderRadius: BorderRadius.circular(16),
                border: AppColors.contraste
                                ? Border.all(
                                    color: AppColors.preto,
                                    width: 2,
                                  )
                                : null,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 28, color: AppColors.preto),
                    SizedBox(width: 8),
                    Text(
                      "OUTROS DISPOSITIVOS",
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.preto),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// BOTÕES INFERIORES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomButton(Icons.settings, "Configurações", () {
                  Navigator.pushNamed(context, AppRoutes.settings);
                }),
                _bottomButton(Icons.person, "Usuário", () {
                  Navigator.pushNamed(context, AppRoutes.user);
                }),
              ],
            ),

            const SizedBox(height: 15),

            /// SOBRE
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.preto,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.sobre);
              },
              child: Text(
                "SOBRE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.branco,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reponsável por generalizar os botões inferiores (eu acredito)
  static Widget _bottomButton(
    IconData icon,
    String text,
    VoidCallback onPressed,
  ) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.cinzaClaro,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            side: AppColors.contraste
            ? BorderSide(
                color: AppColors.preto,
                width: 2,
              )
            : BorderSide.none,
          ),
          onPressed: onPressed,
          child: Column(
            children: [
              Icon(icon, color: AppColors.preto),
              const SizedBox(height: 5),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.preto, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
