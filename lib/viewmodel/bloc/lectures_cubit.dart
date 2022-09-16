import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc_workshop/model/grade_model.dart';
import 'package:odc_workshop/model/lecture_model.dart';
import 'package:odc_workshop/model/news_model.dart';
import 'package:odc_workshop/model/university_model.dart';
import 'package:odc_workshop/utils/network/dio_helper.dart';
import 'package:odc_workshop/utils/network/end_points.dart';
import 'package:odc_workshop/viewmodel/bloc/login_cubit.dart';

import '../../utils/network/local/cache_helper.dart';

part 'lectures_state.dart';

class LecturesCubit extends Cubit<LecturesState> {
  LecturesCubit() : super(LecturesInitial());

  //single instance
  static LecturesCubit get(context) => BlocProvider.of(context);
  bool isLoading = true;
  LectureModel data = LectureModel();
  NewsModel? newsModel;
  LectureModel? lectureModel;
  UniversityModel? universityModel;
  GradeModel? gradeModel;
  var dropdownGradevalue = null;
  String dropdownGendervalue = 'Male';
  var dropdownUniversityvalue = null;
  bool visible1 = true;
  bool visible2 = true;
  var gender = [
    'Male',
    'Female',
  ];

  Future getLectures() async {

    emit(GetLecturesLoadingState());

    var token = CacheHelper.getString(key: "token");

    DioHelper.getData(
        url: lectureEndPoint,
        token: token
    ).then(
          (value) {
        if (value.statusCode == 200) {
          data = LectureModel.fromJson(value.data);
          lectureModel = LectureModel.fromJson(value.data);
          print(value.data);
          emit(GetLecturesSuccessState());
        }
      },
    ).catchError((error){
      print(error.toString());
      emit(GetLecturesErrorState(error.toString()));
    });
  }
  Future getnewsData() async {
    emit(GetData());
    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NjIsInJvbGUiOjQsImlhdCI6MTY2MzAyODMyNiwiZXhwIjoxNzQ5NDI4MzI2fQ.aTR7ZOpgvd5ub4i3bFDrQjrBKXIu10n-eecvxnObt_w";
    DioHelper.getData(url: newsEndPoint, token: token).then(
          (value) {
        if (value.statusCode == 200) {
          newsModel = NewsModel.fromJson(value.data);
          print(newsModel!.data![0].body);
          emit(getNewsDataSuccess());
        }
      },
    );
    emit(GetData());
  }


}
