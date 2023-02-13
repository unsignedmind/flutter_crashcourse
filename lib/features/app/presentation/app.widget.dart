import 'package:cc_threehours/features/app/application/app_screens.service.dart';
import 'package:cc_threehours/features/app/presentation/bottom_navigation_bar.widget.dart';
import 'package:cc_threehours/features/app/presentation/custom_appbar.widget.dart';
import 'package:cc_threehours/features/app/presentation/drawer.widget.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  final _pageController = PageController(initialPage: 0);

  void changePage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    AppScreensService appScreensService = AppScreensService(context);

    return Scaffold(
      drawer: CustomDrawer(
        currentIndex: _currentIndex,
        screens: appScreensService,
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: CustomAppBar(currentIndex: _currentIndex),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: appScreensService.getWidgets(),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTapCallback: changePage,
      ),
    );
  }
}
