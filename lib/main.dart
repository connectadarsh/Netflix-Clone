

import 'package:api_sample/colors.dart';
import 'package:api_sample/screens/home_screeen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NETFLIX',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.scaffoldBgColor,
        // useMaterial3: true,
      ),
    home: const HomeScreen(),
    );
  }
}