import 'package:flutter/cupertino.dart';

abstract class NewProjectEvent {}

class ColorChangedEvent extends NewProjectEvent {
  final int index;

  ColorChangedEvent({required this.index});

}