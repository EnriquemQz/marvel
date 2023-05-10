import 'package:flutter/material.dart';
import 'package:marvel_app/providers/character_provider.dart';
import 'package:marvel_app/screens/homepage.dart';
import 'package:provider/provider.dart';

import 'package:marvel_app/views/views.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CharacterProvider())
    ],
    child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const HomePage(),
      ),
    );
  }
}