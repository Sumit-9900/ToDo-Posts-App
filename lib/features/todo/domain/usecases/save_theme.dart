import 'package:dartz/dartz.dart';
import 'package:todo_post_app/core/error/failure.dart';
import 'package:todo_post_app/core/usecase/usecase.dart';
import 'package:todo_post_app/features/todo/domain/repository/todo_repository.dart';

class SaveTheme implements Usecase<void, bool> {
  final TodoRepository todoRepository;
  const SaveTheme(this.todoRepository);

  @override
  Future<Either<Failure, void>> call(bool isDarkMode) async {
    return await todoRepository.saveTheme(isDarkMode);
  }
}
