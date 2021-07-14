import 'package:flutter_blog/controller/dto/login_req_dto.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<String> login(String username, String password) async {
    var loginReqDto = LoginReqDto(username, password);
    var response = await _userProvider.login(loginReqDto.toJson());
    var headers = response.headers;
    String token = headers['authorization'];
    return token;
  }
}
