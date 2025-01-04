part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

final class PostAllPosts extends PostEvent {}

final class PostSearchedPosts extends PostEvent {
  final String query;
  PostSearchedPosts(this.query);
}
