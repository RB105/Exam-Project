import 'package:exam_project/model/post_model.dart';
import 'package:flutter/material.dart';

class PostInfoPage extends StatelessWidget {
  final PostModel data;
  const PostInfoPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${data.id}"),
      ),
    );
  }
}
