import 'package:yo_virtual/pages/components/on_home.dart';
import 'package:yo_virtual/services/auth.dart';
import 'package:flutter/material.dart';
import '../login_screen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);
  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return  OnHome();
        } else {
          return const Login();
        }
      },
    );
  }
}
