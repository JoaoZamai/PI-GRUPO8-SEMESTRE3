import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';
import 'package:PIGRUPO8SEMESTRE3main/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:PIGRUPO8SEMESTRE3main/viewmodels/register_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  late final RegisterViewmodel viewModel;

  Future<void> irParaPackbag() async {
    final Uri url = Uri.parse('https://packbag.com.br/contato/');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    } else {
      throw Exception('Não foi possível abrir $url');
    }
  }
  
  @override
  void initState() {
    super.initState();
    viewModel = RegisterViewmodel();
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
                SizedBox(height: 15),

                Expanded(
                  child: Container(
                    color: AppColors.branco,
                    child: Column(
                      children: [
                        // botão voltar

                        SizedBox(height: 40),

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
                                  Icon(Icons.account_circle, size: 100, color: AppColors.preto),

                                  SizedBox(height: 30),

                                  Form(
                                    key: viewModel.formKey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: viewModel.emailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: viewModel.emailValidator,
                                          style: TextStyle(color: AppColors.preto),
                                          decoration: InputDecoration(
                                            labelText: "Email",
                                            labelStyle: TextStyle(color: AppColors.pretoClaro),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: AppColors.pretoClaro),
                                            ),

                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: AppColors.pretoClaro, width: 2),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.email_outlined,
                                              color: AppColors.pretoClaro
                                            ),
                                            filled: true,
                                            fillColor: AppColors.branco,
                                          ),
                                        ),

                                        SizedBox(height: 20),

                                        TextFormField(
                                          controller: viewModel.nomeController,
                                          keyboardType: TextInputType.text,
                                          validator: viewModel.nomeValidator,
                                          style: TextStyle(color: AppColors.preto),
                                          decoration: InputDecoration(
                                            labelText: "Usuário",
                                            labelStyle: TextStyle(color: AppColors.pretoClaro),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: AppColors.pretoClaro),
                                            ),

                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: AppColors.pretoClaro, width: 2),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.account_circle_outlined,
                                              color: AppColors.pretoClaro
                                            ),
                                            filled: true,
                                            fillColor: AppColors.branco,
                                          ),
                                        ),

                                        SizedBox(height: 20),

                                        TextFormField(
                                          controller:
                                              viewModel.passwordController,
                                          obscureText:
                                              viewModel.obscurePassword,
                                          validator:
                                              viewModel.passwordValidator,
                                          style: TextStyle(color: AppColors.preto),
                                          decoration: InputDecoration(
                                            labelText: "Senha",
                                            labelStyle: TextStyle(color: AppColors.pretoClaro),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: AppColors.pretoClaro),
                                            ),

                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: AppColors.pretoClaro, width: 2),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.lock_outlined,
                                              color: AppColors.pretoClaro
                                            ),
                                            suffixIcon: IconButton(
                                              onPressed: viewModel
                                                  .togglePasswordVisibility,
                                              icon: Icon(
                                                viewModel.obscurePassword
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: AppColors.preto
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: AppColors.branco,
                                          ),
                                        ),

                                        SizedBox(height: 20),

                                        TextFormField(
                                          controller:
                                              viewModel.confirmController,
                                          obscureText:
                                              viewModel.obscurePassword,
                                          validator: viewModel.confirmValidator,
                                          style: TextStyle(color: AppColors.preto),
                                          decoration: InputDecoration(
                                            labelText: "Confirmar Senha",
                                            labelStyle: TextStyle(color: AppColors.pretoClaro),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: AppColors.pretoClaro),
                                            ),

                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: AppColors.pretoClaro, width: 2),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.lock_outlined,
                                              color: AppColors.pretoClaro
                                            ),
                                            suffixIcon: IconButton(
                                              onPressed: viewModel
                                                  .toggleConfirmVisibility,
                                              icon: Icon(
                                                viewModel.obscureConfirm
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: AppColors.preto
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: AppColors.branco,
                                          ),
                                        ),

                                        SizedBox(height: 30),

                                        ElevatedButton(
                                          onPressed: viewModel.isLoading
                                              ? null
                                              : () async {
                                                  final error = await viewModel
                                                      .register();

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
                                                          "Usuário cadastrado com sucesso!",
                                                        ),
                                                      ),
                                                    );

                                                    Navigator.pushNamed(
                                                      context,
                                                      AppRoutes.home,
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
                                                  "Criar Conta",
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

                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      irParaPackbag();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.laranja,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 10,
                      shadowColor: AppColors.pretoClaro,
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Ajuda',
                      style: TextStyle(fontSize: 15, color: AppColors.branco),
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                Container(height: 30, color: AppColors.preto),
              ],
            ),
          ),
        );
      },
    );
  }
}
