import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:football_news/ui/list_page.dart';
import 'package:football_news/ui/main_page.dart';
import 'ui/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Football News',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
      home: const SplachScreen()
    );
  }
}

