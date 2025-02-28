import 'package:intl/intl.dart';

String formatTanggal(DateTime date) {
  final DateFormat formatter = DateFormat('dd MMMM yyyy', 'id_ID');
  return formatter.format(date);
}

String formatTanggalV2(DateTime date) {
  final DateFormat formatter = DateFormat('dd MMM yyyy', 'id_ID');
  return formatter.format(date);
}

String formatTanggalV3(DateTime date) {
  final DateFormat formatter =
      DateFormat('dd MMMM yyyy, hh:mm:ss WIB', 'id_ID');
  return formatter.format(date);
}

String formatTanggalV4(DateTime date) {
  final DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
  return formatter.format(date);
}

String formatTanggalV5(DateTime date) {
  final DateFormat formatter = DateFormat('EEEE, dd MMM yyyy', 'id_ID');
  return formatter.format(date);
}

String formatTanggalV6(DateTime date) {
  final DateFormat formatter = DateFormat('hh:mm:ss WIB', 'id_ID');
  return formatter.format(date);
}

String formatTanggalV7(DateTime date) {
  final DateFormat formatter = DateFormat('EEEE,', 'id_ID');
  return formatter.format(date);
}
