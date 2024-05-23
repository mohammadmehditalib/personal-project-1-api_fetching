part of 'api_cubit.dart';

class ApiState extends Equatable {
  const ApiState();

  @override
  List<Object> get props => [];
}

class ApiInitial extends ApiState {}

class ApiFinal extends ApiState {
  final List<Root> holder;

  const ApiFinal({required this.holder});
}

class ApiErrorState extends ApiState {}
