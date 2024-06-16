import 'package:flutter/material.dart';
import 'package:meme_app/view/front_screen.dart';
import 'package:meme_app/view/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool IsFrontScreen = true;
  changeIsFrontScreenValue(){
    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        IsFrontScreen = false;
      });
    });
  }

  @override
  void initState() {
    changeIsFrontScreenValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IsFrontScreen ? FrontScreen() : MainScreen(),
    );
  }
}