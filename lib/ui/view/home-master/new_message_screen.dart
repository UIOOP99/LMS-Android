
import 'package:flutter/material.dart';
import 'package:lms_app/data/model/message.dart';
import 'package:lms_app/ui/view_model/message_view_model/create_message_view_model.dart';
import 'package:lms_app/utils/responsive_safe_area.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


class NewMessageScreen extends StatefulWidget {
  NewMessageScreen({Key key}) : super(key: key);

  @override
  _NewMessageScreenState createState() => _NewMessageScreenState();
}

class _NewMessageScreenState extends State<NewMessageScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final create_messages_provider = Provider.of<CreateMessageViewModel>(context);
      if(create_messages_provider.is_message_sent)
          Navigator.of(context).pop();
    Message message = new Message.builder();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Theme.of(context).primaryColor,
    ));


    return ResponsiveSafeArea(
      builder: (context, size) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('پیام جدید'),
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
                            onChanged: (value)
                            {
                              message.title = value;
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
                                  return 'لطفا متن پیام را وارد کنید';
                                }
                                return null;
                              },
                              onChanged: (value)
                              {
                                message.msg = value;
                              },
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
                                    create_messages_provider.createMessage(message);
                                    if(create_messages_provider.is_message_sent)
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
