import 'dart:convert';

class Utf8Converter {
  static dynamic convert(dynamic body) {
    String responseBody = jsonEncode(body);
    dynamic convertBody = jsonDecode(utf8.decode(responseBody.codeUnits));
    return convertBody;
  }
}

dynamic convertUtf8ToObject(dynamic body) {
  String responseBody = jsonEncode(body);
  dynamic convertBody = jsonDecode(utf8.decode(responseBody.codeUnits));
  return convertBody;
}
