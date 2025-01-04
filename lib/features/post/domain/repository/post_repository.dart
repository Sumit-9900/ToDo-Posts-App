import 'package:dartz/dartz.dart';
import 'package:todo_post_app/core/error/failure.dart';
import 'package:todo_post_app/features/post/domain/entities/post.dart';

abstract interface class PostRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, List<Post>>> getSearchedPosts(String query);
}
