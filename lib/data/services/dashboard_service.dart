import 'package:flutter_simple_arch/data/models/dashboard_summary.dart';
import 'package:flutter_simple_arch/data/models/stock_chart.dart';
import 'package:flutter_simple_arch/data/services/api_service.dart';

class DashboardService {
  final ApiService api;

  DashboardService(this.api);

  Future<DashboardSummary> getSummary() async {
    final response = await api.dio.get("/dashboard/summary");
    if (response.statusCode == 200 && response.data['status'] == true) {
      final data = response.data['data'];
      return DashboardSummary.fromJson(data);
    } else {
      throw Exception(response.data['message'] ?? "Failed to load summary");
    }
  }

  Future<List<StockChart>> getChart() async {
    final response =
        await api.dio.get("/dashboard/transactionStockInStockOutChart");
    if (response.statusCode == 200 && response.data['status'] == true) {
      final List<dynamic> data = response.data['data'];
      return data.map((e) => StockChart.fromJson(e)).toList();
    } else {
      throw Exception(response.data['message'] ?? "Failed to load chart");
    }
  }
}
