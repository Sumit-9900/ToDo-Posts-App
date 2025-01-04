import 'package:dartz/dartz.dart';
import 'package:todo_post_app/core/error/failure.dart';
import 'package:todo_post_app/core/usecase/usecase.dart';
import 'package:todo_post_app/features/post/domain/entities/post.dart';
import 'package:todo_post_app/features/post/domain/repository/post_repository.dart';

class GetSearchedPosts implements Usecase<List<Post>, String> {
  final PostRepository repository;
  const GetSearchedPosts(this.repository);

  @override
  Future<Either<Failure, List<Post>>> call(String query) async {
    return await repository.getSearchedPosts(query);
  }
}
