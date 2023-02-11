import 'package:cc_threehours/features/main/page-template.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      bodyWidget: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber.shade900,
              ),
            ),
          ),
        ],
      ),
      title: 'Home',
    );
  }
}
