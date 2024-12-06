import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> regis(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true; // Registrasi berhasil
    } catch (e) {
      print('Error during registration: $e');
      return false; // Registrasi gagal
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true; // Login berhasil
    } catch (e) {
      print('Error during login: $e');
      return false; // Login gagal
    }
  }
}
