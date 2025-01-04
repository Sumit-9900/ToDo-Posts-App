import 'package:todo_post_app/core/const/api_url.dart';
import 'package:todo_post_app/core/error/exception.dart';
import 'package:todo_post_app/features/post/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract interface class PostRemoteDatasource {
  Future<List<PostModel>> getAllPosts();
  Future<List<PostModel>> getSearchedPosts(String query);
}

class PostRemoteDatasourceImpl implements PostRemoteDatasource {
  final http.Client client;
  PostRemoteDatasourceImpl(this.client);

  @override
  Future<List<PostModel>> getAllPosts() async {
    try {
      final url = Uri.parse(ApiUrl.postUrl);
      final response = await client.get(url);

      final posts = postModelFromJson(response.body);
      return posts;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<PostModel>> getSearchedPosts(String query) async {
    try {
      final url = Uri.parse('${ApiUrl.searchUrl}$query');
      final response = await client.get(url);

      final posts = postModelFromJson(response.body);
      return posts;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
