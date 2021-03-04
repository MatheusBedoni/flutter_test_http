import 'dart:convert';
import 'dart:io';

import 'package:flutter_tests_http/data/exceptions/todo_api_client_exceptions.dart';
import 'package:flutter_tests_http/data/model/m_api_response.dart';
import 'package:flutter_tests_http/data/model/task.dart';
import 'package:http/http.dart' as http;


mixin  ApiServiceHelper{
  Future<http.Response> get(String endpoint,String _baseAddress) async {
    try {
      final response = await http.get(
        '$_baseAddress$endpoint',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
        },
      );

      return ApiResponse.returnResponseOrThrowException(response);
    } on IOException catch (e) {
      print(e.toString());
      throw NetworkException();
    }
  }

  Future<http.Response> post(Task task,String _baseAddress) async {
    try {
      final response = await http.post(
        '$_baseAddress/todos',
        body: json.encode(task.toJson()) ,
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      return ApiResponse.returnResponseOrThrowException(response);
    } on IOException {
      throw NetworkException();
    }
  }

  Future<http.Response> put(Task task,String _baseAddress) async {
    try {
      final response = await http.put(
        '$_baseAddress/todos/${task.id}',
        body: json.encode(task.toJson()) ,
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      return ApiResponse.returnResponseOrThrowException(response);
    } on IOException  {
      throw NetworkException();
    }
  }

  Future<http.Response> delete(String id,String _baseAddress) async {
    try {
      final response = await http.delete(
        '$_baseAddress/todos/$id',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
        },
      );

      return ApiResponse.returnResponseOrThrowException(response);
    } on IOException  {
      throw NetworkException();
    }
  }
}
