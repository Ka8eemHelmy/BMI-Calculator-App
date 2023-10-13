import 'package:flutter/material.dart';

class Navigation {
  static void push(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
}
