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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Título
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'CONFIGURAÇÕES',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Botão CONEXÕES
                    _settingsButton(
                      backgroundColor: Colors.grey,
                      label: 'CONEXÕES',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.sensores);
                      },
                    ),

                    const SizedBox(height: 16),

                    // Botão SUPORTE
                    _settingsButton(
                      backgroundColor: Colors.grey,
                      label: 'SUPORTE',
                      onTap: () {
                        irParaPackbag();
                      },
                    ),

                    const SizedBox(height: 16),

                    // Botão REINICIAR APLICATIVO
                    _settingsButton(
                      backgroundColor: Colors.grey,
                      label: 'REINICIAR APLICATIVO',
                      onTap: () {
                        Restart.restartApp();
                      },
                    ),
                  ],
                ),
              ),
            ),

            Container(height: 30, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget _settingsButton({
    required String label,
    required VoidCallback onTap,
    required MaterialColor backgroundColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
