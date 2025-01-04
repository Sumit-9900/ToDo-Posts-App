import 'package:dartz/dartz.dart';
import 'package:todo_post_app/core/error/failure.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

abstract interface class UsecaseWithSuccessType<SuccessType, Params> {
  SuccessType call(Params params);
}

final class NoParams {}
