class CMResDto {
  final int code;
  final String msg;
  final dynamic data;

  CMResDto({
    this.code,
    this.msg,
    this.data,
  });

  CMResDto.fromJson(Map<String, dynamic> data)
      : code = data['code'],
        msg = data['msg'],
        data = data['data'];
}
