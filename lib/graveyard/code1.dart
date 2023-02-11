import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CodeOne extends StatefulWidget {
  const  @override
  State<CodeOne> createState() => _CodeOneState();
}

class _CodeOneState extends State<CodeOne> {
 name({super.key});
  bool iconSwitch = true;

  IconData icon = Icons.close;

  IconData getIcon(choice) {
    if (iconSwitch) {
      icon = Icons.check;
    } else {
      icon = Icons.close;
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber.shade900,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.amberAccent.shade700,
                      width: 3,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        iconSwitch = !iconSwitch;
                      });
                    },
                    padding: const EdgeInsets.all(10),
                    icon: Icon(
                      getIcon(iconSwitch),
                      color: Colors.amberAccent.shade100,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade900,
                  ),
                  child: const Text('This is some text'),
                )
              ],
            ),
          ),
        ),;
  }
}