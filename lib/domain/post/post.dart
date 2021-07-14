import 'package:flutter_blog/domain/user/user.dart';
import 'package:intl/intl.dart';

class Post {
  final int id;
  final String title;
  final String content;
  final User user;
  final DateTime created;
  final DateTime updated;

  Post({
    this.id,
    this.title,
    this.content,
    this.user,
    this.created,
    this.updated,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id": 1} => Dart 오브젝트

  Post.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        title = data['title'],
        content = data['content'],
        user = User.fromJson(data['user']),
        created = DateFormat('yyyy-mm-dd').parse(data['created']),
        updated = DateFormat('yyyy-mm-dd').parse(data['updated']);
}
