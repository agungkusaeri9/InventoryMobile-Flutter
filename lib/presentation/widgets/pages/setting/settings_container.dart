import 'package:flutter/material.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';

class SettingsContainer extends StatelessWidget {
  final List<Widget> children;
  const SettingsContainer({super.key, required this.children});

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
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}
