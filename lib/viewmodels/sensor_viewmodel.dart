import 'package:PIGRUPO8SEMESTRE3main/models/sensormodel.dart';
import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SensorViewModel extends ChangeNotifier {
  final List<SensorModel> _sensores = [];

  List<SensorModel> get sensores => _sensores;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  SensorViewModel() {
    fetchSensores();
  }

  Future<void> fetchSensores() async {
    final snapshot = await _firestore.collection('Sensor').get();

    _sensores.clear();

    for (var doc in snapshot.docs) {
      _sensores.add(
        SensorModel.fromMap(doc.id, doc.data()),
      );
    }

    notifyListeners();
  }

  void onSensorPressed(BuildContext context, SensorModel sensor) {
    Navigator.pushNamed(context, AppRoutes.altsensores, arguments: sensor);
  }
}
