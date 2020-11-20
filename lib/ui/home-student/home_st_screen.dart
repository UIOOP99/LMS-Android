import 'package:flutter/material.dart';
import 'package:lms_app/utils/responsive_safe_area.dart';

class HomeStScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeStScreenState();
  }
}


class _HomeStScreenState extends State<HomeStScreen>
{

  int _current_index = 0;

  final tab_names = ["خانه" , "کلاس‌ها" , "آزمون" , "پروفایل"];

  final tabs = [
    Center(child: Text('خانه')),
    Center(child: Text('کلاس‌ها')),
    Center(child: Text('آزمون')),
    Center(child: Text('پروفایل')),
  ];


  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(builder: (context, size) {
      return Scaffold(
        appBar: AppBar(
          title: Text(tab_names[_current_index]),
        ),
        body: tabs[_current_index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _current_index,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          selectedFontSize: 10,
          //backgroundColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(tab_names[0]),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text(tab_names[1]),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                title: Text(tab_names[2]),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(tab_names[3]),
                backgroundColor: Colors.blue),
          ],
          onTap: (index){
            setState(() {
              _current_index = index;
            });
          },),
      );
    });
  }
}
