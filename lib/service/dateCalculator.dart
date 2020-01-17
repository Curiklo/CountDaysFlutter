import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';

class DateCalculator {
  //days for calculation
  var startDay = DateTime(2015, DateTime.october, 1);
  var today = DateTime.now();

  //time format function for app bar
  get appbarDateFormatted {
    initializeDateFormatting("en_us");
    var formatter = new DateFormat('MMMM d y E', "en_us");
    var formatted = formatter.format(today); // Date to String
    return formatted;
  }

  //cal time for anivarsary
  String aniversaryCalculator(int dayafter) {
    var aniversaryday = startDay.add(new Duration(days: dayafter));
    initializeDateFormatting("en_us");
    var formatter = new DateFormat('y MMMM d  E', "en_us");
    var formatted = formatter.format(aniversaryday); // Date to String
    return formatted;
  }
}
