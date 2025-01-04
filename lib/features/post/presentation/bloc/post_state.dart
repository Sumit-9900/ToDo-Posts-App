part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class PostFailure extends PostState {
  final String message;
  PostFailure(this.message);
}

final class PostSuccess extends PostState {
  final List<Post> posts;
  PostSuccess(this.posts);
}
