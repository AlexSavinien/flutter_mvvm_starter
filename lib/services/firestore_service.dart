import 'package:clickncollect_app/services/authentification_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/all.dart';

final firestoreProvider = Provider<FirestoreService>((ref) {
  return FirestoreService(
    ref.read(authentificationServiceProvider),
  );
});

class FirestoreService {
  final AuthentificationService _auth;
  FirestoreService(this._auth);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference getUsersCollection(String collection) =>
      _firestore.collection(collection);

  Future<void> addUser(Map<String, dynamic> user) async {
    try {
      var uid = _auth.currentUser.uid;
      await getUsersCollection('users').doc(uid).set(user);
    } catch (e) {
      print('coucou');
      print(e);
    }
  }
}
