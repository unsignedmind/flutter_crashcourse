import 'package:cc_threehours/features/app/domain/app_screens.model.dart';
import 'package:cc_threehours/features/app/domain/screen.model.dart';
import 'package:cc_threehours/features/home/presentation/home.dart';
import 'package:cc_threehours/features/messages/presentation/messages_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: AppInner());
  }
}

class AppInner extends StatefulWidget {
  const AppInner({super.key});

  @override
  State<AppInner> createState() => _AppInnerState();
}

class _AppInnerState extends State<AppInner> {
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
    AppScreens screens = AppScreens([
      Screen(AppLocalizations.of(context)!.home, const HomePage()),
      Screen(AppLocalizations.of(context)!.messages, const MessagesPage()),
    ]);

    return Scaffold(
      drawer: Drawer(
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
              child: Text(screens.getTitle(_currentIndex)),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.home),
              onTap: () {
                changePage(0);
                Navigator.of(context).pop(this);
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.messages),
              onTap: () {
                changePage(1);
                Navigator.of(context).pop(this);
              },
            ),
          ],
        ),
      ),
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
                      screens.getTitle(_currentIndex),
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
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.message),
            label: AppLocalizations.of(context)!.messages,
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          changePage(index);
        },
      ),
    );
  }
}
