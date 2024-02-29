import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:university_app/models/speciality_model.dart';
import 'package:university_app/models/university_model.dart';
import 'package:university_app/services/shared_preferences.dart';

part 'university_event.dart';
part 'university_state.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  UniversityBloc() : super(UniversityInitial()) {
    on<GetUniversityListEvent>(_getUniversityListHandler);
    on<AddUniversityEvent>(_addUniversityHandler);
  }

  void _getUniversityListHandler(
      GetUniversityListEvent event, Emitter<UniversityState> emit) async {
    SharedPreferencesService storage =
    await SharedPreferencesService.getInstance();

    final List<UniversityModel> _universityList =
    convertStringsToUniversityModels(storage.universities);

    emit(LoadedUniversityListState(universityList: _universityList));
  }

  void _addUniversityHandler(
      AddUniversityEvent event, Emitter<UniversityState> emit) async {
    SharedPreferencesService storage =
    await SharedPreferencesService.getInstance();

    String universityString = "Name: ${event.university.name.replaceAll(",", "_")}\nLocation: ${event.university.location.replaceAll(",", "_")}\nRate: ${event.university.rate}\nDescription: ${event.university.description.replaceAll(",", "_")}\nAdvantages: ${event.university.advantages.map((advantage) => advantage.replaceAll(",", "_")).join(", ")}\nDisadvantages: ${event.university.disadvantages.map((disadvantage) => disadvantage.replaceAll(",", "_")).join(", ")}\nSpecialities:\n";

    for (SpecialityModel speciality in event.university.specialities) {
      universityString += " - Speciality: ${speciality.speciality.replaceAll(",", "_")}, Priority: ${speciality.priority.replaceAll(",", "_")}, Tuition Fees: ${speciality.tuitionFees}\n";
    }

    final List<String> _universities = storage.universities;
    _universities.add(universityString);
    storage.universities = _universities;
  }

  List<UniversityModel> convertStringsToUniversityModels(List<String> universitiesStrings) {
    List<UniversityModel> universities = [];

    for (String universityString in universitiesStrings) {
      List<String> parts = universityString.split("\n");

      String name = parts[0].split("Name: ")[1].replaceAll("_", ",");
      String location = parts[1].split("Location: ")[1].replaceAll("_", ",");
      int rate = int.parse(parts[2].split("Rate: ")[1]);
      String description = parts[3].split("Description: ")[1].replaceAll("_", ",");
      List<String> advantages = parts[4].split("Advantages: ")[1].split(", ").map((advantage) => advantage.replaceAll("_", ",")).toList();
      List<String> disadvantages = parts[5].split("Disadvantages: ")[1].split(", ").map((disadvantage) => disadvantage.replaceAll("_", ",")).toList();

      List<SpecialityModel> specialities = [];
      for (int i = 7; i < parts.length; i++) {
        List<String> specialityParts = parts[i].split(", ");
        if (specialityParts.length > 1) {
          String speciality = specialityParts[0].split(": ")[1].replaceAll("_", ",");
          String priority = specialityParts[1].split(": ")[1].replaceAll("_", ",");
          int tuitionFees = int.parse(specialityParts[2].split(": ")[1]);
          specialities.add(SpecialityModel(speciality: speciality, priority: priority, tuitionFees: tuitionFees));
        }
      }

      universities.add(UniversityModel(name: name, location: location, rate: rate, description: description, advantages: advantages, disadvantages: disadvantages, specialities: specialities));
    }

    return universities;
  }
}
