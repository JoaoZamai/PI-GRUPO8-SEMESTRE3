import 'package:PIGRUPO8SEMESTRE3main/ui/app_colors.dart';
import 'package:flutter/material.dart';

class SobreScreen extends StatefulWidget {
  const SobreScreen({super.key});

  @override
  State<SobreScreen> createState() => _SobreScreenState();
}

class _SobreScreenState extends State<SobreScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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

      body: SafeArea(
        child: Column(
          children: [
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
                        Text(
                          'SOBRE:',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.preto,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    Center(
                      child: Text(
                        'Protótipo de interface\ngráfica para o aplicativo,\nhaverá alterações.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.preto,
                          height: 1.6,
                        ),
                      ),
                    ),

                    Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'lib/assets/packbagcat.gif',
                            width: 600,
                            height: 600,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(height: 30, color: AppColors.preto),
          ],
        ),
      ),
    );
  }
}
