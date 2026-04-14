import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterViewmodel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirm = true;
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
      Validatorless.compare(passwordController, 'As senhas não coincidem'),
    ])(value);
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleConfirmVisibility() {
    obscureConfirm = !obscureConfirm;
    notifyListeners();
  }

  String hashSenha(String senha) {
    return sha256.convert(utf8.encode(senha)).toString();
  }

  Future<String?> register() async {
    if (!formKey.currentState!.validate()) {
      return "form_error";
    }

    isLoading = true;
    notifyListeners();

    try {
      final email = emailController.text.trim();

      //verifica email
      final result = await FirebaseFirestore.instance
          .collection('usuarios')
          .where('email', isEqualTo: email)
          .get();

      if (result.docs.isNotEmpty) {
        isLoading = false;
        notifyListeners();
        return "Email já cadastrado";
      }

      //salva Firestore
      await FirebaseFirestore.instance.collection('usuarios').add({
        'nome': nomeController.text.trim(),
        'email': email,
        'senha': hashSenha(passwordController.text),
        'idSensor' : ''
      });

      isLoading = false;
      notifyListeners();

      return null; // sucesso
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return "Erro ao cadastrar usuário";
    }
  }
}
