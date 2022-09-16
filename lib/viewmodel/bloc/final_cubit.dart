
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_workshop/model/exam_model.dart';
import 'package:odc_workshop/utils/network/dio_helper.dart';
import 'package:odc_workshop/viewmodel/bloc/final_state.dart';

import '../../utils/network/end_points.dart';
import '../../utils/network/local/cache_helper.dart';

class ExamsCubit extends Cubit<ExamsState> {
  ExamsCubit() : super(ExamsInitial());

  //single instance
  static ExamsCubit get(context) => BlocProvider.of(context);

  ExamModel? examModel;

  Future getExams() async {

    emit(GetExamsLoadingState());

    var token = CacheHelper.getString(key: "token");

    DioHelper.getData(
        url: examsEndPoint,
        token: token
    ).then(
          (value) {
        if (value.statusCode == 200) {
          examModel = ExamModel.fromJson(value.data);
          print(value.data);
          emit(GetExamsSuccessState());
        }
      },
    ).catchError((error){
      print(error.toString());
      emit(GetExamsErrorState(error.toString()));
    });
  }
}
