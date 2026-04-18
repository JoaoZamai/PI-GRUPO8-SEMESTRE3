import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  Future<void> irParaPackbag() async {
    final Uri url = Uri.parse('https://packbag.com.br/contato/');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    } else {
      throw Exception('Não foi possível abrir $url');
    }
  }

  const SettingsScreen({super.key});

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset('lib/assets/pblogo.png', height: 40)],
              ),
            ),

            // ── Conteúdo ────────────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Título + botão voltar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'CONFIGURAÇÕES',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, AppRoutes.home),
                            child: Image.asset(
                              'lib/assets/voltar.png',
                              width: 30,
                              height: 30,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Botão CONEXÕES
                    _settingsButton(
                      label: 'CONEXÕES',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.sensores);
                      },
                    ),

                    const SizedBox(height: 16),

                    // Botão SUPORTE
                    _settingsButton(
                      label: 'SUPORTE',
                      onTap: () {
                        irParaPackbag();
                      },
                    ),

                    const SizedBox(height: 16),

                    // Botão REINICIAR APLICATIVO
                    _settingsButton(
                      label: 'REINICIAR APLICATIVO',
                      onTap: () {
                        Restart.restartApp();
                      },
                    ),
                  ],
                ),
              ),
            ),

            // ── Rodapé preto (padrão do projeto) ───────────────────────
            Container(height: 30, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget _settingsButton({required String label, required VoidCallback onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        side: const BorderSide(color: Colors.black87, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 16),
        elevation: 0,
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
