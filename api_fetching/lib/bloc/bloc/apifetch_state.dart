part of 'apifetch_bloc.dart';

class ApifetchState extends Equatable {
  const ApifetchState();

  @override
  List<Object> get props => [];
}

class ApiIntialState extends ApifetchState {}

class ApiFetchedState extends ApifetchState {
  final List<Root> holder;
  const ApiFetchedState({required this.holder});
}

class ApiErrorState extends ApifetchState {}
