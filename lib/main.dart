import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_app/university_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(UniversityApp());
}
