import 'package:flutter_simple_arch/data/models/log_activity.dart';
import 'package:flutter_simple_arch/data/services/api_service.dart';

class LogActivityService {
  final ApiService api;

  LogActivityService(this.api);

  Future<List<LogActivity>> getLogActivity() async {
    final response = await api.dio.get(
      "/logActivity",
      queryParameters: {"ByLogin": true},
    );

    if (response.statusCode == 200 && response.data['status'] == true) {
      final List<dynamic> data = response.data['data'];
      return data.map((e) => LogActivity.fromJson(e)).toList();
    } else {
      throw Exception(
        response.data['message'] ?? "Failed to load log activity",
      );
    }
  }
}
