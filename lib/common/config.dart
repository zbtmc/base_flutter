

class Config{
  ///判断是否是开发模式
  static bool isDebug(){
    return !bool.fromEnvironment("dart.vm.product");
  }

}