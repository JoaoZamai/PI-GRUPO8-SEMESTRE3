import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';

// 1. O Modelo de Dados (Estrutura do documento do Firebase)
class LogPHR {
  final String idSensor;
  final int leitura;
  final int lote;
  final DateTime dataHora;

  LogPHR({
    required this.idSensor,
    required this.leitura,
    required this.lote,
    required this.dataHora,
  });

  factory LogPHR.fromFirestore(Map<String, dynamic> json) {
    String dataString = json['dataleitura'];
    String horaString = json['horaleitura'];
    return LogPHR(
      idSensor: json['idSensor'] ?? '',
      leitura: json['leitura'] ?? 0,
      lote: json['lote'] ?? 0,
      dataHora: DateTime.parse("$dataString $horaString"),
    );
  }
}

// 2. A Classe de Serviço (Lógica e Firebase)
class ContagemCortesService {
  // Defina a meta diária da sua máquina aqui
  final int metaDiaria = 200;

  // Busca os dados do Firebase em Tempo Real (Stream)
  Stream<List<LogPHR>> getLogsDeHoje() {
    DateTime agora = DateTime.now();
    // Formata a data para ficar igual ao seu banco: YYYY-MM-DD
    String dataHoje =
        "${agora.year}-${agora.month.toString().padLeft(2, '0')}-${agora.day.toString().padLeft(2, '0')}";

    return FirebaseFirestore.instance
        .collection('LogsPHR')
        .where('dataleitura', isEqualTo: dataHoje)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) =>
                    LogPHR.fromFirestore(doc.data() as Map<String, dynamic>),
              )
              .toList(),
        );
  }

  // Calcula a soma do campo 'leitura'
  int calcularTotalPecas(List<LogPHR> logs) {
    return logs.fold(0, (soma, item) => soma + item.leitura);
  }

  // Calcula a porcentagem da meta (retorna de 0.0 a 1.0)
  double calcularPercentualMeta(int totalPecas) {
    if (metaDiaria <= 0) return 0.0;
    double percentual = totalPecas / metaDiaria;
    return percentual > 1.0 ? 1.0 : percentual; // Trava em 100% no máximo
  }

  // Agrupa as produções por hora para o fl_chart
  List<FlSpot> gerarSpotsDoGrafico(List<LogPHR> logs) {
    Map<int, int> porHora = {};

    for (var log in logs) {
      int hora = log.dataHora.hour;
      porHora[hora] = (porHora[hora] ?? 0) + log.leitura;
    }

    // Ordena as horas para o gráfico desenhar a linha na direção certa (da esquerda pra direita)
    var horasOrdenadas = porHora.keys.toList()..sort();

    return horasOrdenadas.map((hora) {
      return FlSpot(hora.toDouble(), porHora[hora]!.toDouble());
    }).toList();
  }
}
