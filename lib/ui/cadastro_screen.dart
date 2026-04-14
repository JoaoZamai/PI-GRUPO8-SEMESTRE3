import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:PIGRUPO8SEMESTRE3main/viewmodels/register_viewmodel.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  late final RegisterViewmodel viewModel;
  
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
                                  Icon(
                                    Icons.account_circle,
                                    size: 100,
                                  ),
                                  
                                  SizedBox(height: 30,),
                                  
                                  Form(
                                    key: viewModel.formKey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: viewModel.emailController,
                                          keyboardType: TextInputType.emailAddress,
                                          validator: viewModel.emailValidator,
                                          decoration: const InputDecoration(
                                            labelText: "Email",
                                            border: OutlineInputBorder(),
                                            prefixIcon: Icon(Icons.email_outlined),
                                            filled: true,
                                            fillColor: Colors.white
                                          ),
                                        ),

                                        SizedBox(height: 20,),

                                        TextFormField(
                                          controller: viewModel.nomeController,
                                          keyboardType: TextInputType.text,
                                          validator: viewModel.nomeValidator,
                                          decoration: const InputDecoration(
                                            labelText: "Usuário",
                                            border: OutlineInputBorder(),
                                            prefixIcon: Icon(Icons.account_circle_outlined),
                                            filled: true,
                                            fillColor: Colors.white
                                          ),
                                        ),

                                        SizedBox(height: 20,),

                                        TextFormField(
                                          controller: viewModel.passwordController,
                                          obscureText: viewModel.obscurePassword,
                                          validator: viewModel.passwordValidator,
                                          decoration: InputDecoration(
                                            labelText: "Senha",
                                            border: OutlineInputBorder(),
                                            prefixIcon: Icon(Icons.lock_outlined),
                                            suffixIcon: IconButton(
                                              onPressed: viewModel.togglePasswordVisibility,
                                              icon: Icon(
                                                viewModel.obscurePassword
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white
                                          ),
                                        ),

                                        SizedBox(height: 20,),

                                        TextFormField(
                                          controller: viewModel.confirmController,
                                          obscureText: viewModel.obscurePassword,
                                          validator: viewModel.confirmValidator,
                                          decoration: InputDecoration(
                                            labelText: "Confirmar Senha",
                                            border: OutlineInputBorder(),
                                            prefixIcon: Icon(Icons.lock_outlined),
                                            suffixIcon: IconButton(
                                              onPressed: viewModel.toggleConfirmVisibility,
                                              icon: Icon(
                                                viewModel.obscureConfirm
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white
                                          ),
                                        ),
                                        
                                        SizedBox(height: 30,),

                                        ElevatedButton(
                                          onPressed: viewModel.isLoading ? null : () async {
                                            final error = await viewModel.register();

                                            if (error == "form_error") return;

                                            if (error != null) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text(error)),
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(content: Text("Usuário cadastrado com sucesso!")),
                                              );

                                              Navigator.pushNamed(context, AppRoutes.home);
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
                                                  "Criar Conta",
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

                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 18,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Text(
                    'Ajuda',
                    style: TextStyle(fontSize: 15, color: Colors.white),
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
