part of 'courses_cubit.dart';

@immutable
abstract class CoursesState {}

class CoursesInitial extends CoursesState {}

class CoursesLoading extends CoursesState {}

class CoursesLoaded extends CoursesState {
  final AllCoursesModel allCoursesModel;

  CoursesLoaded(this.allCoursesModel);
}

class CoursesError extends CoursesState {
  final String message;

  CoursesError(this.message);
}

class OneCourseLoading extends CoursesState {}

class OneCourseLoaded extends CoursesState {
  final CourseModel courseModel;

  OneCourseLoaded(this.courseModel);
}

class OneCourseError extends CoursesState {
  final String message;

  OneCourseError(this.message);
}

