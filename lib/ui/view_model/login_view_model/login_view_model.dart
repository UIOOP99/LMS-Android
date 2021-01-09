import 'package:flutter/material.dart';
import 'package:lms_app/data/model/user.dart';
import 'package:lms_app/data/remote_service/remote_service.dart';

class LoginViewModel extends ChangeNotifier {
  Token token;

  User user = User.user;

  Future<void> logInUser(String userName, String password) async {
    final results = await RemoteService().loginUser(userName, password);

// *check authentication
    // if(){

    // }else{

    // }
    this.token = results;
    user.token = token;


    notifyListeners();
  }
}
