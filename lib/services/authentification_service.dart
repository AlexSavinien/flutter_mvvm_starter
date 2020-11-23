import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/all.dart';

final authentificationServiceProvider = Provider<AuthentificationService>((ref) {
  return AuthentificationService();
});

class AuthentificationService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get onAuthStateChanged => _auth.authStateChanges();
}