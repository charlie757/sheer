import 'package:intl/intl.dart';
class DateHelper{
    static String convertInDate(String date) {
    var dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS");
    var utcDate = dateFormat.format(DateTime.parse(date));

    DateTime dateTime = dateFormat.parse(utcDate, true).toLocal();

    return DateFormat('yyy-MM-dd').format(dateTime);
  }

}