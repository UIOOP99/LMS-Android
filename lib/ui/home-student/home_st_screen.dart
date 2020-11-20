import 'package:flutter/material.dart';
import 'package:lms_app/utils/responsive_safe_area.dart';
import 'package:flutter/services.dart';

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


      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Theme.of(context).primaryColor,
      ));

    return ResponsiveSafeArea(builder: (context, size) {
      return Scaffold(
        appBar: AppBar(
          title: Text(tab_names[_current_index]),
        ),
        body: tabs[_current_index],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: _current_index,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          selectedFontSize: 10,
          //backgroundColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(tab_names[0]),),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text(tab_names[1]),),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                title: Text(tab_names[2]),),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(tab_names[3]),),
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
