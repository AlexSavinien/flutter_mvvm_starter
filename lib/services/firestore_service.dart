import 'package:clickncollect_app/services/authentification_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/all.dart';

final firestoreProvider = Provider<FirestoreService>((ref) {
  return FirestoreService(
    ref.read(authentificationServiceProvider),
  );
});

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthentificationService _auth;

  FirestoreService(this._auth);
}