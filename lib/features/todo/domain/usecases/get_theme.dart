import 'package:todo_post_app/core/usecase/usecase.dart';
import 'package:todo_post_app/features/todo/domain/repository/todo_repository.dart';

class GetTheme implements UsecaseWithSuccessType<bool, NoParams> {
  final TodoRepository todoRepository;
  GetTheme(this.todoRepository);

  @override
  bool call(NoParams params) {
    return todoRepository.getTheme();
  }
}
