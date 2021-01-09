import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lms_app/data/model/user.dart';
import 'package:lms_app/ui/view_model/class_view_model/class_view_model.dart';
import 'package:lms_app/ui/view_model/message_view_model/message_list_view_model.dart';
import 'package:lms_app/ui/view_model/user_view_model/user_view_model.dart';
import 'package:lms_app/utils/responsive_safe_area.dart';
import 'package:flutter/services.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:lms_app/utils/route_creator.dart';
import 'package:provider/provider.dart';

class HomeStScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeStScreenState();
  }
}

class _HomeStScreenState extends State<HomeStScreen> {
  bool _showTodaysClasses = true;
  bool _showAllClasses = false;

  String getSystemTime() {
    final now = DateTime.now();
    return DateFormat.Hms().format(now);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final classProvider = Provider.of<ClassListViewModel>(context);
    final userProvider = Provider.of<UserViewModel>(context);


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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(createRouteHomeStToMessage());
                        },
                        child: Container(child: Icon(Icons.email))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(createRouteHomeStToProfile());
                        },
                        child: CircleAvatar(child: Icon(Icons.person))),
                  ),
                ],
              )
            ],
          ),
        ),
        body: Container(
          height: size.height,
          child: ListView(
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 120),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _showAllClasses = false;
                      _showTodaysClasses = !_showTodaysClasses;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("کلاس‌ها‌ی امروز"),
                      Transform.rotate(
                          angle: !_showTodaysClasses ? 0 : 180 * pi / 180,
                          child: Icon(Icons.arrow_drop_down_sharp))
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.linearToEaseOut,
                height: _showTodaysClasses ? 300 : 0,
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                decoration: const BoxDecoration(
                  color: Color(0x0a000000),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: ListView(
                  children:
                      List.generate(classProvider.todayClasses.length, (index) {
                    return Container(
                      height: 80,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: const BoxDecoration(
                        color: Color(0x0d000000),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: Text(
                                classProvider.todayClasses[index].name,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                margin: EdgeInsets.all(12),
                                child: Text(
                                  "${classProvider.todayClasses[index].startTime.hour}: ساعت شروع",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                )),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                                margin: EdgeInsets.all(8),
                                child: Text(
                                  "شماره‌ی جلسه:${classProvider.todayClasses[index].agendaNum}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                )),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 120),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _showTodaysClasses = false;
                      _showAllClasses = !_showAllClasses;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("همه‌ی کلاس‌ها"),
                      Transform.rotate(
                          angle: !_showAllClasses ? 0 : 180 * pi / 180,
                          child: Icon(Icons.arrow_drop_down_sharp))
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.linearToEaseOut,
                  height: _showAllClasses ? 400 : 0,
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  decoration: const BoxDecoration(
                    color: Color(0x0a000000),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children:
                          List.generate(classProvider.classes.length, (index) {
                        return Container(
                          padding: const EdgeInsets.all(8),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(createRouteHomeToClass(
                                  classProvider.classes[index].id));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  classProvider.classes[index].name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[900],
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "تعداد اعضا ${classProvider.classes[index].memberCount}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0x0a000000),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        );
                      }))),
            ],
          ),
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
