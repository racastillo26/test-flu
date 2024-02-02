// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:app/data/remote/network/BaseApiService.dart';
import 'package:app/data/remote/network/NetworkApiService.dart';
import 'package:app/models/requests/Requests.dart';
import 'package:app/models/users/Users.dart';
import 'package:app/repositories/users_repository.dart';
import 'package:app/data/remote/network/ApiEndPoints.dart';

class Users_Repository_Imp implements Users_Repository {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<List<Users>?> Get_Users() async {
    try {
      dynamic response =
          await _apiService.getResponse(APIEndpoints().get_save_users);
      final jsonData = ResponseUser.fromJson(response);
      return jsonData.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> Post_User(dynamic body) async {
    try {
      dynamic response =
          await _apiService.postResponse(APIEndpoints().get_save_users, body);
      final jsonData = ResponseRequest.fromJson(response);
      return jsonData.data;
    } catch (e) {
      rethrow;
    }
  }
}
