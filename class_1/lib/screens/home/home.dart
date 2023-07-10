import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Class 1'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}