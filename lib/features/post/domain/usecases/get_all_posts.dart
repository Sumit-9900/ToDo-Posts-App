import 'package:dartz/dartz.dart';
import 'package:todo_post_app/core/error/failure.dart';
import 'package:todo_post_app/core/usecase/usecase.dart';
import 'package:todo_post_app/features/post/domain/entities/post.dart';
import 'package:todo_post_app/features/post/domain/repository/post_repository.dart';

class GetAllPosts implements Usecase<List<Post>, NoParams> {
  final PostRepository postRepository;
  const GetAllPosts(this.postRepository);

  @override
  Future<Either<Failure, List<Post>>> call(NoParams params) async {
    return await postRepository.getAllPosts();
  }
}
