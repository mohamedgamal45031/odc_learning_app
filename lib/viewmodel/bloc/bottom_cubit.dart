import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_workshop/view/pages/News.dart';
import 'package:odc_workshop/view/pages/home_screen.dart';
import 'package:odc_workshop/view/pages/settings.dart';
import 'package:odc_workshop/viewmodel/bloc/app_state.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
     HomeScreen(),
     News(),
     Settings(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }

}

