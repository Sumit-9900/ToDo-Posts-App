import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_post_app/features/post/presentation/bloc/post_bloc.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onChanged;
  const SearchField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Search by userId...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: controller.text.trim().isNotEmpty
              ? IconButton(
                  onPressed: () {
                    controller.clear();
                    context.read<PostBloc>().add(PostAllPosts());
                  },
                  icon: Icon(Icons.clear),
                )
              : null,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
