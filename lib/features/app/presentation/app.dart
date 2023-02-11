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
  int navBarCurrentIndex = 0;
  static final List<Screen> screens = [
    Screen('Home', const HomePage()),
    Screen('Messages', const Messages()),
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(screens[navBarCurrentIndex].tile),
        ),
        body: screens[navBarCurrentIndex].widget,
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
          currentIndex: navBarCurrentIndex,
          onTap: (int index) {
            setState(() {
              navBarCurrentIndex = index;            
            });
          },
        ),
      ),
    );
  }
}
