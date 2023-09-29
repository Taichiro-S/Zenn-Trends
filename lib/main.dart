import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '/screens/ranking.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // この行を追加
  await Firebase.initializeApp(); // この行を追加
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zenn Trends',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Ranking(),
    );
  }
}
