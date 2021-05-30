import 'package:flutter/material.dart';
import 'package:my_app/Views/Homepage.dart';
import 'package:my_app/Views/Terms.dart';
import 'package:my_app/Views/aboutus.dart';
import 'package:my_app/Views/helpline.dart';
import 'package:my_app/jsonparser/jsonfetch.dart';
import 'package:my_app/shivparser/shivdisplay.dart';

void main() {
  runApp(new HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => jsonfetch(),
        '/tiffin': (context) => Shivfetch(),
        '/home': (context) => Userdat(),
        '/about': (context) => AboutUS(),
        '/terms': (context) => Terms(),
        '/helpline': (context) => HelpLine(),
      },
    );
  }
}
