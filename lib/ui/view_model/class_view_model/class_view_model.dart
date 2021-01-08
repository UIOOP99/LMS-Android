import 'package:flutter/material.dart';
import 'package:lms_app/data/model/class.dart';
import 'package:lms_app/data/remote_service/remote_service.dart';

class ClassListViewModel extends ChangeNotifier {
  List<Class> classes = List<Class>();
  List<ClassToday> todayClasses = List<ClassToday>();
  ClassListViewModel() {
    fetchAllClasses();
    fetchTodayClasses();
  }

  Future<void> fetchAllClasses() async {
    final results = await RemoteService().fetchAllClasses();
    this.classes = results;

    notifyListeners();
  }

  Future<void> fetchTodayClasses() async {
    final results = await RemoteService().fetchTodaysClasses();
    this.todayClasses = results;
    notifyListeners();
  }
}
