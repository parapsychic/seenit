import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../core/constants.dart';
import '../models/Failures/service_failure.dart';
import '../models/Posts/post.dart';

class RESTServices {
  static var dio = Dio();

  static Future<Either<ServiceFailure, List<Post>>> getPosts(
      {required String subreddit, int count = 5}) async {
    String url = "$API_URL$subreddit/hot.json";

    try {
      List<Post> _posts = [];

      // TODO check for images
      //final query = {"limit": count};
      final response = await dio.get(
        url, /* queryParameters: query*/
      );
      final allPosts = response.data["data"]["children"];

      for (var post in allPosts) {
        if (post["data"]["post_hint"] == "image")
          _posts.add(Post.fromJson(post["data"]));
        if (_posts.length > count) break;
      }
      return Right(_posts);
    } catch (e) {
      print(e);
      return const Left(ServiceFailure.APIFailure);
    }
  }
}
