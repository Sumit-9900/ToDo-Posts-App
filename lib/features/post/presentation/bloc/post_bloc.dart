import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_post_app/core/usecase/usecase.dart';
import 'package:todo_post_app/features/post/domain/entities/post.dart';
import 'package:todo_post_app/features/post/domain/usecases/get_all_posts.dart';
import 'package:todo_post_app/features/post/domain/usecases/get_searched_posts.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetAllPosts _getAllPosts;
  final GetSearchedPosts _getSearchedPosts;
  PostBloc({
    required GetAllPosts getAllPosts,
    required GetSearchedPosts getSearchedPosts,
  })  : _getAllPosts = getAllPosts,
        _getSearchedPosts = getSearchedPosts,
        super(PostInitial()) {
    on<PostEvent>((event, emit) => emit(PostLoading()));
    on<PostAllPosts>(onGetAllPosts);
    on<PostSearchedPosts>(onGetSearchedPosts);
  }

  void onGetAllPosts(PostAllPosts event, Emitter<PostState> emit) async {
    final res = await _getAllPosts(NoParams());

    res.fold(
      (l) => emit(PostFailure(l.message)),
      (r) => emit(PostSuccess(r)),
    );
  }

  void onGetSearchedPosts(
      PostSearchedPosts event, Emitter<PostState> emit) async {
    final res = await _getSearchedPosts(event.query);

    res.fold(
      (l) => emit(PostFailure(l.message)),
      (r) => emit(PostSuccess(r)),
    );
  }
}
