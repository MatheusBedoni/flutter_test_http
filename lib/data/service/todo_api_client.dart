library api_testing_flutter_kata;

import 'dart:convert';
import 'dart:io';

import 'package:flutter_tests_http/data/helper/h_api.dart';


import '../model/task.dart';

class TodoApiClient with ApiServiceHelper{
   final String _baseAddress;

  TodoApiClient(this._baseAddress);

  Future<List<Task>> getAllTasks() async {
    final response = await get('/todos',this._baseAddress);

    final decodedTasks = json.decode(response.body) as List;

    return decodedTasks.map((jsonTask) => Task.fromJson(jsonTask)).toList();
  }

  Future<Task> getTasksById(String id) async {
    final response = await get('/todos/$id',this._baseAddress);

    return Task.fromJson(json.decode(response.body));
  }

  Future<Task> addTask(Task task) async {
    final response = await post(task,this._baseAddress);

    return Task.fromJson(json.decode(response.body));
  }

  Future<Task> updateTask(Task task) async {
    final response = await put(task,this._baseAddress);

    return Task.fromJson(json.decode(response.body));
  }

  Future<void> deleteTaskById(String id) async {
    await delete(id,this._baseAddress);
  }



}
