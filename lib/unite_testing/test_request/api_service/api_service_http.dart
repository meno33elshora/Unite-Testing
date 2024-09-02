import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unite_testing_app/unite_testing/test_request/model/album.dart';

class ApiServiceTwo {
  Future<Album> fetchAlbum(http.Client client) async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
