import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/dashboard/dashboard_section_title.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/setting/logout_button.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/setting/profile_section.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/setting/setting_item.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/setting/settings_container.dart';
import 'package:flutter_simple_arch/presentation/widgets/pages/setting/trailing_text.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _isDarkMode = false;
  bool _areNotificationsOn = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.background,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        title: const Text("Pengaturan",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileSection(),
            const SizedBox(height: 30),
            const SectionTitle(title: "Akun"),
            const SizedBox(height: 10),
            SettingsContainer(children: [
              SettingItem(
                  icon: Icons.person_outline,
                  title: "Edit Profil",
                  onTap: () {}),
              SettingItem(
                  icon: Icons.lock_outline,
                  title: "Ubah Kata Sandi",
                  onTap: () {}),
              SettingItem(
                icon: Icons.language_outlined,
                title: "Bahasa",
                trailing: const TrailingText(text: "Indonesia"),
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 30),
            const SectionTitle(title: "Preferensi"),
            const SizedBox(height: 10),
            SettingsContainer(children: [
              SwitchListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                secondary: const Icon(Icons.notifications_none_rounded,
                    color: AppColors.textPrimary),
                title: const Text("Notifikasi",
                    style: TextStyle(color: AppColors.textPrimary)),
                value: _areNotificationsOn,
                onChanged: (value) =>
                    setState(() => _areNotificationsOn = value),
                activeColor: AppColors.primary,
              ),
              SwitchListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                secondary: const Icon(Icons.dark_mode_outlined,
                    color: AppColors.textPrimary),
                title: const Text("Mode Gelap",
                    style: TextStyle(color: AppColors.textPrimary)),
                value: _isDarkMode,
                onChanged: (value) => setState(() => _isDarkMode = value),
                activeColor: AppColors.primary,
              ),
            ]),
            const SizedBox(height: 30),
            const SectionTitle(title: "Lainnya"),
            const SizedBox(height: 10),
            SettingsContainer(children: [
              SettingItem(
                  icon: Icons.privacy_tip_outlined,
                  title: "Kebijakan Privasi",
                  onTap: () {}),
              SettingItem(
                  icon: Icons.description_outlined,
                  title: "Syarat & Ketentuan",
                  onTap: () {}),
              SettingItem(
                  icon: Icons.help_outline,
                  title: "Pusat Bantuan",
                  onTap: () {}),
            ]),
            const SizedBox(height: 30),
            const LogoutButton(),
          ],
        ),
      ),
    );
  }
}
