const List<String> weekDays = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday"
];
const List<String> months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

class ConvertTimestampService {
  String getHourFromTimeStamp(timeStamp) {
    DateTime date = timeStamp.toDate();
    int hour = date.hour;
    int minute = date.minute;
    return minute > 10 ? "$hour:$minute" : "$hour:${minute}0";
  }

  String getDateFromTimeStamp(timeStamp) {
    DateTime date = timeStamp.toDate();
    int weekDay = date.weekday;
    int day = date.day;
    int month = date.month;
    int year = date.year;
    return "${weekDays[weekDay - 1]} ${months[month - 1]} $day $year";
  }

  String getDayandMonthFromTimeStamp(timeStamp) {
    DateTime date = timeStamp.toDate();
    int day = date.day;
    int month = date.month;
    return "${months[month - 1]} $day";
  }

  String getMonthFromNumber(month) {
    return months[month - 1];
  }
}
