import 'package:cc_threehours/features/app/domain/screen.model.dart';
import 'package:cc_threehours/features/home/presentation/home.widget.dart';
import 'package:cc_threehours/features/messages/presentation/messages_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppScreensService {
  final BuildContext context;
  late List<Screen> screens;

  AppScreensService(this.context)
      : screens = [
          Screen(AppLocalizations.of(context)!.home, const HomePage()),
          Screen(AppLocalizations.of(context)!.messages, const MessagesPage()),
        ];

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
