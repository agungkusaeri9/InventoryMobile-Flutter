class LogActivity {
  final int id;
  final String username;
  final String module;
  final String action;
  final String description;
  final DateTime date;

  LogActivity({
    required this.id,
    required this.username,
    required this.module,
    required this.action,
    required this.description,
    required this.date,
  });

  factory LogActivity.fromJson(Map<String, dynamic> json) {
    return LogActivity(
      id: json['id'] ?? 0,
      username: json['username'] ?? "",
      module: json['module'] ?? "",
      action: json['action'] ?? "",
      description: json['description'] ?? "",
      date: DateTime.parse(json['createdAt']),
    );
  }
}
