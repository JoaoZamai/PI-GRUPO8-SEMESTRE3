class SensorModel {
  final String id;
  final String name;
  final String operando;

  SensorModel({
    required this.id,
    required this.name,
    required this.operando,
  });

  factory SensorModel.fromMap(String id, Map<String, dynamic> data) {
    return SensorModel(
      id: id,
      name: data['NomeSensor'] ?? '',
      operando: data['Operando'] == true ? 'Ativo' : "Inativo",
    );
  }
}