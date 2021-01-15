import 'package:flutter/material.dart';
import 'package:lms_app/data/model/message.dart';

class CreateMessageViewModel extends ChangeNotifier
{
  bool is_message_sent = false;
  Future<void> createMessage(Message message) async{

    await Future.delayed(Duration(seconds: 1));
    is_message_sent = true;
    notifyListeners();
  }

}