import 'package:intl/intl.dart';

class DateHelper {
  /// Format: 27 Agu 2025
  static String formatDateShort(DateTime date) {
    return DateFormat("dd MMM yyyy", "id_ID").format(date);
  }

  /// Format: 27/08/2025
  static String formatDateSlash(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }

  /// Format: 27 Agu 2025, 14:30
  static String formatDateTime(DateTime? date) {
    if (date == null) return "";
    return DateFormat("dd MMM yyyy, HH:mm", "id_ID").format(date);
  }

  /// Format relative: "2 jam lalu", "kemarin", dll
  static String formatRelative(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inSeconds < 60) {
      return "Baru saja";
    } else if (diff.inMinutes < 60) {
      return "${diff.inMinutes} menit lalu";
    } else if (diff.inHours < 24) {
      return "${diff.inHours} jam lalu";
    } else if (diff.inDays == 1) {
      return "Kemarin";
    } else if (diff.inDays < 7) {
      return "${diff.inDays} hari lalu";
    } else {
      return DateFormat("dd MMM yyyy", "id_ID").format(date);
    }
  }
}
