import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_post_app/features/todo/domain/entities/todo.dart';
import 'package:todo_post_app/features/todo/presentation/cubit/todo_cubit.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  const TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: ListTile(
        leading: Checkbox(
          value: todo.isCompleted,
          activeColor: Colors.green,
          checkColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          onChanged: (value) {
            context.read<TodoCubit>().onUpdateTodoById(todo.id, value ?? false);
          },
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            context.read<TodoCubit>().onDeleteTodoById(todo.id);
          },
          icon: Icon(Icons.delete, color: Colors.red),
        ),
      ),
    );
  }
}
