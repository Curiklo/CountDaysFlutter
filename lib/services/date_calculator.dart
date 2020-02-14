import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';

class DateCalculator {
  //days for calculation
  var startday = DateTime(2015, DateTime.october, 1);
  var qixi = DateTime(2016, DateTime.july, 7);
  var moleculelab = DateTime(2015, DateTime.october, 17);
  var birth = DateTime(2000, DateTime.january, 13);
  var today = DateTime.now();

  //time format function for app bar
  get appbarDateFormatted {
    initializeDateFormatting("en_us");
    var formatter = DateFormat.yMMMMEEEEd();
    var formatted = formatter.format(today); // Date to String
    return formatted;
  }

  //cal time for anivarsary
  String aniversaryDateCalculator(int dayafter) {
    var aniversaryday = startday.add(new Duration(days: dayafter));
    initializeDateFormatting("en_us");
    var formatter = DateFormat.yMMMEd();
    var formatted = formatter.format(aniversaryday); // Date to String
    //print(formatted);
    return formatted;
  }

  //calculate display formatter
  String dateformater(DateTime datetime) {
    initializeDateFormatting("en_us");
    var formatter = DateFormat.yMMMMEEEEd();
    var formatted = formatter.format(datetime);
    return formatted;
  }

  //calculate display year
  int dateYear(DateTime today) {
    if (9 < today.month) {
      return today.year - 2015;
    } else {
      return today.year - 2015 - 1;
    }
  }

  //calculate display month
  int dateMonth(DateTime today) {
    if (9 < today.month) {
      return 12 * dateYear(today) + today.month;
    } else {
      return 12 * dateYear(today) + today.month - 10;
    }
  }

  //calculate graph year
  double graphyear() {
    var thisyearstartday = DateTime(today.year, 10, 1);
    int graphyear;
    if (today.month == 10 || today.day == 1) {
      return 100.0;
    } else if (9 < today.month) {
      graphyear = today.difference(thisyearstartday).inDays;

      if (today.year % 4 == 0) {
        return graphyear / 366 * 100;
      } else {
        return graphyear / 365 * 100;
      }
    } else {
      graphyear = today.difference(DateTime(today.year, 1, 1)).inDays;
      if (today.year % 4 == 0) {
        return (graphyear + 92) / 366 * 100;
      } else {
        return (graphyear + 92) / 365 * 100;
      }
    }
  }

  //calculate graph month
  double graphmonth() {
    if (today.month == 1 ||
        today.month == 3 ||
        today.month == 5 ||
        today.month == 7 ||
        today.month == 8 ||
        today.month == 10 ||
        today.month == 12) {
      return today.day / 31 * 100;
    } else if (today.month == 2 && today.year % 4 == 0) {
      return today.day / 29 * 100;
    } else if (today.month == 2 && today.year % 4 != 0) {
      return today.month / 28 * 100;
    } else {
      //when today.month == 4,6,9,11
      return today.day / 30 * 100;
    }
  }

  //calculate graph week
  double graphweek() {
    if (today.weekday <= 4) {
      return ((today.weekday + 3) / 7) * 100;
    } else {
      //today.weekday<=7&&4<today.weekday
      return ((today.weekday - 4) / 7) * 100;
    }
  }

  //calculate graph 100
  double graphday100() {
    if (today.difference(startday).inDays % 100 == 0) {
      return 100.0;
    } else {
      return today.difference(startday).inDays % 100.0;
    }
  }

  //calculate graph 100
  double graphday1000() {
    if (today.difference(startday).inDays % 1000 == 0) {
      return 100.0;
    } else {
      return (today.difference(startday).inDays % 1000.0) / 10.0;
    }
  }

  //main calculator
  String nextAniversaryDateCalculator() {
    return "";
  }
}
