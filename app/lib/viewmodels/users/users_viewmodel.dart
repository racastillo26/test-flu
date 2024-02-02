// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:app/data/remote/response/ApiResponse.dart';
import 'package:app/models/users/Users.dart';
import 'package:app/repositories/users_repository_imp.dart';

class Users_ViewModel extends ChangeNotifier {
  final _myRepo = Users_Repository_Imp();

  ApiResponse<List<Users>> userMain = ApiResponse.loading();
  ApiResponse<String> postUserMain = ApiResponse.loading();

  void _getUsers(ApiResponse<List<Users>> response) {
    userMain = response;
    notifyListeners();
  }

  void _postUser(ApiResponse<String> response) {
    postUserMain = response;
    notifyListeners();
  }

  Future<void> Fet_Users() async {
    _getUsers(ApiResponse.loading());
    _myRepo.Get_Users()
        .then((value) => _getUsers(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _getUsers(ApiResponse.error(error.toString())));
  }

  Future<void> Post_User(dynamic body) async {
    _postUser(ApiResponse.loading());
    _myRepo.Post_User(body)
        .then((value) => _postUser(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _getUsers(ApiResponse.error(error.toString())));
  }
}
