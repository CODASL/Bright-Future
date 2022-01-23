import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/provider.dart';
import 'Screens/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const MaterialApp(
        title: 'bright future',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
