import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_study_case/core/service/http_service.dart';

class GetFilteredExercises {
  Future getFilteredExercises(String type, String detail) async {
    HttpService http = HttpService();
    Response? response;

    response = await http.filteredGetRequest("/v1/exercises?$type=$detail");
    print(response.data);

    return response.data;
  }
}
