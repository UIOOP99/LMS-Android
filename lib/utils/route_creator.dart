import 'package:flutter/material.dart';
import 'package:lms_app/ui/view/home-master/new_assigment_screen.dart';
import 'package:lms_app/ui/view/home-master/new_message_screen.dart';
import 'package:lms_app/ui/view/home-student/class_screen.dart';
import 'package:lms_app/ui/view/home-student/home_st_screen.dart';
import 'package:lms_app/ui/view/messages_screen.dart';

import 'package:lms_app/ui/view/profile_screen.dart';
import 'package:lms_app/ui/view_model/class_view_model/class_view_model.dart';
import 'package:lms_app/ui/view_model/message_view_model/create_message_view_model.dart';
import 'package:lms_app/ui/view_model/message_view_model/message_list_view_model.dart';
import 'package:lms_app/ui/view_model/single_class_view_model/single_class_view_model.dart';
import 'package:lms_app/ui/view_model/user_view_model/user_view_model.dart';
import 'package:provider/provider.dart';

Route createRouteLoginToHomeSt() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ChangeNotifierProvider(
      create: (context) => ClassListViewModel(),
      child: HomeStScreen(),
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      final end = Offset.zero;
      final curve = Curves.linearToEaseOut;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route createRouteHomeToClass(int courseId) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ChangeNotifierProvider(
      create: (context) => SingleClassViewModel(courseId),
      child: SingleClassScreen(),
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      final end = Offset.zero;
      final curve = Curves.linearToEaseOut;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route createRouteHomeStToProfile() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ProfileScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      final end = Offset.zero;
      final curve = Curves.linearToEaseOut;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route createRouteClassToNewAssigment() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        NewAsiggmentScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      final end = Offset.zero;
      final curve = Curves.linearToEaseOut;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route createRouteClassToNewMessage() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ChangeNotifierProvider(
          create: (context) => CreateMessageViewModel(),
          child: NewMessageScreen(),
        ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      final end = Offset.zero;
      final curve = Curves.linearToEaseOut;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route createRouteHomeStToMessage() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ChangeNotifierProvider(
      create: (context) => MessageListViewModel(),
      child: MessagesScreen(),
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      final end = Offset.zero;
      final curve = Curves.linearToEaseOut;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
