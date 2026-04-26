import 'package:PIGRUPO8SEMESTRE3main/routes/app_routes.dart';
import 'package:PIGRUPO8SEMESTRE3main/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:percent_indicator/percent_indicator.dart';

// Aqui importamos a sua lógica que criamos no Arquivo 1
import 'package:PIGRUPO8SEMESTRE3main/viewmodels/firebase_data/cortes.dart';

class MachineScreen extends StatefulWidget {
  const MachineScreen({super.key});

  @override
  State<MachineScreen> createState() => _MachineScreenState();
}

class _MachineScreenState extends State<MachineScreen> {
  // Instancie a sua classe de serviço que está dentro de cortes.dart
  // (Se você deu outro nome para a classe, mude aqui)
  final ContagemCortesService _service = ContagemCortesService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fundo branco conforme solicitado
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Image.asset(
          'lib/assets/pblogo.png',
          width: 160,
          height: 80,
          fit: BoxFit.contain,
        ),
      ),
      // Corpo da tela envolto no StreamBuilder para atualizar em tempo real
      body: StreamBuilder<List<LogPHR>>(
        stream: _service.getLogsDeHoje(), // O método que busca os dados de hoje
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.grey),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar dados: ${snapshot.error}'),
            );
          }

          // 1. Recebe os dados brutos
          final logs = snapshot.data ?? [];

          // 2. Lógica para processar os totais e gerar os pontos do gráfico
          final int totalPecas = _service.calcularTotalPecas(logs);
          final double percentualMeta = _service.calcularPercentualMeta(
            totalPecas,
          );
          final List<FlSpot> spotsGrafico = _service.gerarSpotsDoGrafico(logs);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Cards Superiores
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildCardPecasCortadas(totalPecas),
                    _buildCardMeta(percentualMeta),
                  ],
                ),
                const SizedBox(height: 40),

                // Gráfico Inferior
                _buildGraficoHoras(spotsGrafico),
              ],
            ),
          );
        },
      ),
    );
  }

  // ==========================================
  // WIDGETS VISUAIS (Tons de Cinza)
  // ==========================================

  Widget _buildCardPecasCortadas(int totalPecas) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[800], // Cinza escuro para o título
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'Peças Cortadas',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            color: Colors.grey[400], // Cinza médio para o corpo do card
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              '$totalPecas',
              style: TextStyle(
                fontSize: 48,
                color: Colors.grey[900],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardMeta(double percentual) {
    int textoPorcentagem = (percentual * 100).toInt();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'META',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: 120,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.grey[300], // Fundo claro do container da meta
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '$textoPorcentagem%',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: LinearPercentIndicator(
                  width: 140.0,
                  lineHeight: 30.0,
                  percent: percentual,
                  backgroundColor: Colors.white,
                  progressColor:
                      Colors.grey[600], // A barra de progresso em cinza
                  barRadius: const Radius.circular(8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGraficoHoras(List<FlSpot> spotsGrafico) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[100], // Fundo bem claro para o gráfico
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 2,
        ), // Borda cinza suave
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Produção nas últimas horas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                minY: 0,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 10,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.shade300, // Linhas de fundo do gráfico
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "${value.toInt()}:00",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[700],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          "${value.toInt()}",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[700],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: spotsGrafico.isEmpty
                        ? [const FlSpot(0, 0)]
                        : spotsGrafico,
                    isCurved: false,
                    color: Colors.grey[700], // Linha do gráfico cinza escuro
                    barWidth: 3,
                    dotData: FlDotData(show: true),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
