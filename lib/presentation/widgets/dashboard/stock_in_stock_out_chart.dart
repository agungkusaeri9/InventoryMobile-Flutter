import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';
import 'package:flutter_simple_arch/data/services/api_service.dart';
import 'package:flutter_simple_arch/data/services/dashboard_service.dart';
import 'package:intl/intl.dart';

class StockInStockOutChart extends StatefulWidget {
  const StockInStockOutChart({super.key});

  @override
  State<StockInStockOutChart> createState() => _StockInStockOutChartState();
}

class _StockInStockOutChartState extends State<StockInStockOutChart> {
  final DashboardService service = DashboardService(ApiService());

  List<DateTime> labels = [];
  List<FlSpot> stockInData = [];
  List<FlSpot> stockOutData = [];

  bool loading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    loadChart();
  }

  Future<void> loadChart() async {
    try {
      final data = await service.getChart();

      final inSpots = data.asMap().entries.map((e) {
        return FlSpot(e.key.toDouble(), e.value.stockIn.toDouble());
      }).toList();

      final outSpots = data.asMap().entries.map((e) {
        return FlSpot(e.key.toDouble(), e.value.stockOut.toDouble());
      }).toList();

      setState(() {
        labels = data.map((e) => e.label).toList();
        stockInData = inSpots;
        stockInData = inSpots;
        stockOutData = outSpots;
        loading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        loading = false;
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return Center(child: Text("Error: $error"));
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50,
                      interval:
                          1, // tetep 1, tapi kontrol manual di getTitlesWidget
                      getTitlesWidget: (value, meta) {
                        // cari nilai min & max dari data
                        final allValues = [...stockInData, ...stockOutData]
                            .map((e) => e.y)
                            .toList();
                        if (allValues.isEmpty) return const Text("");

                        final minY = allValues.reduce((a, b) => a < b ? a : b);
                        final maxY = allValues.reduce((a, b) => a > b ? a : b);

                        // ambil hanya min, max, dan step tengah (quarter)
                        final step = (maxY - minY) / 4;

                        if (value == minY ||
                            value == maxY ||
                            (value - minY) % step == 0) {
                          final formatted =
                              NumberFormat.compact().format(value.toInt());
                          return Text(
                            formatted,
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          );
                        }

                        return const Text(""); // skip angka lain
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() < 0 ||
                            value.toInt() >= labels.length) {
                          return const Text("");
                        }
                        final label = labels[value.toInt()];
                        return Transform.rotate(
                          angle: -0.5,
                          child: Text(
                            DateFormat("d MMM", "id_ID").format(label),
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 11,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: stockInData,
                    isCurved: true,
                    color: AppColors.accentGreen,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: true),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          AppColors.accentGreen.withOpacity(0.3),
                          AppColors.accentGreen.withOpacity(0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  LineChartBarData(
                    spots: stockOutData,
                    isCurved: true,
                    color: AppColors.accentRed,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: true),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          AppColors.accentRed.withOpacity(0.3),
                          AppColors.accentRed.withOpacity(0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          // 🔹 Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem(AppColors.accentGreen, "Stock In"),
              const SizedBox(width: 20),
              _buildLegendItem(AppColors.accentRed, "Stock Out"),
            ],
          )
        ],
      ),
    );
  }

// helper widget legend
  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
