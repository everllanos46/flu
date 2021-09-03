import 'package:flutter/material.dart';

final _icons=<String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'animation_sharp': Icons.animation_sharp,
  'calculate_sharp': Icons.calculate_sharp

};

Icon getIcon(String iconName){

  return Icon(_icons[iconName], color: Colors.black);
}