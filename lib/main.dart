import 'package:flutter/material.dart';
import 'package:mytraining/src/main/home/home_page.dart';

void main() {
  runApp(const MyTrainingApplication());
}

class MyTrainingApplication extends StatelessWidget {
  const MyTrainingApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My training',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
