import 'package:dio/dio.dart';

class HttpService {
  Dio _dio = Dio();

  HttpService() {
    var baseUrl = "https://exercises-by-api-ninjas.p.rapidapi.com";
    var headers = {
      "X-RapidAPI-Key": "648a6d58f9mshb797f0fe448d2cdp1d552djsn555e1012f65f",
      "X-RapidAPI-Host": "exercises-by-api-ninjas.p.rapidapi.com"
    };
    _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: headers));
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;
    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }
}
