import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:seenit/services/rest_services.dart';

import '../models/Posts/post.dart';

class PostController extends GetxController {
  var subreddit = "aww".obs;
  var count = 5.obs;
  var loading = true.obs;
  var posts = [].obs;

  @override
  void onInit() {
    fetchApi();
    super.onInit();
  }

  fetchApi() async {
    loading.value = true;
    await RESTServices.getPosts(subreddit: subreddit.value, count: count.value)
        .fold((left) {
      Get.snackbar("Getting Posts Failed", "ERROR: ${left.name}");
    }, (right) {
      posts.value = right;
    });
    loading.value = false;
  }
}
