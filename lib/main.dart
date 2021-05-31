import 'package:flutter/material.dart';
import 'package:covisangli/Views/Homepage.dart';
import 'package:covisangli/Views/Terms.dart';
import 'package:covisangli/Views/aboutus.dart';
import 'package:covisangli/Views/helpline.dart';
import 'package:covisangli/jsonparser/jsonfetch.dart';
import 'package:covisangli/shivparser/shivdisplay.dart';

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
