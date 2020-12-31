import 'package:flutter/material.dart';
import 'package:lms_app/data/model/class.dart';
import 'package:lms_app/data/remote_service/remote_service.dart';

class ClassListViewModel extends ChangeNotifier {
  List<Class> classes = List<Class>();

  Future<void> fetchMovies(String keyword) async {
    final results = await RemoteService().fetchAllClasses();
    this.classes = results;
    print(this.classes);
    notifyListeners();
  }
}

class ClassTodayListViewModel extends ChangeNotifier {
  List<ClassToday> classes = List<ClassToday>();

  Future<void> fetchMovies(String keyword) async {
    final results = await RemoteService().fetchTodaysClasses();
    this.classes = results;
    print(this.classes);
    notifyListeners();
  }
}
