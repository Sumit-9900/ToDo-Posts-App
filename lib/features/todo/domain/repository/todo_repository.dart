import 'package:dartz/dartz.dart';
import 'package:todo_post_app/core/error/failure.dart';
import 'package:todo_post_app/features/todo/domain/entities/todo.dart';

abstract interface class TodoRepository {
  Future<Either<Failure, void>> addTodo(Todo todo);
  List<Todo> getTodos();
  Future<Either<Failure, bool>> updateTodoById(String id, bool isCompleted);
  bool deleteTodoById(String id);
  Future<Either<Failure, void>> saveTheme(bool isDarkMode);
  bool getTheme();
}