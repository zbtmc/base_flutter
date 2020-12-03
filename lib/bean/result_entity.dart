class ResultEntity {
  String code;
  String msg;
  var data;

  ResultEntity(this.code, this.msg, {this.data});

  @override
  String toString() {
    return 'ResultBean{data: $data, msg: $msg, code: $code}';
  }
}
