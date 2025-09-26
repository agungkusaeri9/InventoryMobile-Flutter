class StockChart {
  final DateTime label;
  final int stockIn;
  final int stockOut;

  StockChart({
    required this.label,
    required this.stockIn,
    required this.stockOut,
  });

  factory StockChart.fromJson(Map<String, dynamic> json) {
    return StockChart(
      label: DateTime.parse(json['label']), // disesuaikan
      stockIn: json['stockIn'] ?? 0,
      stockOut: json['stockOut'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "label": label.toIso8601String().split('T').first, // "2025-09-20"
      "stockIn": stockIn,
      "stockOut": stockOut,
    };
  }
}
