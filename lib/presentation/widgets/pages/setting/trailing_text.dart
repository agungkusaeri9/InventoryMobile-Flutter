import 'package:flutter/material.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';

class TrailingText extends StatelessWidget {
  final String text;
  const TrailingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text, style: const TextStyle(color: AppColors.textSecondary)),
        const SizedBox(width: 8),
        const Icon(Icons.chevron_right, color: AppColors.textSecondary),
      ],
    );
  }
}
