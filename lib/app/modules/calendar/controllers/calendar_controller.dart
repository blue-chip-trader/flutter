import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarController extends GetxController {
  //TODO: Implement CalendarController
  getTime(datestamp) {
  String time = DateFormat.Hm().format(datestamp.toDate());
  return time;
}

getDate(datestamp) {
  String date = DateFormat.yMMMEd().format(datestamp.toDate());
  return date;
}

getWeekday(datestamp){
String date = DateFormat.E().add_Hm().format(datestamp.toDate());
  return date;
}

stampToDate(datestamp) {
  return datestamp.toDate();
}
  final count = 0.obs;

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
