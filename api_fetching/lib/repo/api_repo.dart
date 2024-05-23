import 'dart:convert';

import 'package:api_fetching/bloc/bloc/apifetch_bloc.dart';
import 'package:api_fetching/models/model_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiRepo {
  Future<List<Root>> apiNetworkCall() async {
    List<Root> holder = [];
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        List responseData = jsonDecode(response.body);

        for (int i = 0; i < responseData.length; i++) {
          holder.add(Root.fromJson(responseData[i]));
        }
      }
    } catch (e) {
      return [];
    }
    return holder;
  }

  ///// hitting post api
  Future<List<Root>> postNetworkCall() async {
    List<Root> holder = [];
    try {
      final response = await http.post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          body: jsonEncode(<String, dynamic>{
            'userId': 11,
            'id': 1000,
            'title': 'successfull addded data to database',
            'body': 'fjskjflsjlfjs'
          }));
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Root> holder = await apiNetworkCall();
        holder.forEach((element) {
          print(element.title);
        });
        return holder;
      }
    } catch (e) {
      return [];
    }
    return holder;
  }
}
