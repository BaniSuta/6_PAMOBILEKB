import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xfffefefe),
      body: Center(
        child: Container(
          width: screenSize.width * 0.8,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/profil.jpg'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Email@gmail.co.id',
                style: GoogleFonts.merriweather(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // User is logged in, show logout button
                    return ElevatedButton(
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance.signOut();
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error signing out: $e')),
                          );
                        }
                      },
                      child: Text('Logout'),
                    );
                  } else {
                    // User is not logged in, show login button
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/regist");
                      },
                      child: Text('Login'),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: GoogleFonts.merriweather(),
        unselectedLabelStyle: GoogleFonts.merriweather(),
        currentIndex: 2,
        onTap: (value) {
          if (value == 0) {
            Navigator.pushNamed(context, "/home");
          } else if (value == 1) {
            Navigator.pushNamed(context, "/cars");
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: "Cars",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
