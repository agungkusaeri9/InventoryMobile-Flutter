import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';
import 'package:flutter_simple_arch/presentation/cubit/auth_cubit.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        String username = "Guest";
        String email = "";
        if (state is AuthSuccess) {
          username = state.user.username;
          email = username + "@gmail.com";
        }

        return Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: AppColors.primary.withOpacity(0.2),
              child:
                  const Icon(Icons.person, size: 40, color: AppColors.primary),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ],
        );
      },
    );
  }
}
