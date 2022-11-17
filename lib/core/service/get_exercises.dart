import 'package:dio/dio.dart';
import 'package:flutter_study_case/core/service/http_service.dart';

class GetExercises {
  Future getExercises() async {
    HttpService http = HttpService();
    Response? response;

    response = await http.getRequest("/v1/exercises");

    return response.data;
  }
}
