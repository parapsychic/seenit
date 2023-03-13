import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:seenit/controllers/post_controller.dart';
import 'package:seenit/widgets/textforminput.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final postController = Get.put(PostController());

  final _subredditController = TextEditingController(text: "aww");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => postController.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  // Row(
                  //   children: [
                  //     TextFormInput(
                  //       controller: _subredditController,
                  //       hintText: "Subreddit",
                  //     ),
                  //   ],
                  // ),
                  Expanded(
                    child: Obx(
                      () => ListView.separated(
                        itemBuilder: (context, index) => Card(
                            elevation: 10,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Text(postController.posts[index].title),
                                ),
                                Image.network(
                                  postController.posts[index].url,
                                )
                              ],
                            )),
                        itemCount: postController.posts.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
    );
  }
}
