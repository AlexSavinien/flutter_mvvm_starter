import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/router.gr.dart';
import 'dialog_service.dart';
import 'navigation_service.dart';

final authentificationServiceProvider = Provider<AuthentificationService>((ref) {
  return AuthentificationService(
    ref.read(navigationServiceProvider),
    ref.read(dialogServiceProvider),
  );
});

class AuthentificationService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final NavigationService _navigationService;
  final DialogService _dialogService;

  AuthentificationService(this._navigationService, this._dialogService);

  Stream<User> get onAuthStateChanged => _auth.authStateChanges();

  User get currentUser => _auth.currentUser;

  Future signUp({@required String email, @required String password}) async {
    try {
      var res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (res.user != null) {
        _dialogService
            .showDialog(
            title: 'Success',
            description: 'You have correctly sign up')
            .whenComplete(
              () => _navigationService.navigateTo('/'),
        );

        print('User have signed up with this email : $email');
      } else {
        _dialogService.showDialog(
          title: 'Error',
          description: 'Unable to sign you up, please try later',
        );
        print('Error, user can\'t sign up, probably an issue with firebase');
      }
    } on FirebaseAuthException catch (e) {
      _dialogService.showDialog(
        title: 'Error',
        description: e.message,
      );
    }
  }

  Future signIn({@required String email, @required String password}) async {
    try {
      var res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (res.user != null) {
        _dialogService
            .showDialog(
            title: 'Success',
            description: 'You have correctly sign in')
            .whenComplete(
              () => _navigationService.navigateTo(Routes.homeView),
        );
        print('User have logged in');
      } else {
        print('Unable to log you in, please try later');
      }
    } on FirebaseAuthException catch (e) {
      _dialogService.showDialog(
        title: 'Error',
        description: e.message,
      );
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    print('User has logged out');
  }
}