class UsuarioModel {
  final String id;
  final String nome;
  final String email;
  final String idsensor;

  UsuarioModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.idsensor,
  });

  factory UsuarioModel.fromMap(String id, Map<String, dynamic> data) {
    return UsuarioModel(
      id: id,
      nome: data['nome'] ?? '',
      email: data['email'] ?? '',
      idsensor: data['idsensor'] ?? '',
    );
  }
}