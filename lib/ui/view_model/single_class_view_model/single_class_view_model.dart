import 'package:flutter/material.dart';
import 'package:lms_app/data/model/homework.dart';
import 'package:lms_app/data/model/user.dart';

class SingleClassViewModel extends ChangeNotifier {
  List<User> students = new List<User>();
  List<Homework> homeworks = new List<Homework>();

  SingleClassViewModel(int courseId) {
    fetchStudents(courseId);
    fetchHomeworks(courseId);
  }

  Future<void> fetchStudents(int courseId) async {
    List<String> names = [
      "بردیا گیمدیل",
      "امیر جهانبین",
      "سجاد یزدان پرست",
      "یونس مرادی",
      "میلاد نفر",
      "حسین قجاوند",
    ];
    for (int i = 0; i < names.length; i++) {
      User user = new User(i, names[i]);
      students.add(user);
    }
    await Future.delayed(Duration(seconds: 1));
    notifyListeners();
  }

  Future<void> fetchHomeworks(int courseId) async {
    for (int i = 0; i < 10; i++) {
      Homework homework = new Homework(i, "تکلیف " + i.toString());
      homeworks.add(homework);
    }
    await Future.delayed(Duration(seconds: 1));
    notifyListeners();
  }
}
