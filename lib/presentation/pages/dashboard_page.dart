import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_arch/presentation/cubit/auth_cubit.dart';
import 'package:flutter_simple_arch/presentation/widgets/dashboard/dashboard_summary_card.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/dashboard/dashboard_recent_transactions.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/dashboard/dashboard_sales_chart.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/dashboard/dashboard_section_title.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/dashboard/dashboard_summary_card.dart';

class DashboardPage extends StatelessWidget {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final username = context.select<AuthCubit, String?>(
      (cubit) => cubit.state is AuthSuccess
          ? (cubit.state as AuthSuccess).user.username
          : null,
    );
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
              Text("Halo, ${username ?? "Guest"}",
                  style: const TextStyle(
                      color: AppColors.textSecondary, fontSize: 16)),
              const SizedBox(height: 4),
              const Text("Selamat Datang Kembali 👋",
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),

              // Summary Cards
              const DashboardSummaryCard(),
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
