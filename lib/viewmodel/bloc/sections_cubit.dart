
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_workshop/model/section_model.dart';
import 'package:odc_workshop/utils/network/dio_helper.dart';
import 'package:odc_workshop/utils/network/end_points.dart';
import 'package:odc_workshop/viewmodel/bloc/sections_state.dart';

import '../../utils/network/local/cache_helper.dart';

class SectionsCubit extends Cubit<SectionsState> {
  SectionsCubit() : super(SectionsInitial());

  //single instance
  static SectionsCubit get(context) => BlocProvider.of(context);

  SectionModel? sectionModel;

  Future getSections() async {

    emit(GetSectionsLoadingState());

    var token = CacheHelper.getString(key: "token");

    DioHelper.getData(
        url: sectionEndPoint,
        token: token
    ).then(
          (value) {
        if (value.statusCode == 200) {
          sectionModel = SectionModel.fromJson(value.data);
          print(value.data);
          emit(GetSectionsSuccessState());
        }
      },
    ).catchError((error){
      print(error.toString());
      emit(GetSectionsErrorState(error.toString()));
    });
  }
}
