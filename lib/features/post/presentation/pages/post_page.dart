import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_post_app/core/utils/show_snackbar.dart';
import 'package:todo_post_app/core/presentation/widgets/loader.dart';
import 'package:todo_post_app/features/post/presentation/bloc/post_bloc.dart';
import 'package:todo_post_app/features/post/presentation/widgets/post_card.dart';
import 'package:todo_post_app/features/post/presentation/widgets/search_field.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostAllPosts());
  }

  @override
  void dispose() {
    debounce?.cancel();
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  void onSearchChanged(String query) {
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        searchFocusNode.unfocus();
        if (query.isEmpty) {
          context.read<PostBloc>().add(PostAllPosts());
        } else {
          context.read<PostBloc>().add(PostSearchedPosts(query));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: BlocConsumer<PostBloc, PostState>(
        listener: (context, state) {
          if (state is PostFailure) {
            showSnackbar(context, state.message);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchField(
                  controller: searchController,
                  focusNode: searchFocusNode,
                  onChanged: onSearchChanged,
                ),
              ),
              Expanded(
                child: state is PostLoading
                    ? const Center(child: Loader())
                    : state is PostSuccess && state.posts.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.search_off,
                                  size: 64,
                                  color: Colors.grey,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'No posts found for user ID: ${searchController.text}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : state is PostSuccess
                            ? Scrollbar(
                                thumbVisibility: true,
                                trackVisibility: true,
                                interactive: true,
                                thickness: 8,
                                radius: const Radius.circular(4),
                                child: ListView.builder(
                                  primary: true,
                                  itemCount: state.posts.length,
                                  itemBuilder: (context, index) {
                                    return PostCard(post: state.posts[index]);
                                  },
                                ),
                              )
                            : const SizedBox(),
              ),
            ],
          );
        },
      ),
    );
  }
}
