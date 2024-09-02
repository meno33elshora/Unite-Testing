import 'package:dio/dio.dart';
import 'package:unite_testing_app/unite_testing/test_request/model/post.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<List<Post>> fetchPosts() async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((post) => Post.fromJson(post)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (error) {
      throw Exception('Failed to load posts: $error');
    }
  }
}
