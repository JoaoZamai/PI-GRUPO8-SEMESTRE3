import 'package:PIGRUPO8SEMESTRE3main/models/sensormodel.dart';
import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:PIGRUPO8SEMESTRE3main/viewmodels/cadSensor_viewmodel.dart';

class AltSensorScreen extends StatefulWidget {
  const AltSensorScreen({super.key});

  @override
  State<AltSensorScreen> createState() => _AltSensorScreenState();
}

class _AltSensorScreenState extends State<AltSensorScreen> {
  late final CadSensorViewmodel viewModel;
  
  late SensorModel sensor;
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    sensor = ModalRoute.of(context)!.settings.arguments as SensorModel;

    viewModel.nomeController.text = sensor.name;
  }

  @override
  void initState() {
    super.initState();
    viewModel = CadSensorViewmodel();
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
      builder: (_, __){
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
                        Padding(
                          padding: const EdgeInsets.only(left: 16), // ajusta aqui
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: GestureDetector(
                                onTap: () => Navigator.pushNamed(context, AppRoutes.sensores),
                                child: Image.asset(
                                  'lib/assets/voltar.png',
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
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

                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  SizedBox(height: 125,),

                                  Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Icon(Icons.memory, size: 50),
                                      Icon(Icons.edit, size: 20),
                                    ],
                                  ),
                                  
                                  SizedBox(height: 30,),
                                  
                                  Form(
                                    key: viewModel.formKey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: viewModel.nomeController,
                                          keyboardType: TextInputType.text,
                                          validator: viewModel.nomeValidator,
                                          decoration: const InputDecoration(
                                            labelText: "Nome Conexão",
                                            border: OutlineInputBorder(),
                                            prefixIcon: Icon(Icons.add),
                                            filled: true,
                                            fillColor: Colors.white
                                          ),
                                        ),

                                        SizedBox(height: 20,),
                                        
                                        DropdownButtonFormField<String>(
                                          initialValue: sensor.operando,
                                          items: const [
                                            DropdownMenuItem(
                                              value: "Ativo",
                                              child: Text("Ativo"),
                                            ),
                                            DropdownMenuItem(
                                              value: "Inativo",
                                              child: Text("Inativo"),
                                            ),
                                          ],
                                          onChanged: (value) {
                                            if (value != null) {
                                              viewModel.status = value;
                                              viewModel.notifyListeners();
                                            }
                                          },
                                          decoration: const InputDecoration(
                                            labelText: "Status",
                                            border: OutlineInputBorder(),
                                            prefixIcon: Icon(Icons.toggle_on_outlined),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Selecione um status";
                                            }
                                            return null;
                                          },
                                        ),
                                        
                                        SizedBox(height: 30,),

                                        ElevatedButton(
                                          onPressed: viewModel.isLoading ? null : () async {
                                            final error = await viewModel.alterar(sensor.id);

                                            if (error == "form_error") return;

                                            if (error != null) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text(error)),
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(content: Text("Sensor alterado com sucesso!")),
                                              );

                                              Navigator.pushNamed(context, AppRoutes.sensores);
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.deepOrange,
                                            minimumSize: const Size(150, 40), // width e height
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            elevation: 10,
                                            shadowColor: Colors.black38,
                                          ),
                                          child: viewModel.isLoading
                                              ? const SizedBox(
                                                  width: 22,
                                                  height: 22,
                                                  child: CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              : const Text(
                                                  "Alterar",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                        )
                                      ],
                                    ),
                                  )
                                ]
                              ),
                            ),
                          ),
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
    ); 
  }
}
