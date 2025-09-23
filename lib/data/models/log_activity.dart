class LogActivity {
  final String username;
  final String modul;
  final String action;
  final String description;
  final DateTime date;

  LogActivity({
    required this.username,
    required this.modul,
    required this.action,
    required this.description,
    required this.date,
  });

  factory LogActivity.fromJson(Map<String, dynamic> json) {
    return LogActivity(
      username: json['username'] ?? "",
      modul: json['modul'] ?? "",
      action: json['action'] ?? "",
      description: json['description'] ?? "",
      date: DateTime.parse(json['date'] ?? ""),
    );
  }

//   @override
//   String toString() {
//     return "LogActivity(productCount: $productCount, stockInTotalQty: $stockInTotalQty, stockOutTotalQty: $stockOutTotalQty, lowStockCount: $lowStockCount)";
//   }
}
