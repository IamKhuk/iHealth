class Utils {
  static String percentageFormat(double number){
    List list = number.toString().split('.').toList();
    List listTwo = list[1].toString().split('').toList();
    return list[0]+'.'+listTwo[0];
  }
}