import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class RegisterViewmodel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  String? nomeValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('nome é obrigatório'),
      Validatorless.min(3, 'O nome deve ter pelo menos 3 caracteres'),
    ])(value);
  }

  String? emailValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Email é obrigatório'),
      Validatorless.email('Digite um email válido'),
    ])(value);
  }

  String? passwordValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Senha é obrigatório'),
      Validatorless.min(6, 'A senha deve ter pelo menos 6 caracteres'),
    ])(value);
  }

  String? confirmValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Confirmação de senha é obrigatória'),
      Validatorless.compare(
        passwordController,
        'As senhas não coincidem',
      ),
    ])(value);
  }

  
  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }
}