import 'package:flutter/material.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';
import 'package:flutter_simple_arch/presentation/widgets/ui/dashboard/dashboard_transaction_item.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
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
      child: const Column(
        children: [
          TransactionItem(
              title: "Pembelian Stok",
              date: "27 Agu 2025",
              amount: "-\$2,300",
              color: AppColors.accentGreen,
              icon: Icons.arrow_downward_rounded),
          TransactionItem(
              title: "Pembelian Stok",
              date: "27 Agu 2025",
              amount: "-\$2,300",
              color: AppColors.accentGreen,
              icon: Icons.arrow_downward_rounded),
          TransactionItem(
              title: "Pembelian Stok",
              date: "27 Agu 2025",
              amount: "-\$2,300",
              color: AppColors.accentGreen,
              icon: Icons.arrow_downward_rounded),
          TransactionItem(
              title: "Pembelian Stok",
              date: "27 Agu 2025",
              amount: "-\$2,300",
              color: AppColors.accentGreen,
              icon: Icons.arrow_downward_rounded),
          TransactionItem(
              title: "Pembelian Stok",
              date: "27 Agu 2025",
              amount: "-\$2,300",
              color: AppColors.accentGreen,
              icon: Icons.arrow_downward_rounded),
        ],
      ),
    );
  }
}
