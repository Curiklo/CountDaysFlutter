import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';

class DateCalculator {
  //days for calculation
  var startDay = DateTime(2015, DateTime.october, 1);
  var qixi = DateTime(2016, DateTime.july, 7);
  var moleculelab = DateTime(2015, DateTime.october, 17);
  var birth = DateTime(2000, DateTime.january, 13);
  var today = DateTime.now();

  //time format function for app bar
  get appbarDateFormatted {
    initializeDateFormatting("en_us");
    var formatter = new DateFormat('MMMM d y E', "en_us");
    var formatted = formatter.format(today); // Date to String
    return formatted;
  }

  //cal time for anivarsary
  String aniversaryDateCalculator(int dayafter) {
    var aniversaryday = startDay.add(new Duration(days: dayafter));
    initializeDateFormatting("en_us");
    var formatter = new DateFormat('y MMMM d  E', "en_us");
    var formatted = formatter.format(aniversaryday); // Date to String
    //print(formatted);
    return formatted;
  }

  String dateformater(DateTime datetime){
      initializeDateFormatting("en_us");
      var formatter = new DateFormat('y MMMM d  E', "en_us");
      var formatted = formatter.format(datetime);
      return formatted;
  }

  //main calcu
  String nextAniversaryDateCalculator(){
    return "";
  }
}
