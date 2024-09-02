import 'package:dio/dio.dart';

class NetworkServices {
  // final Dio dio;

  // NetworkServices(this.dio);

  Future<String> fetchPosts() async {
    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts/1');
      if (response.statusCode == 200) {
        var data = response.data;
        return data["title"];
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (error) {
      throw Exception('Failed to load posts: $error');
    }
  }
}
