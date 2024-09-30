import 'package:intl/intl.dart';


// ignore: avoid_classes_with_only_static_members
///Helper date
class DateHelper {
  
  
  ///Transform date
  static String formatDate(DateTime date) {
    Intl.defaultLocale = 'es';
    return  DateFormat('EEEE d MMMM yyyy', 'es').format(date);
   
  }
}