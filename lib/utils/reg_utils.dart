
class RegUtils{

  static bool checkPwd(String input){
    RegExp regExp = RegExp(r'^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$');
    return regExp.hasMatch(input);
  }

  static bool isPhone(String input) {
    RegExp mobile = new RegExp(r"1[0-9]\d{9}$");
    return mobile.hasMatch(input);
  }
}