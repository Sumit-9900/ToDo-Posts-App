import 'package:todo_post_app/core/usecase/usecase.dart';
import 'package:todo_post_app/features/todo/domain/entities/todo.dart';
import 'package:todo_post_app/features/todo/domain/repository/todo_repository.dart';

class GetTodos implements UsecaseWithSuccessType<List<Todo>, NoParams> {
  final TodoRepository todoRepository;
  const GetTodos(this.todoRepository);
  
  @override
  List<Todo> call(NoParams params) {
    return todoRepository.getTodos();
  }
}
