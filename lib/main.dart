import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp/pages/camera_screen.dart';
import 'package:whatsapp/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WhatsApp",
      theme: ThemeData(
          colorScheme: const ColorScheme(
              primary: Color(0xFF00695C),
              primaryVariant: Color(0xFF4CAF50),
              secondary: Color(0xFF2E7D32),
              secondaryVariant: Color(0xFF4CAF50),
              surface: Color(0xFF4CAF50),
              background: Color(0xFF66BB6A),
              error: Color(0xFF4CAF50),
              onPrimary: Color(0xFFFFFFFF),
              onSecondary: Color(0xFF4CAF50),
              onSurface: Color(0xFF4CAF50),
              onBackground: Color(0xFF2E7D32),
              onError: Color(0xFF4CAF50),
              brightness: Brightness.light)),
      home: const HomePage(),
    );
  }
}
