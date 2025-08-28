import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';
import 'package:flutter_simple_arch/presentation/pages/message_page.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/dashboard/dashboard_recent_transactions.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/dashboard/dashboard_sales_chart.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/dashboard/dashboard_section_title.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/dashboard/dashboard_summary_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.background,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Halo, Pengguna!",
                  style:
                      TextStyle(color: AppColors.textSecondary, fontSize: 16)),
              const SizedBox(height: 4),
              const Text("Selamat Datang Kembali 👋",
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),

              // Summary Cards
              SizedBox(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    SummaryCard(
                        title: "Pengguna",
                        value: "1,2k",
                        icon: Icons.people_outline,
                        color: AppColors.accentGreen),
                    SizedBox(width: 16),
                    SummaryCard(
                        title: "Pesanan",
                        value: "320",
                        icon: Icons.shopping_bag_outlined,
                        color: AppColors.accentGreen),
                    SizedBox(width: 16),
                    SummaryCard(
                        title: "Pendapatan",
                        value: "\$12k",
                        icon: Icons.attach_money,
                        color: AppColors.accentGreen),
                    SizedBox(width: 16),
                    SummaryCard(
                        title: "Produk",
                        value: "89",
                        icon: Icons.grid_view_outlined,
                        color: AppColors.accentGreen),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              const SectionTitle(title: "Analitik Penjualan"),
              const SizedBox(height: 16),
              const SalesChart(),
              const SizedBox(height: 30),

              const SectionTitle(title: "Transaksi Terakhir"),
              const SizedBox(height: 16),
              const RecentTransactions(),
            ],
          ),
        ),
      ),
    );
  }
}
