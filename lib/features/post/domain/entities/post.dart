import 'package:todo_post_app/features/post/data/models/post_model.dart';

class Post extends PostModel {
  Post({
    required super.userId,
    required super.id,
    required super.title,
    required super.body,
  });
}
