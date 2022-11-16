import 'package:dio/dio.dart';
import 'package:flutter_study_case/core/service/http_service.dart';
import 'package:flutter_study_case/model/exercise_model.dart';

class GetExercises {
  getExercises() async {
    HttpService http = HttpService();
    Response? response;
    try {
      response = await http.getRequest("/v1/exercises");
    } on DioError catch (e) {
      print(e.message);
    }

    print(response!.data);
  }
}
