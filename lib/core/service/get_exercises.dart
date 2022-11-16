import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_study_case/core/service/http_service.dart';
import 'package:flutter_study_case/model/exercise_model.dart';

class GetExercises {
  Future getExercises() async {
    HttpService http = HttpService();
    Response? response;

    response = await http.getRequest("/v1/exercises");

    return response.data;
  }
}
