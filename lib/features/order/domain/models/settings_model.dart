import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsModel{
  String ? id,title;
  IconData icon;
  
  SettingsModel({required this.id,required this.icon,required this.title});
}

List<SettingsModel> settingsModel = [
  SettingsModel(icon: Icons.library_books, title: ("Order History"), id: '1',),
  SettingsModel(icon: Icons.message, title: ("Conversations"), id: '2'),
  SettingsModel(icon: Icons.language, title: ("Language"), id: '3'),
  SettingsModel(icon: Icons.support_agent_outlined, title: ("Help & Support"), id: '4'),
  SettingsModel(icon: Icons.privacy_tip, title: ("Privacy Policy"), id: '5'),
  SettingsModel(icon: Icons.info, title: ("Terms & Conditions"), id: '6'),
];