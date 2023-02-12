import 'package:cc_threehours/features/app/domain/app_screens.model.dart';
import 'package:cc_threehours/features/app/domain/screen.model.dart';
import 'package:cc_threehours/features/home/presentation/home.dart';
import 'package:cc_threehours/features/messages/presentation/messages.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  static final AppScreens screens = AppScreens([
    Screen('Home', const HomePage()),
    Screen('Messages', const Messages()),
  ]);
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
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
                  title: Text(
                    screens.getTitle(_currentIndex),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
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
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          children: screens.getWidgets(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (int index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
        ),
      ),
    );
  }
}
