import 'package:todo_post_app/core/usecase/usecase.dart';
import 'package:todo_post_app/features/todo/domain/repository/todo_repository.dart';

class DeleteTodo implements UsecaseWithSuccessType<bool, String> {
  final TodoRepository repository;
  const DeleteTodo(this.repository);

  @override
  bool call(String id) {
    return repository.deleteTodoById(id);
  }
}
