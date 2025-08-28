import 'package:flutter/material.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';
// import 'package:flutter_simple_arch/presentation/pages/product_page.dart';

class DownloadableReports extends StatelessWidget {
  const DownloadableReports({super.key});

  Widget _reportItem(String title, String subtitle) {
    return ListTile(
      leading: const Icon(Icons.article_outlined, color: AppColors.primary),
      title: Text(title,
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
      subtitle: Text(subtitle,
          style: const TextStyle(color: AppColors.textSecondary)),
      trailing: const Icon(Icons.download_for_offline_outlined,
          color: AppColors.textSecondary),
      onTap: () {
        // TODO: logika download
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          _reportItem("Laporan Penjualan Harian", "PDF, 2.1 MB"),
          _reportItem("Laporan Stok Produk", "Excel, 1.5 MB"),
          _reportItem("Laporan Pelanggan", "PDF, 3.0 MB"),
        ],
      ),
    );
  }
}
