import 'package:flutter/material.dart';
import 'package:marvel_app/views/views.dart';

class CharactesScreen extends StatelessWidget {
  const CharactesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: const Text('Characters'),
      ),
      body: const CharactersGridView(),
    );
  }
}