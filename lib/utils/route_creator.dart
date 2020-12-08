import 'package:flutter/material.dart';
import 'package:lms_app/ui/home-student/class_screen.dart';
import 'package:lms_app/ui/home-student/home_st_screen.dart';
import 'package:lms_app/ui/profile_screen.dart';

Route createRouteLoginToHomeSt() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HomeStScreen(),
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

Route createRouteHomeToClass() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ClassScreen(),
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
