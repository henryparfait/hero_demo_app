import 'package:flutter/material.dart';
import 'gallery_screen.dart';

/// -------------------------------------------------------
/// Hero Widget Demo – Photo Gallery
/// -------------------------------------------------------
/// This app demonstrates the Flutter **Hero** widget using
/// a realistic photo-gallery scenario.
///
/// Three properties are showcased:
///   1. tag              – unique identifier linking two Hero widgets
///   2. flightShuttleBuilder – customises the widget shown mid-flight
///   3. transitionOnUserGestures – enables hero animation on swipe-back
/// -------------------------------------------------------

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