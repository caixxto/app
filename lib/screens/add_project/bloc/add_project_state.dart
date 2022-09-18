import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewProjectState {
   IconData icon;
   int? index;

  IconData get changeIcon {


  }

   NewProjectState copyWith({
     IconData? icon,
     final int? index,
   }) {
     return NewProjectState(
       icon: icon ?? this.icon,
       index: index ?? this.index,

     );
   }

  NewProjectState({required this.icon, this.index});
}