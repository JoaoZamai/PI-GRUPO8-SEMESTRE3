import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';
import 'package:PIGRUPO8SEMESTRE3main/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:PIGRUPO8SEMESTRE3main/viewmodels/sensor_viewmodel.dart';

class SensorListPage extends StatefulWidget {
  const SensorListPage({super.key});

  @override
  State<SensorListPage> createState() => _SensorListPageState();
}

class _SensorListPageState extends State<SensorListPage> {
  late final SensorViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = SensorViewModel();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (_, _) {
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
                SizedBox(height: 20),

                Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: AppColors.contraste
                        ? BorderSide(
                            color: AppColors.preto,
                            width: 2,
                          )
                        : BorderSide.none,
                  ),
                  color: AppColors.cinzaClaro2,
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.cinzaClaro,
                              border: AppColors.contraste
                                ? Border.all(
                                    color: AppColors.preto,
                                    width: 2,
                                  )
                                : null,
                            ),
                            child: Icon(Icons.memory, size: 30, color: AppColors.preto),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Adicionar nova Conexão",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.preto
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.cadsensores,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.branco,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              side: AppColors.contraste
                                ? BorderSide(
                                    color: AppColors.preto,
                                    width: 2,
                                  )
                                : BorderSide.none,
                            ),
                            child: Icon(Icons.add, color: AppColors.preto),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: viewModel.sensores.length,
                    itemBuilder: (context, index) {
                      final sensor = viewModel.sensores[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: AppColors.contraste
                              ? BorderSide(
                                  color: AppColors.preto,
                                  width: 2,
                                )
                              : BorderSide.none,
                        ),
                        color: AppColors.cinzaClaro2,
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.cinzaClaro,
                                    border: AppColors.contraste
                                      ? Border.all(
                                          color: AppColors.preto,
                                          width: 2,
                                        )
                                      : null,
                                  ),
                                  child: Icon(Icons.memory, size: 30, color: AppColors.preto),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        sensor.name,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.preto
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 15,
                                            color: sensor.operando == 'Inativo'
                                                ? Colors.red
                                                : Colors.green,
                                          ),
                                          Text(
                                            sensor.operando,
                                            style: TextStyle(
                                              color: AppColors.preto,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        viewModel.linkarSensor(context, sensor);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.branco,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        side: AppColors.contraste
                                          ? BorderSide(
                                              color: AppColors.preto,
                                              width: 2,
                                            )
                                          : BorderSide.none,
                                      ),
                                      child: Icon(
                                        Icons.add_link,
                                        color: AppColors.preto,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        viewModel.onSensorPressed(
                                          context,
                                          sensor,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.branco,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        side: AppColors.contraste
                                          ? BorderSide(
                                              color: AppColors.preto,
                                              width: 2,
                                            )
                                          : BorderSide.none,
                                      ),
                                      child: Icon(
                                        Icons.edit,
                                        color: AppColors.preto,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  color: Colors.black,
                  child: Column(
                    children: [
                      Image.asset(
                        AppColors.logop,
                        height: 60,
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "PACKBAG",
                        style: TextStyle(
                          color: AppColors.contraste ? AppColors.preto : AppColors.branco,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),

                      const SizedBox(height: 10),

                      GestureDetector(
                        onTap: () {
                        },
                        child: Text(
                          "Política de privacidade",
                          style: TextStyle(
                            color: AppColors.laranja,
                            fontSize: 12,
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      Text(
                        "© 2026 Pack Bag. Criado com carinho por Agência O3 Propaganda",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.contraste ? AppColors.preto : AppColors.cinza,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
