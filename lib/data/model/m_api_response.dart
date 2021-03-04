import 'package:flutter_tests_http/data/exceptions/todo_api_client_exceptions.dart';
import 'package:http/http.dart' as http;


class ApiResponse{

  static http.Response returnResponseOrThrowException(http.Response response) {
    if (response.statusCode == 404) {
      throw ItemNotFoundException();
    } else if (response.statusCode > 400) {
      throw UnKnowApiException(response.statusCode);
    } else {
      return response;
    }
  }
}