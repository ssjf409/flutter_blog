import 'package:flutter_blog/controller/dto/cm_res_dto.dart';
import 'package:flutter_blog/controller/dto/update_req_dto.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:get/get.dart';

class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<Post> updateById(int id, String title, String content) async {
    UpdateReqDto updateReqDto = UpdateReqDto(title, content);
    Response response = await _postProvider.updateById(id, updateReqDto.toJson());
    dynamic body = response.body;
    dynamic convertBody = Utf8Converter.convert(body);
    CMResDto cmResDto = CMResDto.fromJson(convertBody);

    if (cmResDto.code == 1) {
      print('수정 성공');
      Post post = Post.fromJson(cmResDto.data);
      return post;
    } else {
      print('수정 실패');
      return Post();
    }
  }

  Future<int> deleteById(int id) async {
    var response = await _postProvider.deleteById(id);
    dynamic body = response.body;
    dynamic convertBody = Utf8Converter.convert(body);
    CMResDto cmResDto = CMResDto.fromJson(convertBody);

    return cmResDto.code;
  }

  Future<Post> findById(int id) async {
    var response = await _postProvider.findById(id);
    dynamic body = response.body;
    var convertBody = Utf8Converter.convert(body);
    CMResDto cmResDto = CMResDto.fromJson(convertBody);

    if (cmResDto.code == 1) {
      Post post = Post.fromJson(cmResDto.data);
      return post;
    } else {
      return Post();
    }
  }

  Future<List<Post>> fetch() async {
    var response = await _postProvider.fetch();
    dynamic body = response.body;
    dynamic convertBody = Utf8Converter.convert(body);
    CMResDto cmResDto = CMResDto.fromJson(convertBody);
    print(cmResDto.code);
    print(cmResDto.msg);
    print(cmResDto.data);

    if (cmResDto.code == 1) {
      List<dynamic> temp = cmResDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {}
    return <Post>[];
  }
}
