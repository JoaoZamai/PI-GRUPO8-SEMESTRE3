import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';

class LoginViewmodel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

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

  String hashSenha(String senha) {
    return sha256.convert(utf8.encode(senha)).toString();
  }

  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      final email = emailController.text.trim();
      final senhaHash = hashSenha(passwordController.text);

      // Consulta no Firestore
      final result = await FirebaseFirestore.instance
          .collection('usuarios')
          .where('email', isEqualTo: email)
          .get();

      if (result.docs.isEmpty) {
        isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Email não encontrado')));
        return;
      }

      final userDoc = result.docs.first;
      final storedSenha = userDoc['senha'];

      if (senhaHash == storedSenha) {
        // Login bem-sucedido
        isLoading = false;
        notifyListeners();
        Navigator.pushNamed(context, AppRoutes.home);
      } else {
        isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Senha incorreta')));
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Erro ao fazer login')));
    }
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }
}
