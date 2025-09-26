import 'package:flutter/material.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';
import 'package:flutter_simple_arch/presentation/widgets/ui/dashboard/dashboard_section_title.dart';
import 'package:flutter_simple_arch/presentation/widgets/ui/report/date_range_picker.dart';
import 'package:flutter_simple_arch/presentation/widgets/ui/report/downloadable_reports.dart';
import 'package:flutter_simple_arch/presentation/widgets/ui/report/summary_grid.dart';
import 'package:flutter_simple_arch/presentation/widgets/ui/report/top_categories_chart.dart';
import 'package:flutter_simple_arch/presentation/widgets/ui/report/weekly_revenue_chart.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        title: const Text("Laporan",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DateRangePicker(),
            SizedBox(height: 24),
            SummaryGrid(),
            SizedBox(height: 24),
            SectionTitle(title: "Pendapatan Mingguan"),
            SizedBox(height: 16),
            WeeklyRevenueChart(),
            SizedBox(height: 24),
            SectionTitle(title: "Kategori Terlaris"),
            SizedBox(height: 16),
            TopCategoriesChart(),
            SizedBox(height: 24),
            SectionTitle(title: "Unduh Laporan"),
            SizedBox(height: 16),
            DownloadableReports(),
          ],
        ),
      ),
    );
  }
}
