import 'package:todo_post_app/core/const/const.dart';

class LocalException implements Exception {
  final String message;
  LocalException([this.message = Const.errorMessage]);
}

class ServerException implements Exception {
  final String message;
  ServerException([this.message = Const.errorMessage]);
}
