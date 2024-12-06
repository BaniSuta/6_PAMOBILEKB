import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_car/views/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffefefe),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo tanpa bg.png",
              fit: BoxFit.fill,
            ),
            Text(
              "Super Car",
              style: GoogleFonts.abrilFatface(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
