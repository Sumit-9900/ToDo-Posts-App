import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_post_app/core/animation/slide_page_route.dart';
import 'package:todo_post_app/core/utils/show_dialog.dart';
import 'package:todo_post_app/core/utils/show_snackbar.dart';
import 'package:todo_post_app/core/presentation/widgets/loader.dart';
import 'package:todo_post_app/features/post/presentation/pages/post_page.dart';
import 'package:todo_post_app/features/todo/presentation/cubit/theme_cubit.dart';
import 'package:todo_post_app/features/todo/presentation/cubit/todo_cubit.dart';
import 'package:todo_post_app/features/todo/presentation/widgets/default_todo.dart';
import 'package:todo_post_app/features/todo/presentation/widgets/todo_card.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<TodoCubit>().onGetTodo();
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDarkMode) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ToDo'),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme();
              },
              icon: !isDarkMode
                  ? Icon(
                      Icons.dark_mode,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.light_mode,
                      color: Colors.amberAccent,
                    ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(SlidePageRoute(page: PostPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Row(
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(fontSize: 17),
                      ),
                      const SizedBox(width: 2),
                      Icon(Icons.arrow_forward_ios, size: 22),
                    ],
                  ),
                ),
              )
            ],
          ),
          body: BlocConsumer<TodoCubit, TodoState>(
            listener: (context, state) {
              if (state is TodoFailure) {
                showSnackbar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is TodoLoading) {
                return Loader();
              } else if (state is TodoSuccess) {
                return state.todos.isEmpty
                    ? DefaultTodo()
                    : ListView.builder(
                        itemCount: state.todos.length,
                        itemBuilder: (context, index) {
                          final todo = state.todos[index];
                          return TodoCard(todo: todo);
                        },
                      );
              }
              return const Center(
                child: Text('No Data'),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showPopup(context, taskController);
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
