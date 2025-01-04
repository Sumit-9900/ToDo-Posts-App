import 'package:flutter/material.dart';
import 'package:todo_post_app/core/const/const.dart';

class DefaultTodo extends StatelessWidget {
  const DefaultTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 200,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Const.todoImage, height: 300, fit: BoxFit.cover),
          Text(
            'What do you want to do today?',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            'Tap + to add your tasks',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
