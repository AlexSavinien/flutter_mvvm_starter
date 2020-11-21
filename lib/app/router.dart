import 'package:auto_route/auto_route_annotations.dart';
import 'package:clickncollect_app/ui/views/home/home_view.dart';
import 'package:clickncollect_app/ui/views/startup/startup_view.dart';
import 'package:flutter/material.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: StartUpView, initial: true,),
  MaterialRoute(page: HomeView)
])
class $Router{}