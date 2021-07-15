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

  Future<void> fetch() async {
    var posts = await _postRepository.fetch();
    this.posts.value = posts;
  }

  Future<Post> findById(int id) async {
    var post = await _postRepository.findById(id);
    this.post.value = post;
  }
}
