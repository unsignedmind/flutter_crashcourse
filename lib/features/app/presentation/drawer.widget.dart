import 'package:cc_threehours/features/app/application/app_screens.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDrawer extends StatelessWidget {
  final int currentIndex;
  final AppScreensService screens;

  const CustomDrawer(
      {super.key, required this.currentIndex, required this.screens});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.redAccent,
                  Colors.orangeAccent,
                ],
              ),
            ),
            child: Text(screens.getTitle(currentIndex)),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.home),
            onTap: () {
              // nav to new category
              Navigator.of(context).pop(this);
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.messages),
            onTap: () {
              // nav to new category
              Navigator.of(context).pop(this);
            },
          ),
        ],
      ),
    );
  }
}
