import 'package:flutter/material.dart';
import 'package:flutter_simple_arch/core/theme/app_color.dart';
import 'package:flutter_simple_arch/data/models/log_activity.dart';
import 'package:flutter_simple_arch/data/services/api_service.dart';
import 'package:flutter_simple_arch/data/services/log_activity_service.dart';
import 'package:flutter_simple_arch/presentation/widgets/dashboard/recent_activity_item.dart';
import 'package:flutter_simple_arch/core/utils/date_format.dart';

class RecentActivity extends StatefulWidget {
  const RecentActivity({super.key});

  @override
  State<RecentActivity> createState() => _RecentActivityState();
}

class _RecentActivityState extends State<RecentActivity> {
  final LogActivityService service = LogActivityService(ApiService());

  List<LogActivity>? logActivities;
  bool loading = true;
  String? error;

  Future<void> loadLogActivities() async {
    try {
      final result = await service.getLogActivity();
      if (!mounted) return;
      setState(() {
        logActivities = result;
        loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        error = e.toString();
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadLogActivities();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return Center(child: Text("Error: $error"));
    }

    if (logActivities == null || logActivities!.isEmpty) {
      return const Center(child: Text("Belum ada aktivitas"));
    }

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
      child: Column(
        children: logActivities!.map((log) {
          return RecentActivityItem(
            title: log.module,
            date: DateHelper.formatDateTime(log.date),
          );
        }).toList(),
      ),
    );
  }
}
