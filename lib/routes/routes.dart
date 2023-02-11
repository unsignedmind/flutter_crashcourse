import 'package:cc_threehours/features/messages/presentation/messages.dart';
import 'package:cc_threehours/features/home/presentation/home.dart';
import 'package:flutter/material.dart';

class Routes {    
  
  static const initialRoute = '/route';

  static final Map<String, Widget Function(BuildContext)> materialRoutes = {
    '/': (context) => const HomePage(),
    '/messages': (context) => const Messages(),
  };
}

