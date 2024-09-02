import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unite_testing_app/unite_testing/test_bloc_and_cubit/cubit_request/cubit/cubit_request_cubit.dart';
import 'package:unite_testing_app/unite_testing/test_bloc_and_cubit/cubit_request/network_services.dart';

void main() {
  group("Testing For Cubit Request Data Api", () {
    late MockNetworkService mockNetworkService;
    late CubitRequestCubit cubitRequestCubit;

    setUp(() {
      mockNetworkService = MockNetworkService();
      cubitRequestCubit = CubitRequestCubit(mockNetworkService);
    });

    tearDown(() {
      cubitRequestCubit.close();
    });

    test("Set Initial Cubit Request", () {
      expect(cubitRequestCubit.state, isInstanceOf<CubitRequestInitial>());
    });

    blocTest<CubitRequestCubit, CubitRequestState>(
      "emit Test Loading and Loaded Cubit when Get Data ",
      build: () {
        when(() => mockNetworkService.fetchPosts()).thenAnswer((_) async {
          return "Test Title";
        });
        return cubitRequestCubit;
      },
      act: (bloc) => bloc.fetchData(),
      expect: () => [
        CubitRequestLoading(),
        CubitRequestLoaded(data: "Test Title"),
      ],
    );

    blocTest<CubitRequestCubit, CubitRequestState>(
      "emit Test Loading and error Cubit when Get Data ",
      build: () {
        when(() => mockNetworkService.fetchPosts())
            .thenThrow(Exception("Failed To fetch data"));
        return cubitRequestCubit;
      },
      act: (bloc) => bloc.fetchData(),
      expect: () => [
        CubitRequestLoading(),
        CubitRequestError(message: "Exception: Failed To fetch data"),
      ],
    );
  });
}

class MockNetworkService extends Mock implements NetworkServices {}
