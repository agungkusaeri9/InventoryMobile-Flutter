import 'package:flutter/material.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';
import 'package:flutter_simple_arch/data/models/dashboard_summary.dart';
import 'package:flutter_simple_arch/data/services/api_service.dart';
import 'package:flutter_simple_arch/data/services/dashboard_service.dart';
import 'package:flutter_simple_arch/presentation/widgets/ui/dashboard/dashboard_summary_card.dart';

class DashboardItem {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  DashboardItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });
}

class DashboardSummaryCard extends StatefulWidget {
  const DashboardSummaryCard({super.key});

  @override
  State<DashboardSummaryCard> createState() => _DashboardSummaryCardState();
}

class _DashboardSummaryCardState extends State<DashboardSummaryCard> {
  final DashboardService service = DashboardService(ApiService());

  DashboardSummary? summary;
  bool loading = true;
  String? error;

  Future<void> loadSummary() async {
    try {
      final result = await service.getSummary();
      if (!mounted) return;
      setState(() {
        summary = result;
        loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        error = e.toString();
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadSummary();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return Center(child: Text("Error: $error"));
    }

    if (summary == null) {
      return const Center(child: Text("No data"));
    }

    final items = [
      DashboardItem(
        title: "Stok Rendah",
        value: summary!.lowStockCount.toString(),
        icon: Icons.warning_amber_rounded,
        color: AppColors.accentRed,
      ),
      DashboardItem(
        title: "Barang Masuk Hari Ini",
        value: summary!.stockInTotalQty.toString(),
        icon: Icons.arrow_downward,
        color: AppColors.accentGreen,
      ),
      DashboardItem(
        title: "Barang Keluar Hari Ini",
        value: summary!.stockOutTotalQty.toString(),
        icon: Icons.arrow_upward,
        color: AppColors.accentOrange,
      ),
      DashboardItem(
        title: "Total Produk",
        value: summary!.productCount.toString(),
        icon: Icons.inventory_2_outlined,
        color: AppColors.accentBlue,
      ),
    ];

    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final item = items[index];
          return SummaryCard(
            title: item.title,
            value: item.value,
            icon: item.icon,
            color: item.color,
          );
        },
      ),
    );
  }
}
