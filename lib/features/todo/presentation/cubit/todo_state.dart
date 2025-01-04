part of 'todo_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {
  final List<Todo> todos;
  TodoInitial(this.todos);
}

final class TodoLoading extends TodoState {}

final class TodoFailure extends TodoState {
  final String message;
  TodoFailure([this.message = Const.errorMessage]);
}

final class TodoSuccess extends TodoState {
  final List<Todo> todos;
  TodoSuccess(this.todos);
}
