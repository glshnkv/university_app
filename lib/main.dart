import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_app/screens/university_bloc/university_bloc.dart';
import 'package:university_app/university_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UniversityBloc>(
          create: (context) => UniversityBloc()),
    ],
    child: UniversityApp(),
  ));
}
