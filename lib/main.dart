import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_car/firebase_options.dart';
import 'package:super_car/provider/controller.dart';
import 'package:super_car/views/Login.dart';
import 'package:super_car/views/Regis.dart';
import 'package:super_car/views/cars_page.dart';
import 'package:super_car/views/home_page.dart';
import 'package:super_car/views/profile_page.dart';
import 'package:super_car/views/rekom_page.dart';
import 'package:super_car/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => PredictionProvider(),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Car',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xffD4F6FF),
        ),
        useMaterial3: true,
      ),
      routes: {
        "/home": (context) => const HomePage(),
        "/profile": (context) => const ProfilePage(),
        "/regist": (context) => const Regis(),
        "/login": (context) => const Login(),
        "/cars": (context) => const CarsPage(),
        "/rekom": (context) => const RekomPage(),
      },
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
