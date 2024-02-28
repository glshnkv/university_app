import 'package:auto_route/auto_route.dart';
import 'package:university_app/screens/home/home_screen.dart';
import 'package:university_app/screens/onboarding/onboarding_screen.dart';

import 'package:flutter/material.dart';
import 'package:university_app/screens/settings/settings_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: SettingsRoute.page),
  ];
}
