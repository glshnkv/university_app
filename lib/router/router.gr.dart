// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddUniversityRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddUniversityScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    UniversityInfoRoute.name: (routeData) {
      final args = routeData.argsAs<UniversityInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UniversityInfoScreen(
          key: args.key,
          university: args.university,
        ),
      );
    },
  };
}

/// generated route for
/// [AddUniversityScreen]
class AddUniversityRoute extends PageRouteInfo<void> {
  const AddUniversityRoute({List<PageRouteInfo>? children})
      : super(
          AddUniversityRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddUniversityRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UniversityInfoScreen]
class UniversityInfoRoute extends PageRouteInfo<UniversityInfoRouteArgs> {
  UniversityInfoRoute({
    Key? key,
    required UniversityModel university,
    List<PageRouteInfo>? children,
  }) : super(
          UniversityInfoRoute.name,
          args: UniversityInfoRouteArgs(
            key: key,
            university: university,
          ),
          initialChildren: children,
        );

  static const String name = 'UniversityInfoRoute';

  static const PageInfo<UniversityInfoRouteArgs> page =
      PageInfo<UniversityInfoRouteArgs>(name);
}

class UniversityInfoRouteArgs {
  const UniversityInfoRouteArgs({
    this.key,
    required this.university,
  });

  final Key? key;

  final UniversityModel university;

  @override
  String toString() {
    return 'UniversityInfoRouteArgs{key: $key, university: $university}';
  }
}
