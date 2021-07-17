import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  Future<void> updateById(int id, String title, String content) async {
    Post post = await _postRepository.updateById(id, title, content);
    if (post.id != null) {
      this.post.value = post;
      this.posts.value = this.posts.value.map((e) => e.id == id ? post : e).toList();
    }
  }

  Future<void> deleteById(int id) async {
    int result = await _postRepository.deleteById(id);

    if (result == 1) {
      print('서버 쪽 삭제 성공');
      List<Post> result = posts.value.where((post) => post.id != id).toList();
      // print(result.length);
      posts.value = result;
    }
  }

  Future<void> fetch() async {
    var posts = await _postRepository.fetch();
    this.posts.value = posts;
  }

  Future<Post> findById(int id) async {
    var post = await _postRepository.findById(id);
    this.post.value = post;
  }
}
