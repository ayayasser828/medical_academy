import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../constant/end_points.dart';
import '../helpers/dio_helper.dart';

part 'send_request_state.dart';

class SendRequestCubit extends Cubit<SendRequestState> {
  SendRequestCubit() : super(SendRequestInitial());

  String? message;

  String? sendRequest(String courseId){
    DioHelper.postData(url: requestURL, data: {
      'course_id': courseId
    }).then((value) {
      emit(RequestLoading());
      print("response ${value.data}");
      if (value.statusCode! != 200){
        emit(RequestError(value.data["message"]));
      } else {
        message = value.data["message"];
        emit(RequestSend(message!));
        print(value.data.toString());
      }
    }).catchError((e){
      print(e.toString());
      emit(RequestError(e.toString()));
    });
  }
}
