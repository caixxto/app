import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Project extends Equatable {
  String text;
  IconData icon;

  Project({
    required this.text,
    required this.icon,
});

  @override
  List<Object?> get props => [text, icon];

  static List<Project> projects = [
    Project(
    text: 'text',
    icon: Icons.event,
    )
  ];

}