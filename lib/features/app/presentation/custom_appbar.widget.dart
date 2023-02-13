import 'package:cc_threehours/features/app/application/app_screens.service.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  final int currentIndex;

  const CustomAppBar({super.key, 
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {

    AppScreensService appScreensService = AppScreensService(context);

    return PreferredSize(
      preferredSize: const Size.fromHeight(80.0),
      child: Container(
        height: 120,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.redAccent,
              Colors.orangeAccent,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ListTile(
              title: Row(
                children: [
                  Builder(builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu),
                      color: Colors.white,
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  }),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    appScreensService.getTitle(currentIndex),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 20,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
