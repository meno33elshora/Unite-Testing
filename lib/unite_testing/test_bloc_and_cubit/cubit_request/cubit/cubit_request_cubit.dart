import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
import 'package:unite_testing_app/unite_testing/test_bloc_and_cubit/cubit_request/network_services.dart';

part 'cubit_request_state.dart';

class CubitRequestCubit extends Cubit<CubitRequestState> {
  final NetworkServices networkServices;
  CubitRequestCubit(this.networkServices) : super(CubitRequestInitial());

  Future<void> fetchData() async {
    try {
      emit(CubitRequestLoading());
      final data = await networkServices.fetchPosts();
      emit(CubitRequestLoaded(data: data));
    } catch (e) {
      emit(CubitRequestError(message: e.toString()));
    }
  }
}
