import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';

class DateCalculator {
  //get current time
  var today = DateTime.now();

  //time format function for app bar
  get sentDateFormatted {
    initializeDateFormatting("en_us");
    var formatter = new DateFormat('MMMM d y E', "en_us");
    var formatted = formatter.format(today); // Date to String
    return formatted;
  }
}
