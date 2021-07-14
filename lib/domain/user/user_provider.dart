import 'package:get/get.dart';

const host = 'http://10.0.2.2:8080';

class UserProvider extends GetConnect {
  // Promise (데이터 약속)
  Future<Response> login(Map data) => post('$host/login', data);
}
