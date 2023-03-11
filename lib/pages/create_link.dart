import 'package:flutter/material.dart';
import 'components/on_create_link.dart';



void main() => runApp(const CreateLinkScreen());

class CreateLinkScreen extends StatelessWidget {
  const CreateLinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnCreateLink();
  }
}