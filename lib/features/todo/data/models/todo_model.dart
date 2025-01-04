import 'dart:convert';

import 'package:todo_post_app/features/todo/domain/entities/todo.dart';

class TodoModel {
  final String id;
  final String title;
  final bool isCompleted;

  TodoModel({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] as String,
      title: map['title'] as String,
      isCompleted: map['isCompleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Todo toDomain() {
    return Todo(id: id, title: title, isCompleted: isCompleted);
  }

  TodoModel copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() =>
      'TodoModel(id: $id, title: $title, isCompleted: $isCompleted)';
}
