import 'package:clickncollect_app/ui/views/authentification/signin/signin_view.dart';
import 'package:clickncollect_app/ui/views/home/home_view.dart';
import 'package:clickncollect_app/ui/views/startup/startup_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.read(startUpViewModelProvider);
    return StreamBuilder(
      stream: model.onAuthChanged,
      builder: (context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool isUserLoggedIn = snapshot.hasData;
          return isUserLoggedIn ? HomeView() : SignInView();
        }
        return Container(
          color: Colors.white,
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
