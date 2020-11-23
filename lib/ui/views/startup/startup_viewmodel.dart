import 'package:clickncollect_app/app/router.gr.dart';
import 'package:clickncollect_app/services/authentification_service.dart';
import 'package:clickncollect_app/services/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

final startUpViewModelProvider = Provider<StartUpViewModel>((ref) {
  return StartUpViewModel(
    ref.read(navigationServiceProvider),
    ref.read(authentificationServiceProvider),
  );
});

class StartUpViewModel {
  final NavigationService _navigationService;
  final AuthentificationService _auth;

  StartUpViewModel(this._navigationService, this._auth);

  Stream<User> get onAuthChanged => _auth.onAuthStateChanged;

  void navigateToHome() {
    _navigationService.navigateTo(Routes.homeView);
  }

  void navigateToSignIn() {
    // _navigationService.navigateTo(Routes.signInView);
  }

}