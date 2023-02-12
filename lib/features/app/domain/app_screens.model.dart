import 'package:cc_threehours/features/app/domain/screen.model.dart';
import 'package:flutter/material.dart';

class AppScreens {
  final List<Screen> screens;

  AppScreens(this.screens);

  List<Widget> getWidgets() {
    return screens.map((e) => e.widget).toList();
  }

  List<String> getTitles() {
    return screens.map((e) => e.title).toList();
  }

  String getTitle(int index) {
    return getTitles()[index];
  }

  Widget getWidget(int index) {
    return getWidgets()[index];
  }
}