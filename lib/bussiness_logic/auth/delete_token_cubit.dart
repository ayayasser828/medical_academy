import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../constant/end_points.dart';
import '../../constant/global_variables.dart';

part 'delete_token_state.dart';

class DeleteTokenCubit extends Cubit<DeleteTokenState> {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }
  DeleteTokenCubit() : super(DeleteTokenInitial());

  Future<void> deleteProduct() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${prefs.getString('token')}',
    };
    try {
      await dio.delete(baseURL + deleteURL);
      emit(DeleteTokenSuccess());
      print('token deleted!');
    } catch (e) {
      emit(DeleteTokenError());
      print('Error deleting token: $e');
    }
  }
}
