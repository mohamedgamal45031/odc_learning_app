import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:odc_workshop/utils/network/dio_helper.dart';
import 'package:odc_workshop/utils/network/local/cache_helper.dart';
import 'package:odc_workshop/view/components/core/constants.dart';
import 'package:odc_workshop/view/pages/Login.dart';
import 'package:odc_workshop/view/pages/News.dart';
import 'package:odc_workshop/view/pages/Terms.dart';
import 'package:odc_workshop/view/pages/bottom_bar.dart';
import 'package:odc_workshop/view/pages/faq_screen.dart';
import 'package:odc_workshop/view/pages/home_screen.dart';
import 'package:odc_workshop/view/pages/lectures_screen.dart';
import 'package:odc_workshop/view/pages/signup.dart';
import 'package:odc_workshop/viewmodel/bloc/add_note_cubit.dart';
import 'package:odc_workshop/viewmodel/bloc/bloc_observer.dart';
import 'package:odc_workshop/viewmodel/bloc/bottom_cubit.dart';
import 'package:odc_workshop/viewmodel/bloc/faq_cubit.dart';
import 'package:odc_workshop/viewmodel/bloc/final_cubit.dart';
import 'package:odc_workshop/viewmodel/bloc/lectures_cubit.dart';
import 'package:odc_workshop/viewmodel/bloc/login_cubit.dart';
import 'package:odc_workshop/viewmodel/bloc/notes_cubit.dart';
import 'package:odc_workshop/viewmodel/bloc/sections_cubit.dart';
import 'package:odc_workshop/viewmodel/bloc/terms_cubit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 4000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..backgroundColor = Colors.black
    ..indicatorColor = mainColor
    ..textColor = mainColor
    ..maskColor = Colors.black.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await CacheHelper.init();
  await DioHelper.init();
  runApp(MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  var token = CacheHelper.getString(key: 'token');

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<LecturesCubit>(
          create: (context) => LecturesCubit()
            ..getLectures()
            ..getnewsData(),
        ),
        BlocProvider<NotesCubit>(
          create: (context) => NotesCubit(),
        ),
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(),
        ),
        BlocProvider<SectionsCubit>(
          create: (context) => SectionsCubit()..getSections(),
        ),
        BlocProvider<ExamsCubit>(
          create: (context) => ExamsCubit()..getExams(),
        ),
        BlocProvider(create: (context) => NotesCubit()..getNotes()),
        BlocProvider(create: (context) => AddNoteCubit()..getTime()),
        BlocProvider(create: (context) => FaqCubit()..getFaQs()),
        BlocProvider(create: (context) => TermsCubit()..getTerms()),
      ],
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          builder: EasyLoading.init(),
          home: AnimatedSplashScreen(
            duration: 1600,
            splash: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Orange",
                      style: GoogleFonts.poppins(
                          color: mainColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(" Digital Center",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                    child: LinearPercentIndicator(
                      alignment: MainAxisAlignment.center,
                      width: 320,
                      lineHeight: 5,
                      percent: 1,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: mainColor,
                      animation: true,
                      animationDuration: 2200,
                    ),
                  ),
                ),
              ],
            ),
            nextScreen: (token == null) ? Login() : BottomBar(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.leftToRight,
          ),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
