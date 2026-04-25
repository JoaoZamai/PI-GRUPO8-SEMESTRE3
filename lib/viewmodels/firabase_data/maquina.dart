import 'package:cloud_firestore/cloud_firestore.dart';

Future<String?> lerNomeMaquina() async {
  final snapshot = await FirebaseFirestore.instance
      .collection('Sensor')
      .doc('Esp1')
      .get();

  if (!snapshot.exists) return null;

  final dados = snapshot.data() as Map<String, dynamic>;
  return dados['NomeSensor'] as String?;
}

Future<bool?> lerEstadoMaquina() async {
  final snapshot = await FirebaseFirestore.instance
      .collection('Sensor')
      .doc('Esp1')
      .get();

  if (!snapshot.exists) return null;

  final dados = snapshot.data() as Map<String, dynamic>;
  return dados['Operando'] as bool?;
}
