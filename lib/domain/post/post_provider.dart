import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

const host = 'http://10.0.2.2:8080';

class PostProvider extends GetConnect {
  // Promise (데이터 약속)
  Future<Response> fetch() => get(
        '$host/post',
        headers: {
          'Authorization': jwtToken ?? '',
        },
      );
}
