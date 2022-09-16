import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:odc_workshop/utils/network/local/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/FaQsModel.dart';
import '../../utils/network/dio_helper.dart';
import '../../utils/network/end_points.dart';
import 'faq_states.dart';



class SharedPreferencesEditor {
}

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());

  static FaqCubit get(context) => BlocProvider.of(context);

  FaQsModel? faqModel;


  Future getFaQs() async {

    emit(FaqGettingData());

    EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.custom
    );
    await DioHelper.getData(
        url: faqEndPoint,
        token: CacheHelper.getString(key: "token").toString(),
    ).then(
          (value) {
        if (value.statusCode == 200) {
          faqModel = FaQsModel.fromJson(value.data);
          print(value.data);
          print("gaaaaaamed");
          emit(FaqGotData());
          EasyLoading.dismiss();
        }
      },
    ).catchError((error){
      print(error.toString());
      emit(FaqGotDataFail());
      EasyLoading.dismiss();
    });
  }
}
