import 'package:todo_post_app/features/todo/data/models/todo_model.dart';

class Todo extends TodoModel {
  Todo({
    required super.id,
    required super.title,
    required super.isCompleted,
  });
}
