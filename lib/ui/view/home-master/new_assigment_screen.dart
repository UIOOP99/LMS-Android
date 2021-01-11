import 'package:flutter/material.dart';
import 'package:lms_app/utils/responsive_safe_area.dart';

class NewAsiggmentScreen extends StatefulWidget {
  NewAsiggmentScreen({Key key}) : super(key: key);

  @override
  _NewAsiggmentScreenState createState() => _NewAsiggmentScreenState();
}

class _NewAsiggmentScreenState extends State<NewAsiggmentScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      builder: (context, size) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('تکلیف جدید'),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            decoration: new InputDecoration(
                              labelText: "عنوان",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(15.0),
                                borderSide: new BorderSide(),
                              ),
                              //fillColor: Colors.green
                            ),
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return 'لطفا عنوان وارد کنید';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: TextFormField(
                              decoration: new InputDecoration(
                                labelText: "متن",
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                              minLines: 3,
                              maxLines: 5,
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return 'لطفا متن تکلیف را وارد کنید';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                FlatButton(
                                  color: Colors.purple,
                                  child: Text(
                                    'محلت ارسال تا',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () async {
                                    final DateTime picked =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate, // Refer step 1
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2025),
                                    );
                                    if (picked != null &&
                                        picked != selectedDate)
                                      selectedDate = picked;
                                    setState(() {});
                                    print(selectedDate.day);
                                  },
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlatButton(
                                  color: Theme.of(context).primaryColor,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "ذخیره",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "لغو",
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
