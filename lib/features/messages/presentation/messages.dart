import 'package:cc_threehours/features/main/page-template.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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
                color: Colors.teal.shade900,
              ),
            ),
          ),
        ],
      ),
      title: 'Messages',
    );
  }
}
