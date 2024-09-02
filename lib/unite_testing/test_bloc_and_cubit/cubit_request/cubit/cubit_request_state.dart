part of 'cubit_request_cubit.dart';

abstract class CubitRequestState extends Equatable {
  @override
  List<Object> get props => [];
}

final class CubitRequestInitial extends CubitRequestState {
  @override
  List<Object> get props => [];
}

final class CubitRequestLoading extends CubitRequestState {
  @override
  List<Object> get props => [];
}

final class CubitRequestLoaded extends CubitRequestState {
  final String data;
  CubitRequestLoaded({required this.data});
  @override
  List<Object> get props => [data];
}

final class CubitRequestError extends CubitRequestState {
  final String message;
  CubitRequestError({required this.message});
  @override
  List<Object> get props => [message];
}
