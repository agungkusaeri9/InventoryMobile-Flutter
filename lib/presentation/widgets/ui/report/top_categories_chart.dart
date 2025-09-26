import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';

class TopCategoriesChart extends StatelessWidget {
  const TopCategoriesChart({super.key});

  Widget _indicator(Color color, String text) {
    return Row(
      children: <Widget>[
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: PieChart(
              PieChartData(
                borderData: FlBorderData(show: false),
                sectionsSpace: 2,
                centerSpaceRadius: 40,
                sections: [
                  PieChartSectionData(
                      color: AppColors.primary,
                      value: 40,
                      title: '40%',
                      radius: 50,
                      titleStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  PieChartSectionData(
                      color: AppColors.accentGreen,
                      value: 30,
                      title: '30%',
                      radius: 50,
                      titleStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  PieChartSectionData(
                      color: AppColors.accentGreen,
                      value: 15,
                      title: '15%',
                      radius: 50,
                      titleStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  PieChartSectionData(
                      color: AppColors.accentGreen,
                      value: 15,
                      title: '15%',
                      radius: 50,
                      titleStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _indicator(AppColors.primary, "Elektronik"),
                const SizedBox(height: 8),
                _indicator(AppColors.accentGreen, "Fashion"),
                const SizedBox(height: 8),
                _indicator(AppColors.accentGreen, "Makanan"),
                const SizedBox(height: 8),
                _indicator(AppColors.accentGreen, "Lainnya"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
