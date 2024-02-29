import 'package:university_app/models/speciality_model.dart';

class UniversityModel {
  final String name;
  final String location;
  final String description;
  final int rate;
  final List<String> advantages;
  final List<String> disadvantages;
  final List<SpecialityModel> specialities;

  UniversityModel(
      {required this.name,
      required this.location,
      required this.rate,
      required this.description,
      required this.advantages,
      required this.disadvantages,
      required this.specialities});
}
