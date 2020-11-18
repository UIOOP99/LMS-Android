import 'package:flutter/material.dart';
import 'package:lms_app/utils/responsive_safe_area.dart';

class HomeStScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(builder: (context, size) {
      return Scaffold(
        appBar: AppBar(
          title: Text("خانه"),
        ),
        body: Center(child: Text("Student home")),
      );
    });
  }
}
