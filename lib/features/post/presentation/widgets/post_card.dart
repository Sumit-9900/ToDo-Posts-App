import 'package:flutter/material.dart';
import 'package:todo_post_app/core/theme/app_pallete.dart';
import 'package:todo_post_app/features/post/domain/entities/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: DarkAppPalette.circleAvatarBackgroundColor,
          radius: 20,
          child: Text(post.userId.toString()),
        ),
        title: Text(post.title),
        subtitle: Text(
          post.body,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
