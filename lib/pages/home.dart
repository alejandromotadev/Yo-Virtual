import 'package:flutter/material.dart';
import 'package:yo_virtual/pages/components/on_home.dart';



void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnHome();
  }
}