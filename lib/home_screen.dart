import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: const Center(
        child: Text(
          'Nothing here yet—tap ➕ to add a note.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
