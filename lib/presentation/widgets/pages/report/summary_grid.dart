import 'package:flutter/material.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';
import 'package:flutter_simple_arch/presentation/pages/message_page.dart';
import 'report_summary_card.dart';

class SummaryGrid extends StatelessWidget {
  const SummaryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: const [
        ReportSummaryCard(
          title: "Pendapatan",
          value: "\$12,345",
          icon: Icons.monetization_on_outlined,
          color: AppColors.accentGreen,
        ),
        ReportSummaryCard(
          title: "Pendapatan",
          value: "\$12,345",
          icon: Icons.monetization_on_outlined,
          color: AppColors.accentGreen,
        ),
        ReportSummaryCard(
          title: "Pendapatan",
          value: "\$12,345",
          icon: Icons.monetization_on_outlined,
          color: AppColors.accentGreen,
        ),
        ReportSummaryCard(
          title: "Pendapatan",
          value: "\$12,345",
          icon: Icons.monetization_on_outlined,
          color: AppColors.accentGreen,
        ),
      ],
    );
  }
}
