import 'package:bloc/bloc.dart';
import 'package:medical_academy/data/models/all_courses_model.dart';
import 'package:medical_academy/data/models/course_model.dart';
import 'package:medical_academy/data/models/session_model.dart';
import 'package:medical_academy/helpers/dio_helper.dart';
import 'package:meta/meta.dart';

import '../../constant/end_points.dart';
import '../../data/models/course_model.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitial());
  AllCoursesModel allCoursesModel = AllCoursesModel();

  AllCoursesModel? getAllCourses(){
    DioHelper.getData(url: allCoursesURL).then((value) {
      emit(CoursesLoading());
      print("response ${value.data}");
      if (value.statusCode! != 200){
        emit(CoursesError('something error'));
      } else {
        allCoursesModel = AllCoursesModel.fromJson(value.data);
        emit(CoursesLoaded(allCoursesModel));
        print(value.data.toString());
      }
    }).catchError((e){
      print(e.toString());
      emit(CoursesError(e.toString()));
    });
  }

  CourseModel courseModel = CourseModel();

  CourseModel? getOneCourse(String id){
    DioHelper.postData(url: allCoursesURL, data: {
      'course_id': id.toString()
    }).then((value) {
      emit(OneCourseLoading());
      print("response ${value.data}");
      if (value.statusCode! != 200){
        emit(OneCourseError('something error'));
      } else {
        courseModel = CourseModel.fromJson(value.data);
        emit(OneCourseLoaded(courseModel));
        print(value.data.toString());
      }
    }).catchError((e){
      print(e.toString());
      emit(OneCourseError(e.toString()));
    });
  }

  SessionModel sessionModel = SessionModel();

  SessionModel? getSession(String courseId,String sessionId){
    DioHelper.postData(url: sessionURL, data: {
      'session_id': sessionId.toString(),
      'course_id': courseId.toString()
    }).then((value) {
      emit(SessionLoading());
      print("response ${value.data}");
      if (value.statusCode! != 200){
        emit(SessionError('something error'));
      } else {
        sessionModel = SessionModel.fromJson(value.data);
        emit(SessionLoaded(sessionModel));
        print(value.data.toString());
      }
    }).catchError((e){
      print(e.toString());
      emit(SessionError(e.toString()));
    });
  }
}
