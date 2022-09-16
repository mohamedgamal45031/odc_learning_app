import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';
import 'package:odc_workshop/model/grade_model.dart';
import 'package:odc_workshop/model/login_model.dart';
import 'package:odc_workshop/model/signup_model.dart';
import 'package:odc_workshop/model/university_model.dart';
import 'package:odc_workshop/utils/network/end_points.dart';

import '../../utils/network/dio_helper.dart';
import '../../utils/network/local/cache_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  var data = LoginModel();
  var signupModel = SignUpModel();
  UniversityModel? universityModel;
  GradeModel? gradeModel;
  var dropdownGradevalue = null;
  String dropdownGendervalue = 'Male';
  var dropdownUniversityvalue = null;
  bool visiblelogin = true;
  bool visible1 = true;
  bool visible2 = true;
  var gender = [
    'Male',
    'Female',
  ];
  var formKeyLogin = GlobalKey<FormState>();

  Future login(String email, String password) async {
    emit(LoginLoading());
      DioHelper.postData(
        url: loginEndPoint,
        data: {'email': email, 'password': password}).then((value) {
      if (value.statusCode == 200) {
        data = LoginModel.fromJson(value.data);
        print(value.data);
        emit(LoginSuccess(data));
        CacheHelper.putString(key: "token", value: data.data!.accessToken!);
      } else {
        emit(LoginError("Login Error"));
      }
    }).catchError((error) {
      emit(LoginError(error));
    });
  }

  Future register(String email, String password, String name, String gender,
      String phone, int universityId, int gradeId) async {
    emit(RegisterLoading());
    EasyLoading.show(
        status: 'loading...', maskType: EasyLoadingMaskType.custom);

    DioHelper.postData(url: registerEndPoint, data: {
      'email': email,
      'password': password,
      'name': name,
      'gender': gender,
      'phoneNumber': phone,
      'universityId': universityId,
      'gradeId': gradeId
    }).then((value) {
      if (value.statusCode == 200) {
        signupModel = SignUpModel.fromJson(value.data);
        print(value.data);
        Future.delayed(const Duration(milliseconds: 5000), () {
          emit(RegisterSuccess());
          EasyLoading.dismiss();
        });
      } else {
        EasyLoading.dismiss();
        emit(RegisterError("Register Failed"));
      }
    }).catchError((error) {
      EasyLoading.dismiss();
      emit(RegisterError(error.toString()));
    });
  }

  Future getUniversityData() async {
    emit(GetUniversityDataLoading());
    var token = CacheHelper.getString(key: "token");
    DioHelper.getData(url: universityEndPoint, token: token).then(
      (value) {
        if (value.statusCode == 200) {
          universityModel = UniversityModel.fromJson(value.data);
          print(universityModel!.List_UniversityData[0].name);
          emit(GetUniversityDataSuccess());
        }
      },
    ).catchError((onError) {
      emit(GetUniversityDataError(onError.toString()));
      print(onError.toString());

    });
  }

  Future getGradeData() async {
    emit(GetGradeDataLoading());
    var token = CacheHelper.getString(key: "token");

    DioHelper.getData(url: gradeEndPoint, token: token).then(
      (value) {
        if (value.statusCode == 200) {
          gradeModel = GradeModel.fromJson(value.data);
          print(gradeModel!.data![0].grade);
          emit(GetGradeDataSuccess());

        }
      },
    ).catchError((onError) {
      emit(GetGradeDataError(onError.toString()));
      print(onError.toString());

    });
  }

  void genderChange(String v) {
    dropdownGendervalue = v;
    emit(GenderSelected());
    print(v);
  }

  void universityChange(int? v) {
    dropdownUniversityvalue = v!;
    emit(UniversitySelected());
    print(v);
  }

  void gradeChange(String? v) {
    dropdownGradevalue = v!;
    emit(GradeSelected());
    print(v);
  }

  void changeVisible(int num) {
    if(num==0){
      visiblelogin = !visiblelogin;
      emit(ChangeVisibilitylogin());
    }
    else if (num == 1) {
      visible1 = !visible1;
      emit(ChangeVisibility1());
    }
    else if(num == 2) {
      visible2 = !visible2;
      emit(ChangeVisibility2());
    }
  }
}
