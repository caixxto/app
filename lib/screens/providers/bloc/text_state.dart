import 'package:flutter/cupertino.dart';

abstract class TextState {}

class ChangedState extends TextState {
  final Color newState;

  ChangedState(this.newState);
}

// class ButtonOffState extends TextState {
//   final Color newState;
//
//   ButtonOffState(this.newState);
// }
//
// class ButtonOnState extends TextState {
//
//   final Color newState;
//
//   ButtonOnState(this.newState);
//
// }