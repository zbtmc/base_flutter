
class DateUtils{

  static int countBetweenDays(DateTime startTime,DateTime endTime){
    return endTime.difference(startTime).inDays;
  }
}