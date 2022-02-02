import 'package:flutter/cupertino.dart';

class Task {
  String title;
  String description;
  bool isDone;
  String deadLine;
  int Index;

  Task({this.title, this.isDone, this.description, this.deadLine, this.Index});
}