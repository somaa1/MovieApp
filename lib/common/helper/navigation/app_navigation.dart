import 'package:flutter/material.dart';

class AppNavigator {

  static void pushReplacementNamed(BuildContext context, String routeName) {
 Navigator.pushReplacementNamed(context,routeName );
  }

  static void push(BuildContext context,String routeName) {
    Navigator.pushNamed(
      context,
        routeName
    );
  }

  static void pushAndRemove(BuildContext context,String string) {
    Navigator.pushNamedAndRemoveUntil(
      context,
     string,(route) => false,
    );
  }
}