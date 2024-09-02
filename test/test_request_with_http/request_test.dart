import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unite_testing_app/unite_testing/test_request/api_service/api_service_http.dart';
import 'package:unite_testing_app/unite_testing/test_request/model/album.dart';

import 'request_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late ApiServiceTwo apiServiceTwo;

  setUp(() {
    mockClient = MockClient();
    apiServiceTwo = ApiServiceTwo();
  });

  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(mockClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async =>
              http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(await apiServiceTwo.fetchAlbum(mockClient), isA<Album>());
    });

    test('throws an exception if the http call completes with an error', () {
      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(mockClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(apiServiceTwo.fetchAlbum(mockClient), throwsException);
    });
  });
}
