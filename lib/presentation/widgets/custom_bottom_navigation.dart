import 'package:flutter/material.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';
import 'package:flutter_simple_arch/presentation/widgets/custom_drawer.dart';
import 'package:go_router/go_router.dart';

// Menggunakan class AppColors yang sama untuk konsistensi tema.
// class AppColors {
//   static const Color primary = Color(0xFF6C63FF);
//   static const Color background = Color(0xFFF5F7FA);
//   static const Color cardBackground = Colors.white;
//   static const Color textPrimary = Color(0xFF333333);
//   static const Color textSecondary = Color(0xFF757575);
// }

class MainNavScaffold extends StatelessWidget {
  final Widget child;
  const MainNavScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      drawer: const CustomDrawer(),
      bottomNavigationBar: Container(
        // Menambahkan shadow agar terlihat lebih modern
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: _getIndex(context),
          height: 70, // Memberi tinggi yang cukup
          backgroundColor: AppColors.cardBackground,
          indicatorColor: AppColors.primary.withOpacity(0.1),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          surfaceTintColor: AppColors.cardBackground,
          onDestinationSelected: (index) {
            // Logika navigasi menggunakan go_router
            switch (index) {
              case 0:
                context.go("/dashboard");
                break;
              case 1:
                context.go("/reports");
                break;
              case 2:
                context.go("/products");
                break;
              case 3:
                context.go("/messages");
                break;
              case 4:
                context.go("/settings");
                break;
            }
          },
          // Desain destinasi navigasi dengan 5 menu
          destinations: const [
            NavigationDestination(
              selectedIcon:
                  Icon(Icons.dashboard_rounded, color: AppColors.primary),
              icon: Icon(Icons.dashboard_outlined,
                  color: AppColors.textSecondary),
              label: "Dashboard",
            ),
            NavigationDestination(
              selectedIcon:
                  Icon(Icons.assessment_rounded, color: AppColors.primary),
              icon: Icon(Icons.assessment_outlined,
                  color: AppColors.textSecondary),
              label: "Laporan",
            ),
            NavigationDestination(
              selectedIcon:
                  Icon(Icons.inventory_2_rounded, color: AppColors.primary),
              icon: Icon(Icons.inventory_2_outlined,
                  color: AppColors.textSecondary),
              label: "Produk",
            ),
            NavigationDestination(
              selectedIcon:
                  Icon(Icons.chat_bubble_rounded, color: AppColors.primary),
              icon: Icon(Icons.chat_bubble_outline_rounded,
                  color: AppColors.textSecondary),
              label: "Pesan",
            ),
            NavigationDestination(
              selectedIcon:
                  Icon(Icons.settings_rounded, color: AppColors.primary),
              icon:
                  Icon(Icons.settings_outlined, color: AppColors.textSecondary),
              label: "Pengaturan",
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk mendapatkan index halaman yang sedang aktif, disesuaikan untuk 5 menu
  int _getIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith("/reports")) return 1;
    if (location.startsWith("/products")) return 2;
    if (location.startsWith("/messages")) return 3;
    if (location.startsWith("/settings")) return 4;
    return 0; // Default ke Dashboard
  }
}
