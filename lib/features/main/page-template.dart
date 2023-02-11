import 'package:cc_threehours/routes/routes.dart';
import 'package:flutter/material.dart';

class PageTemplate extends StatefulWidget {
  final Widget bodyWidget;
  final String title;

  const PageTemplate({Key? key, required this.bodyWidget, required this.title})
      : super(key: key);

  @override
  State<PageTemplate> createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  int navBarCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: widget.bodyWidget,
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
          var route = Routes.materialRoutes.entries.elementAt(index).key;
          debugPrint(route);
          setState(() {
            navBarCurrentIndex = index;
            Navigator.pushNamed(
              context,
              route,
            );
          });
        },
      ),
    );
  }
}
