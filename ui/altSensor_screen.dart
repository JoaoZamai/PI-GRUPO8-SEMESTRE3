import 'package:PIGRUPO8SEMESTRE3main/models/sensormodel.dart';
import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';
import 'package:PIGRUPO8SEMESTRE3main/ui/app_colors.dart';
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
      builder: (_, __) {
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
                SizedBox(height: 50),

                Expanded(
                  child: Container(
                    color: AppColors.branco,
                    child: Column(
                      children: [

                        SizedBox(height: 15),

                        Center(
                          child: Container(
                            width: 320,
                            height: 600,
                            decoration: BoxDecoration(
                              color: AppColors.cinzaClaro,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.pretoClaro,
                                  blurRadius: 18,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),

                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  SizedBox(height: 125),

                                  Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Icon(Icons.memory, size: 50, color: AppColors.preto),
                                      Icon(Icons.edit, size: 20, color: AppColors.preto),
                                    ],
                                  ),

                                  SizedBox(height: 30),

                                  Form(
                                    key: viewModel.formKey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: viewModel.nomeController,
                                          keyboardType: TextInputType.text,
                                          validator: viewModel.nomeValidator,
                                          style: TextStyle(color: AppColors.preto),
                                          decoration: InputDecoration(
                                            labelText: "Nome Conexão",
                                            labelStyle: TextStyle(color: AppColors.pretoClaro),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: AppColors.pretoClaro),
                                            ),

                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: AppColors.pretoClaro, width: 2),
                                            ),
                                            prefixIcon: Icon(Icons.add, color: AppColors.pretoClaro),
                                            filled: true,
                                            fillColor: AppColors.branco,
                                          ),
                                        ),

                                        SizedBox(height: 20),

                                        DropdownButtonFormField<String>(
                                          initialValue: sensor.operando,

                                          style: TextStyle(
                                            color: AppColors.preto
                                          ),

                                          iconEnabledColor: AppColors.pretoClaro,

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
                                          decoration: InputDecoration(
                                            labelText: "Status",
                                            labelStyle: TextStyle(color: AppColors.pretoClaro),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: AppColors.pretoClaro),
                                            ),

                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: AppColors.pretoClaro, width: 2),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.toggle_on_outlined,
                                              color: AppColors.pretoClaro
                                            ),
                                            filled: true,
                                            fillColor: AppColors.branco,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Selecione um status";
                                            }
                                            return null;
                                          },
                                        ),

                                        SizedBox(height: 30),

                                        ElevatedButton(
                                          onPressed: viewModel.isLoading
                                              ? null
                                              : () async {
                                                  final error = await viewModel
                                                      .alterar(sensor.id);

                                                  if (error == "form_error")
                                                    return;

                                                  if (error != null) {
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                        content: Text(error),
                                                      ),
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                          "Sensor alterado com sucesso!",
                                                        ),
                                                      ),
                                                    );

                                                    Navigator.pushNamed(
                                                      context,
                                                      AppRoutes.sensores,
                                                    );
                                                  }
                                                },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.laranja,
                                            minimumSize: const Size(
                                              150,
                                              40,
                                            ), // width e height
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            elevation: 10,
                                            shadowColor: Colors.black38,
                                          ),
                                          child: viewModel.isLoading
                                              ? SizedBox(
                                                  width: 22,
                                                  height: 22,
                                                  child:
                                                      CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                        color: AppColors.branco,
                                                      ),
                                                )
                                              : Text(
                                                  "Alterar",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: AppColors.branco,
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
      },
    );
  }
}
