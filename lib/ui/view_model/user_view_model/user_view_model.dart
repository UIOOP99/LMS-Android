import 'package:flutter/material.dart';
import 'package:lms_app/data/model/user.dart';
import 'package:lms_app/data/remote_service/remote_service.dart';

class UserViewModel extends ChangeNotifier {
  User user;

  UserViewModel() {
    fetchUser();
  }

  Future<User> fetchUser() async {
    final results = await RemoteService().fetchUser();

// *check authentication
    // if(){

    // }else{

    // }
    this.user = results;

    notifyListeners();
  }
}
