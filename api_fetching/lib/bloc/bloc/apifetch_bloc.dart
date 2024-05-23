import 'dart:convert';

import 'package:api_fetching/models/model_class.dart';
import 'package:api_fetching/repo/api_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'apifetch_event.dart';
part 'apifetch_state.dart';

class ApifetchBloc extends Bloc<ApifetchEvent, ApifetchState> {
  List<Root> holder = [];

  ApifetchBloc() : super(ApiIntialState()) {
    on<ApifetchInitial>((event, emit) {
      fetchApiFunction();
    });
    on<ApiPostResult>((event, emit) {
      postApiFunction();
    });
  }

  Future fetchApiFunction() async {
    List<Root> holder = await ApiRepo().apiNetworkCall();
    if (holder.isEmpty) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(ApiErrorState());
    } else {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(ApiFetchedState(holder: holder));
    }
  }
  /// post api run
  void postApiFunction() async {
    emit(ApiIntialState());
    List<Root> holder = await ApiRepo().postNetworkCall();
    if (holder.isEmpty) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(ApiErrorState());
    } else {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(ApiFetchedState(holder: holder));
    }
  }
}
