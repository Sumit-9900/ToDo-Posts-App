import 'package:dartz/dartz.dart';
import 'package:todo_post_app/core/error/failure.dart';
import 'package:todo_post_app/core/usecase/usecase.dart';
import 'package:todo_post_app/features/todo/domain/repository/todo_repository.dart';

class UpdateTodo implements Usecase<bool, UpdateTodoParams> {
  final TodoRepository todoRepository;
  const UpdateTodo(this.todoRepository);

  @override
  Future<Either<Failure, bool>> call(UpdateTodoParams params) async {
    return await todoRepository.updateTodoById(params.id, params.isCompleted);
  }
}

class UpdateTodoParams {
  final String id;
  final bool isCompleted;
  UpdateTodoParams(this.id, this.isCompleted);
}
