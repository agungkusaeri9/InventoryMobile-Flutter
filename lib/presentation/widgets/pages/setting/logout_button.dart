import 'package:flutter/material.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.logout, color: AppColors.accentRed),
        label: const Text(
          "Keluar",
          style: TextStyle(
              color: AppColors.accentRed, fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentRed.withOpacity(0.1),
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
