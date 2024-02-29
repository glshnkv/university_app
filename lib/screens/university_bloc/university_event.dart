part of 'university_bloc.dart';

@immutable
abstract class UniversityEvent {}

class GetUniversityListEvent extends UniversityEvent {}

class AddUniversityEvent extends UniversityEvent {
  final UniversityModel university;

  AddUniversityEvent({required this.university});
}
