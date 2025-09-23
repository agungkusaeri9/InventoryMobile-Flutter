import 'package:flutter/widgets.dart';

class RecentActivity extends StatefulWidget {
  const RecentActivity({super.key});

  @override
  State<RecentActivity> createState() => _RecentActivityState();
}

class _RecentActivityState extends State<RecentActivity> {
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
        ],
      ),
    );
  }
}
