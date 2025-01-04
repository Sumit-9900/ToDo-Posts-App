import 'package:dartz/dartz.dart';
import 'package:todo_post_app/core/error/exception.dart';
import 'package:todo_post_app/core/error/failure.dart';
import 'package:todo_post_app/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:todo_post_app/features/todo/domain/entities/todo.dart';
import 'package:todo_post_app/features/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDatasource todoLocalDatasource;
  TodoRepositoryImpl(this.todoLocalDatasource);

  @override
  Future<Either<Failure, void>> addTodo(Todo todo) async {
    try {
      await todoLocalDatasource.addTodo(todo);
      return right(null);
    } on LocalException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  List<Todo> getTodos() {
    final todos = todoLocalDatasource.getTodos();
    return todos.map((todo) => todo.toDomain()).toList();
  }

  @override
  Future<Either<Failure, bool>> updateTodoById(
      String id, bool isCompleted) async {
    try {
      final isUpdated =
          await todoLocalDatasource.updateTodoById(id, isCompleted);
      return right(isUpdated);
    } on LocalException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  bool deleteTodoById(String id) {
    return todoLocalDatasource.deleteTodoById(id);
  }

  @override
  bool getTheme() {
    return todoLocalDatasource.getTheme();
  }

  @override
  Future<Either<Failure, void>> saveTheme(bool isDarkMode) async {
    try {
      await todoLocalDatasource.saveTheme(isDarkMode);
      return right(null);
    } on LocalException catch (e) {
      return left(Failure(e.message));
    }
  }
}
