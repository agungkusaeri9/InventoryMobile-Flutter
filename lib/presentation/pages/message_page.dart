import 'package:flutter/material.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';
import 'package:flutter_simple_arch/presentation/widgets/message/conversation_item.dart';
import 'package:flutter_simple_arch/presentation/widgets/message/message_search_bar.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        title:
            const Text("Pesan", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const MessageSearchBar(),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              children: const [
                ConversationItem(
                  name: "Andi",
                  message: "Baik, saya akan segera proses pesanannya.",
                  time: "10:42",
                  isUnread: true,
                  imageUrl: "https://placehold.co/100x100/6C63FF/FFFFFF?text=A",
                ),
                ConversationItem(
                  name: "Bunga",
                  message: "Terima kasih atas informasinya!",
                  time: "10:35",
                  isUnread: false,
                  imageUrl: "https://placehold.co/100x100/2ED573/FFFFFF?text=B",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
