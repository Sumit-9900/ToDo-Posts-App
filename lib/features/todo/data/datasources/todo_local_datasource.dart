import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_post_app/core/const/const.dart';
import 'package:todo_post_app/core/error/exception.dart';
import 'package:todo_post_app/features/todo/data/models/todo_model.dart';

abstract interface class TodoLocalDatasource {
  Future<void> addTodo(TodoModel todo);
  List<TodoModel> getTodos();
  Future<bool> updateTodoById(String id, bool isCompleted);
  bool deleteTodoById(String id);
  Future<void> saveTheme(bool isDarkMode);
  bool getTheme();
}

class TodoLocalDatasourceImpl implements TodoLocalDatasource {
  final SharedPreferences sharedPreferences;

  TodoLocalDatasourceImpl({required this.sharedPreferences});

  @override
  Future<void> addTodo(TodoModel todo) async {
    try {
      final todoList = sharedPreferences.getStringList(Const.prefsKey) ?? [];
      todoList.add(todo.toJson());
      await sharedPreferences.setStringList(Const.prefsKey, todoList);
    } catch (e) {
      throw LocalException(e.toString());
    }
  }

  @override
  List<TodoModel> getTodos() {
    final todoList = sharedPreferences.getStringList(Const.prefsKey) ?? [];
    final todos = todoList.map((todo) => TodoModel.fromJson(todo)).toList();
    return todos;
  }

  @override
  Future<bool> updateTodoById(String id, bool isCompleted) async {
    try {
      final todoList = sharedPreferences.getStringList(Const.prefsKey) ?? [];
      final updatedTodoList = todoList.map((todoString) {
        final todo = TodoModel.fromJson(todoString);
        if (todo.id == id) {
          return todo.copyWith(isCompleted: isCompleted).toJson();
        }
        return todoString;
      }).toList();

      return await sharedPreferences.setStringList(
          Const.prefsKey, updatedTodoList);
    } catch (e) {
      return throw LocalException(e.toString());
    }
  }

  @override
  bool deleteTodoById(String id) {
    final todoList = sharedPreferences.getStringList(Const.prefsKey) ?? [];
    final todo =
        todoList.firstWhere((element) => TodoModel.fromJson(element).id == id);
    final isDeleted = todoList.remove(todo);
    if (isDeleted) {
      sharedPreferences.setStringList(Const.prefsKey, todoList);
    }
    return isDeleted;
  }

  @override
  bool getTheme() {
    return sharedPreferences.getBool(Const.themeKey) ?? false;
  }

  @override
  Future<void> saveTheme(bool isDarkMode) async {
    try {
      await sharedPreferences.setBool(Const.themeKey, isDarkMode);
    } catch (e) {
      throw LocalException(e.toString());
    }
  }
}
