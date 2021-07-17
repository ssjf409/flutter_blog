import 'package:flutter_blog/controller/dto/cm_res_dto.dart';
import 'package:flutter_blog/controller/dto/login_req_dto.dart';
import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:flutter_blog/util/utf8_converter.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<User> login(String username, String password) async {
    var loginReqDto = LoginReqDto(username, password);
    var response = await _userProvider.login(loginReqDto.toJson());
    var headers = response.headers;
    var body = response.body;

    var convertBody = Utf8Converter.convert(body);
    CMResDto cmResDto = CMResDto.fromJson(convertBody);

    if (cmResDto.code == 1) {
      User principal = User.fromJson(cmResDto.data);

      String token = headers['authorization'];

      jwtToken = token;
      print('jwtToken : $jwtToken');

      return principal;
    } else {
      return User();
    }

    // print('사용자 정보 : $body');

    // if (headers['authorization'] == null) {
    //   return '-1';
    // }
    //
    // String token = headers['authorization'];
    // return token;
  }
}
