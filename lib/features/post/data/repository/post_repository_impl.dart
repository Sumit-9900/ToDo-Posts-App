import 'package:dartz/dartz.dart';
import 'package:todo_post_app/core/error/exception.dart';
import 'package:todo_post_app/core/error/failure.dart';
import 'package:todo_post_app/features/post/data/datasources/post_remote_datasource.dart';
import 'package:todo_post_app/features/post/domain/entities/post.dart';
import 'package:todo_post_app/features/post/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDatasource postRemoteDatasource;
  PostRepositoryImpl(this.postRemoteDatasource);

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    try {
      final postModels = await postRemoteDatasource.getAllPosts();
      final posts = postModels
          .map((model) => Post(
                userId: model.userId,
                id: model.id,
                title: model.title,
                body: model.body,
              ))
          .toList();

      return right(posts);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Post>>> getSearchedPosts(String query) async {
    try {
      final postModels = await postRemoteDatasource.getSearchedPosts(query);
      final posts = postModels
          .map((model) => Post(
                userId: model.userId,
                id: model.id,
                title: model.title,
                body: model.body,
              ))
          .toList();

      return right(posts);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
