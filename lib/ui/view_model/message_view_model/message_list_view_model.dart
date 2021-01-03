import 'package:flutter/material.dart';
import 'package:lms_app/data/model/message.dart';
import 'package:lms_app/ui/view_model/message_view_model/message_view_model.dart';


class MessageListViewModel extends ChangeNotifier
{

  List<MessageViewModel> messages = List<MessageViewModel>();

  MessageListViewModel()
  {
    fetchMessages();
  }


  Future<void> fetchMessages() async{

      for(int i =0 ; i < 10 ; i++)
      {
        Message message = new Message(i , "پیام  " + i.toString() ,"hello" );
        messages.add(new MessageViewModel(message: message));
      }
    await Future.delayed(Duration(seconds: 1));
    notifyListeners();
  }
}