class Message {
  int id;
  String title;
  String msg;
  String course_name;
  String teacher_name;

  Message.builder();

  Message(this.id , this.title , this.msg , {this.course_name , this.teacher_name});

}