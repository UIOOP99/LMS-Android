import 'package:flutter/material.dart';
import 'package:lms_app/utils/responsive_safe_area.dart';
import 'package:flutter/services.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class HomeStScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeStScreenState();
  }
}

class _HomeStScreenState extends State<HomeStScreen> {
  // int _current_index = 0;

  // final tab_names = ["خانه", "کلاس‌ها", "آزمون", "پروفایل"];

  // final tabs = [
  //   Center(child: Text('خانه')),
  //   Center(child: Text('کلاس‌ها')),
  //   Center(child: Text('آزمون')),
  //   Center(child: Text('پروفایل')),
  // ];

  String getSystemTime() {
    final now = DateTime.now();
    return DateFormat.Hms().format(now);
  }

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('خانه'),
              ),
              Container(
                width: 45,
                height: 45,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    )),
                child: SizedBox(
                  height: 50,
                  child: FlatButton(
                      onPressed: () {
                        //open profile
                      },
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                      child: Container()),
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 120, vertical: 12),
              decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Center(
                child: TimerBuilder.periodic(const Duration(seconds: 1),
                    builder: (context) {
                  return Text(
                    getSystemTime(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  );
                }),
              ),
            ),
            Center(child: Text("کلاس‌ها‌ی امروز")),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: ListView(
                children: [
                  Container(
                    height: 20,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(child: Text("همه‌ی کلاس‌ها")),
            Container(
              height: 260,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ],
        ),
        //body: tabs[_current_index],
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Theme.of(context).primaryColor,
        //   selectedItemColor: Colors.white,
        //   unselectedItemColor: Colors.white,
        //   currentIndex: _current_index,
        //   type: BottomNavigationBarType.fixed,
        //   iconSize: 30,
        //   selectedFontSize: 10,
        //   //backgroundColor: Colors.blue,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       title: Text(tab_names[0]),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.search),
        //       title: Text(tab_names[1]),
        //     ),
        //     // BottomNavigationBarItem(
        //     //     icon: Icon(Icons.camera),
        //     //     title: Text(tab_names[2]),),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.person),
        //       title: Text(tab_names[3]),
        //     ),
        //   ],
        //   onTap: (index) {
        //     setState(() {
        //       _current_index = index;
        //     });
        //   },
        // ),
      );
    });
  }
}
