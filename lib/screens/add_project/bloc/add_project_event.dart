import 'package:flutter/cupertino.dart';

abstract class AddProjectEvent {}

class AddProject extends AddProjectEvent {
  final String title;
  final Color color;

  AddProject(this.title, this.color);
}

class DataChangeEvent extends AddProjectEvent {}
