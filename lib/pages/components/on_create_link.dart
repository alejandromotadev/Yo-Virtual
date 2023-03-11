import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yo_virtual/services/auth.dart';

class OnCreateLink extends StatefulWidget {
  const OnCreateLink({Key? key}) : super(key: key);

  @override
  State<OnCreateLink> createState() => _OnCreateLink();
}

class _OnCreateLink extends State<OnCreateLink> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            Text('on create link'),
          ],
        ),
      ),
    );
  }
}
