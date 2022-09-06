import 'package:app/Items.dart';
import 'package:flutter/cupertino.dart';

abstract class ToDoState {}

class InboxSelected extends ToDoState {
  final int newState;

  InboxSelected(this.newState);
}

// class PersonalSelected extends ToDoState {
//   final int newState;
//
//   PersonalSelected(this.newState);
// }
//
// class WorkSelected extends ToDoState {
//
//   final int newState;
//
//   WorkSelected(this.newState);
//
// }
//
// class DesignSelected extends ToDoState {
//
//   final int newState;
//
//   DesignSelected(this.newState);
//
// }
//
// class StudySelected extends ToDoState {
//
//   final int newState;
//
//   StudySelected(this.newState);
//
// }