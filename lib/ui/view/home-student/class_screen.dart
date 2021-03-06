import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lms_app/ui/view_model/single_class_view_model/single_class_view_model.dart';
import 'package:lms_app/utils/responsive_safe_area.dart';
import 'package:flutter/services.dart';

import 'package:lms_app/utils/route_creator.dart';
import 'package:provider/provider.dart';

class SingleClassScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SingleClassScreenState();
  }
}

class _SingleClassScreenState extends State<SingleClassScreen> {
  bool _showStudents = true;
  bool _showAllTasks = false;
  bool _openMenu = false;
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final classProvider =
        Provider.of<SingleClassViewModel>(context, listen: false);

    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Theme.of(context).primaryColor,
    //   statusBarBrightness: Brightness.dark,
    //   systemNavigationBarColor: Theme.of(context).primaryColor,
    // ));

    return ResponsiveSafeArea(builder: (context, size) {
      return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     // Add your onPressed code here!
        //     _openMenu = !_openMenu;
        //     setState(() {});
        //   },
        //   child: Icon(_openMenu ? Icons.close : Icons.menu),
        //   backgroundColor: Theme.of(context).primaryColor,
        // ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('نام کلاس'),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: size.height,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 120),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          _showAllTasks = false;
                          _showStudents = !_showStudents;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("دانشجویان"),
                          Transform.rotate(
                              angle: !_showStudents ? 0 : 180 * pi / 180,
                              child: Icon(Icons.arrow_drop_down_sharp))
                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linearToEaseOut,
                    height: _showStudents ? 300 : 0,
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
                      crossAxisCount: 3,
                      children: List.generate(
                        classProvider.students.length,
                        (index) {
                          final student = classProvider.students[index];
                          return Container(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  child: Icon(Icons.person),
                                ),
                                Text(
                                  student.name,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0x0a000000),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 120),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          _showStudents = false;
                          _showAllTasks = !_showAllTasks;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("تکالیف"),
                          Transform.rotate(
                              angle: !_showAllTasks ? 0 : 180 * pi / 180,
                              child: Icon(Icons.arrow_drop_down_sharp))
                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linearToEaseOut,
                    height: _showAllTasks ? 400 : 0,
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    decoration: const BoxDecoration(
                      color: Color(0x0a000000),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: ListView(
                      children: List.generate(classProvider.homeworks.length,
                          (index) {
                        final homework = classProvider.homeworks[index];

                        return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: const BoxDecoration(
                              color: Color(0x0d000000),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: size.width * 0.65,
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        homework.body,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "تاریخ بارگذاری",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "مهلت ارسال",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        child: FlatButton(
                                          onPressed: () {},
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          child: Text(
                                            "دریافت فایل",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: FlatButton(
                                          onPressed: () {},
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          child: Text(
                                            "ارسال پاسخ",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.cyan,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ));
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.linearToEaseOut,
                margin: EdgeInsets.only(bottom: !_openMenu ? 8 : 120, right: 8),
                child: AnimatedOpacity(
                  opacity: _openMenu ? 1 : 0,
                  duration: Duration(milliseconds: 400),
                  child: FloatingActionButton.extended(
                    heroTag: "btn3",
                    label: Row(
                      children: [
                        Icon(Icons.mail),
                        SizedBox(
                          width: 4,
                        ),
                        Text("پیام جدید"),
                      ],
                    ),
                    onPressed: !_openMenu
                        ? null
                        : () async {
                            _openMenu = !_openMenu;
                            setState(() {});

                            Navigator.of(context)
                                .push(createRouteClassToNewMessage());
                            setState(() {});
                          },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 600),
                curve: Curves.linearToEaseOut,
                margin: EdgeInsets.only(bottom: !_openMenu ? 8 : 65, right: 8),
                child: AnimatedOpacity(
                  opacity: _openMenu ? 1 : 0,
                  duration: Duration(milliseconds: 400),
                  child: FloatingActionButton.extended(
                    heroTag: "btn2",
                    label: Row(
                      children: [
                        Icon(Icons.assignment),
                        SizedBox(
                          width: 4,
                        ),
                        Text("تکلیف جدید"),
                      ],
                    ),
                    onPressed: !_openMenu
                        ? null
                        : () async {
                            _openMenu = !_openMenu;
                            setState(() {});
                            Navigator.of(context)
                                .push(createRouteClassToNewAssigment());
                            setState(() {});
                          },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                curve: Curves.linearToEaseOut,
                margin: EdgeInsets.only(bottom: 8, right: 8),
                child: FloatingActionButton.extended(
                  heroTag: "btn1",
                  label: Row(
                    children: [
                      Icon(_openMenu ? Icons.close : Icons.menu),
                      SizedBox(
                        width: 4,
                      ),
                      Text(_openMenu ? "بستن" : "اضافه کردن"),
                    ],
                  ),
                  onPressed: () {
                    // Add your onPressed code here!
                    _openMenu = !_openMenu;
                    setState(() {});
                  },
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
