import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_post_app/core/const/const.dart';
import 'package:todo_post_app/core/usecase/usecase.dart';
import 'package:todo_post_app/features/todo/domain/entities/todo.dart';
import 'package:todo_post_app/features/todo/domain/usecases/add_todo.dart';
import 'package:todo_post_app/features/todo/domain/usecases/delete_todo.dart';
import 'package:todo_post_app/features/todo/domain/usecases/get_todos.dart';
import 'package:todo_post_app/features/todo/domain/usecases/update_todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final AddTodo _addTodo;
  final GetTodos _getTodos;
  final UpdateTodo _updateTodo;
  final DeleteTodo _deleteTodo;
  TodoCubit({
    required AddTodo addTodo,
    required GetTodos getTodos,
    required UpdateTodo updateTodo,
    required DeleteTodo deleteTodo,
  })  : _addTodo = addTodo,
        _getTodos = getTodos,
        _updateTodo = updateTodo,
        _deleteTodo = deleteTodo,
        super(TodoInitial([]));

  void onTodoLoading() => emit(TodoLoading());

  void onAddTodo(Todo todo) async {
    onTodoLoading();
    final res = await _addTodo(todo);
    res.fold((l) => emit(TodoFailure(l.message)), (r) => onGetTodo());
  }

  void onGetTodo() {
    onTodoLoading();
    final todos = _getTodos(NoParams());
    emit(TodoSuccess(todos));
  }

  void onUpdateTodoById(String id, bool isCompleted) async {
    final res = await _updateTodo(UpdateTodoParams(id, isCompleted));
    res.fold(
      (l) => emit(TodoFailure(l.message)),
      (isUpdated) {
        if (isUpdated) {
          final updatedTodos = _getTodos(NoParams());
          emit(TodoSuccess(updatedTodos));
        }
      },
    );
  }

  void onDeleteTodoById(String id) {
    final isDeleted = _deleteTodo(id);
    if (isDeleted) {
      final updatedTodos = _getTodos(NoParams());
      emit(TodoSuccess(updatedTodos));
    } else {
      emit(TodoFailure(Const.errorMessage));
    }
  }
}
