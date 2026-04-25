import 'package:PIGRUPO8SEMESTRE3main/models/usuariomodel.dart';
import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';
import 'package:PIGRUPO8SEMESTRE3main/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:PIGRUPO8SEMESTRE3main/viewmodels/register_viewmodel.dart';

class AlterarScreen extends StatefulWidget {
  const AlterarScreen({super.key});

  @override
  State<AlterarScreen> createState() => _AlterarScreenState();
}

class _AlterarScreenState extends State<AlterarScreen> {
  late final RegisterViewmodel viewModel;

  late UsuarioModel usuario;

  @override
  void initState() {
    super.initState();
    viewModel = RegisterViewmodel();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    usuario = ModalRoute.of(context)!.settings.arguments as UsuarioModel;

    viewModel.nomeController.text = usuario.nome;
    viewModel.emailController.text = usuario.email;
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
                Expanded(
                  child: Container(
                    color: AppColors.branco,
                    child: Column(
                      children: [
                        // botão voltar
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                          ), // ajusta aqui
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.cinzaClaro,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context),
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
                                  const SizedBox(height: 80),

                                  Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Icon(Icons.account_circle, size: 50, color: AppColors.preto),
                                      Icon(Icons.edit, size: 20, color: AppColors.preto),
                                    ],
                                  ),

                                  const SizedBox(height: 30),

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
                                              color: AppColors.preto
                                            ),
                                            filled: true,
                                            fillColor: AppColors.branco,
                                          ),
                                        ),

                                        const SizedBox(height: 20),

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
                                              color: AppColors.preto
                                            ),
                                            filled: true,
                                            fillColor: AppColors.branco,
                                          ),
                                        ),

                                        const SizedBox(height: 20),

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
                                              color: AppColors.preto
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

                                        const SizedBox(height: 30),

                                        ElevatedButton(
                                          onPressed: viewModel.isLoading
                                              ? null
                                              : () async {
                                                  final error = await viewModel
                                                      .alterar(usuario.email);

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
                                                          "Usuário alterado com sucesso!",
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
                                            shadowColor: AppColors.pretoClaro,
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
                                                  "Alterar Perfil",
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
