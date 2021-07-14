import 'package:intl/intl.dart';

class User {
  final int id;
  final String username;
  final String email;
  final DateTime created;
  final DateTime updated;

  User({
    this.id,
    this.username,
    this.email,
    this.created,
    this.updated,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id": 1} => Dart 오브젝트

  User.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        username = data['username'],
        email = data['email'],
        created = DateFormat('yyyy-mm-dd').parse(data['created']),
        updated = DateFormat('yyyy-mm-dd').parse(data['updated']);
}
