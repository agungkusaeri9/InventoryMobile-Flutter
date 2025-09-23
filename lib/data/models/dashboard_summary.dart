class DashboardSummary {
  final int productCount;
  final int stockInTotalQty;
  final int stockOutTotalQty;
  final int lowStockCount;

  DashboardSummary({
    required this.productCount,
    required this.stockInTotalQty,
    required this.stockOutTotalQty,
    required this.lowStockCount,
  });

  factory DashboardSummary.fromJson(Map<String, dynamic> json) {
    return DashboardSummary(
      productCount: json['productCount'] ?? 0,
      stockInTotalQty: json['stockInTotalQty'] ?? 0,
      stockOutTotalQty: json['stockOutTotalQty'] ?? 0,
      lowStockCount: json['lowStockCount'] ?? 0,
    );
  }

  @override
  String toString() {
    return "DashboardSummary(productCount: $productCount, stockInTotalQty: $stockInTotalQty, stockOutTotalQty: $stockOutTotalQty, lowStockCount: $lowStockCount)";
  }
}
