import 'package:flutter/material.dart';
import 'gallery_screen.dart';

void main() {
  runApp(const HeroDemoApp());
}

class HeroDemoApp extends StatelessWidget {
  const HeroDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Widget Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const GalleryScreen(),
    );
  }
}