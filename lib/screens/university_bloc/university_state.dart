part of 'university_bloc.dart';

@immutable
abstract class UniversityState {}

class UniversityInitial extends UniversityState {}

class LoadedUniversityListState extends UniversityState {
  final List<UniversityModel> universityList;

  LoadedUniversityListState({required this.universityList});
}
