import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms_app/ui/view_model/message_view_model/message_list_view_model.dart';
import 'package:lms_app/utils/responsive_safe_area.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MessagesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessagesScreen();
  }
}

class _MessagesScreen extends State<MessagesScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final messages_provider = Provider.of<MessageListViewModel>(context);

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
                child: Text('پیام‌ها'),
              ),
            ],
          ),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: messages_provider.messages.length,
              itemBuilder: (context, index) {
                final message = messages_provider.messages[index];

                //return ListTile(
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
                              message.title,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              margin: EdgeInsets.all(8),
                              child: Text(
                                message.body,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              )),
                        )
                      ],
                    ));
                //);
              }),
        ),
      );
    });
  }
}
