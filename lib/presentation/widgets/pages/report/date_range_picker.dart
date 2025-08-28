import 'package:flutter/material.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';
import 'package:flutter_simple_arch/presentation/pages/message_page.dart';

class DateRangePicker extends StatelessWidget {
  const DateRangePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          )
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.calendar_today_outlined,
              color: AppColors.textSecondary, size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "01 Agu - 28 Agu 2025",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.textPrimary),
            ),
          ),
          Icon(Icons.keyboard_arrow_down_rounded,
              color: AppColors.textSecondary),
        ],
      ),
    );
  }
}
