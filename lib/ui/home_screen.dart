import 'package:flutter/material.dart';
import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';
import 'package:PIGRUPO8SEMESTRE3main/viewmodels/firabase_data/maquina.dart';

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

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Visualização Inteligente",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.lightbulb, color: Colors.amber),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Visualize seus dispositivos e monitore cada um deles.\n"
                    "Receba estimativas e previsões de produção.\n\n"
                    "Verifique o estado do dispositivo se está ativo ou não.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Icon(Icons.arrow_downward, size: 28),

            const SizedBox(height: 20),

            /// CARD DISPOSITIVO
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
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
                        textoNome += 'Indisponível';
                      }

                      return Text(
                        textoNome,
                        style: const TextStyle(fontWeight: FontWeight.bold),
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

                      return Text(
                        estadoTexto,
                        style: const TextStyle(fontSize: 11),
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.memory, size: 40),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.machine);
                        },
                        child: const Text(
                          "VISUALIZAR",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 28),
                    SizedBox(width: 8),
                    Text(
                      "OUTROS DISPOSITIVOS",
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.sobre);
              },
              child: const Text(
                "SOBRE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
            backgroundColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: onPressed,
          child: Column(
            children: [Icon(icon), const SizedBox(height: 5), Text(text)],
          ),
        ),
      ),
    );
  }
}
