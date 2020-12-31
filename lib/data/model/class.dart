import 'package:lms_app/data/model/user.dart';

class Class {
  int id;
  int memberCount;
  String name;
  List<User> userInClass;
  Class({
    this.id,
    this.memberCount,
    this.name,
    this.userInClass,
  });

  @override
  String toString() {
    return 'Class(id: $id, memberCount: $memberCount, name: $name, userInClass: $userInClass)';
  }
}

class ClassToday {
  int id;
  int memberCount;
  int agendaNum;
  String name;
  DateTime startTime;

  ClassToday({
    this.id,
    this.memberCount,
    this.agendaNum,
    this.name,
    this.startTime,
  });

  @override
  String toString() {
    return 'ClassToday(id: $id, memberCount: $memberCount, agendaNum: $agendaNum, name: $name, startTime: $startTime)';
  }
}
