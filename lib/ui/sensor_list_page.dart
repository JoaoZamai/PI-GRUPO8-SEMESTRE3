import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';
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
                SizedBox(height: 20),

                Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: Colors.grey.shade100,
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
                              color: Colors.grey.shade200,
                            ),
                            child: const Icon(Icons.memory, size: 30),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Adicionar nova Conexão",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
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
                            child: const Icon(Icons.add, color: Colors.black),
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
                        color: Colors.grey.shade100,
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
                                    color: Colors.grey.shade200,
                                  ),
                                  child: const Icon(Icons.memory, size: 30),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        sensor.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
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
                                            style: const TextStyle(
                                              color: Colors.black54,
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
                                      child: Icon(
                                        Icons.add_link,
                                        color: Colors.black,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        viewModel.onSensorPressed(
                                          context,
                                          sensor,
                                        );
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.black,
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

                Container(height: 30, color: Colors.black),
              ],
            ),
          ),
        );
      },
    );
  }
}
