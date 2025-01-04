import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_post_app/features/post/data/datasources/post_remote_datasource.dart';
import 'package:todo_post_app/features/post/data/repository/post_repository_impl.dart';
import 'package:todo_post_app/features/post/domain/repository/post_repository.dart';
import 'package:todo_post_app/features/post/domain/usecases/get_all_posts.dart';
import 'package:todo_post_app/features/post/domain/usecases/get_searched_posts.dart';
import 'package:todo_post_app/features/post/presentation/bloc/post_bloc.dart';
import 'package:todo_post_app/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:todo_post_app/features/todo/data/repository/todo_repository_impl.dart';
import 'package:todo_post_app/features/todo/domain/repository/todo_repository.dart';
import 'package:todo_post_app/features/todo/domain/usecases/add_todo.dart';
import 'package:todo_post_app/features/todo/domain/usecases/delete_todo.dart';
import 'package:todo_post_app/features/todo/domain/usecases/get_theme.dart';
import 'package:todo_post_app/features/todo/domain/usecases/get_todos.dart';
import 'package:todo_post_app/features/todo/domain/usecases/save_theme.dart';
import 'package:todo_post_app/features/todo/domain/usecases/update_todo.dart';
import 'package:todo_post_app/features/todo/presentation/cubit/theme_cubit.dart';
import 'package:todo_post_app/features/todo/presentation/cubit/todo_cubit.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final prefs = await SharedPreferences.getInstance();

  serviceLocator.registerLazySingleton(() => prefs);
  serviceLocator.registerLazySingleton(() => http.Client());

  serviceLocator.registerFactory<TodoLocalDatasource>(
    () => TodoLocalDatasourceImpl(
      sharedPreferences: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<PostRemoteDatasource>(
    () => PostRemoteDatasourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<TodoRepository>(
    () => TodoRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<PostRepository>(
    () => PostRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => AddTodo(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GetTodos(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GetAllPosts(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GetSearchedPosts(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => SaveTheme(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GetTheme(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UpdateTodo(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => DeleteTodo(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => TodoCubit(
      addTodo: serviceLocator(),
      getTodos: serviceLocator(),
      updateTodo: serviceLocator(),
      deleteTodo: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => PostBloc(
      getAllPosts: serviceLocator(),
      getSearchedPosts: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => ThemeCubit(
      saveTheme: serviceLocator(),
      getTheme: serviceLocator(),
    ),
  );
}
