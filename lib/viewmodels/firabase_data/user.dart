import 'package:PIGRUPO8SEMESTRE3main/models/usuariomodel.dart';
import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioViewModel extends ChangeNotifier {
  final List<UsuarioModel> _usuario = [];
  final FirebaseAuth auth = FirebaseAuth.instance;

  List<UsuarioModel> get usuario => _usuario;

  String nomeSensor = '';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  UsuarioViewModel() {
    fetchUsuarios();
  }

  Future<void> fetchUsuarios() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print("Usuário não está logado");
      return;
    }

    final uid = user.uid;

    final snapshot = await _firestore.collection('usuarios').doc(uid).get();

    _usuario.clear();

    if (snapshot.exists) {
      _usuario.add(
        UsuarioModel.fromMap(snapshot.id, snapshot.data()!),
      );

      final sensorDoc = await _firestore.collection('Sensor').doc(snapshot.data()?['idSensor']).get();

      nomeSensor = sensorDoc.data()?['NomeSensor'] ?? '';
    }

    notifyListeners();
  }
}
