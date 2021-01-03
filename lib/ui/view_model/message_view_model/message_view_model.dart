
import 'package:lms_app/data/model/message.dart';

class MessageViewModel{
  final Message message;

  MessageViewModel({this.message});
  String get title {
    return this.message.title;
  }

  String get body
  {
    return this.message.msg;
  }
}