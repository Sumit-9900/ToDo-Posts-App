import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_post_app/core/const/const.dart';
import 'package:todo_post_app/features/todo/domain/entities/todo.dart';
import 'package:todo_post_app/features/todo/presentation/cubit/todo_cubit.dart';
import 'package:uuid/uuid.dart';

void showPopup(BuildContext context, TextEditingController controller) {
  final formKey = GlobalKey<FormState>();
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Task',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: formKey,
                    child: TextFormField(
                      controller: controller,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Please enter your task!!!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Task...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              context.read<TodoCubit>().onAddTodo(
                                    Todo(
                                      id: const Uuid().v4(),
                                      title: controller.text.trim(),
                                      isCompleted: false,
                                    ),
                                  );
                              controller.clear();
                              Navigator.pop(context);
                            }
                          },
                          child: Image.asset(Const.sendIcon),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
