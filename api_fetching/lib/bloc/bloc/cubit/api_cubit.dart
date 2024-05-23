import 'dart:convert';

import 'package:api_fetching/models/model_class.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  ApiCubit() : super(ApiInitial());

  void  fetchApiFunction()  async{
    List<Root> holder = [];
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    List responseData = jsonDecode(response.body);

    for (int i = 0; i < responseData.length; i++) {
      holder.add(Root.fromJson(responseData[i]));
    }
    print(holder);
    emit(ApiFinal(holder: holder));
    return;
  }


  
}
