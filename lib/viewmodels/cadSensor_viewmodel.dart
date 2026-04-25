import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadSensorViewmodel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();

  bool isLoading = false;

  String? status = "ativo";

  bool statusfire = false;

  String? nomeValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Nome é obrigatório'),
      Validatorless.min(3, 'O nome deve ter pelo menos 3 caracteres'),
    ])(value);
  }

  Future<String?> register() async {
    if (!formKey.currentState!.validate()) {
      return "form_error";
    }

    isLoading = true;
    notifyListeners();

    if(status == "Ativo")
    {
      statusfire = true;
    }
    else
    {
      statusfire = false;
    }


    try {
      final nome = nomeController.text.trim();

      //verifica nome
      final result = await FirebaseFirestore.instance
          .collection('Sensor')
          .where('NomeSensor', isEqualTo: nome)
          .get();

      if (result.docs.isNotEmpty) {
        isLoading = false;
        notifyListeners();
        return "Sensor já cadastrado";
      }

      //salva Firestore
      await FirebaseFirestore.instance.collection('Sensor').add({
        'NomeSensor': nomeController.text.trim(),
        'Operando': statusfire,
      });

      isLoading = false;
      notifyListeners();

      return null; // sucesso
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return "Erro ao cadastrar sensor";
    }
  }

  Future<String?> alterar(String id) async {
    if (!formKey.currentState!.validate()) {
      return "form_error";
    }

    isLoading = true;
    notifyListeners();

    if(status == "Ativo")
    {
      statusfire = true;
    }
    else
    {
      statusfire = false;
    }

    try {
      final nome = nomeController.text.trim();

      //altera Firestore
      await FirebaseFirestore.instance
          .collection('Sensor')
          .doc(id)
          .update({
        'NomeSensor': nome,
        'Operando': statusfire,
      });

      isLoading = false;
      notifyListeners();

      return null; // sucesso
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return "Erro ao alterar sensor";
    }
  }
}
