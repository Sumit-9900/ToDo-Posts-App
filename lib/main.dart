import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_post_app/core/presentation/pages/splash_page.dart';
import 'package:todo_post_app/core/theme/app_theme.dart';
import 'package:todo_post_app/features/post/presentation/bloc/post_bloc.dart';
import 'package:todo_post_app/features/todo/presentation/cubit/theme_cubit.dart';
import 'package:todo_post_app/features/todo/presentation/cubit/todo_cubit.dart';
import 'package:todo_post_app/init_dependencies.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<TodoCubit>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<PostBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<ThemeCubit>()..loadTheme(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDarkMode) {
        return MaterialApp(
          title: 'ToDo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightThemeMode,
          darkTheme: AppTheme.darkThemeMode,
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const SplashPage(),
        );
      },
    );
  }
}
