import 'package:dartz/dartz.dart';
import 'package:todo_post_app/core/error/failure.dart';
import 'package:todo_post_app/core/usecase/usecase.dart';
import 'package:todo_post_app/features/todo/domain/entities/todo.dart';
import 'package:todo_post_app/features/todo/domain/repository/todo_repository.dart';

class AddTodo implements Usecase<void, Todo> {
  final TodoRepository todoRepository;
  const AddTodo(this.todoRepository);

  @override
  Future<Either<Failure, void>> call(Todo todo) async {
    return await todoRepository.addTodo(todo);
  }
}
