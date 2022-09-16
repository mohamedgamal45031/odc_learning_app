import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../viewmodel/bloc/terms_cubit.dart';
import '../components/core/constants.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TermsCubit, TermsState>(
        listener: (context, state) {},
        builder: (context, state) {
          TermsCubit myCubit = TermsCubit.get(context);

          final TextSpan textSpan = HTML.toTextSpan(
            context,
            (myCubit.termsModel == null)
                ? ""
                : myCubit.termsModel!.data!.terms.toString(),
            linksCallback: (dynamic link) {
              debugPrint('You clicked on ${link.toString()}');
            },
            // as name suggests, optionally set the default text style
            defaultTextStyle: TextStyle(color: Colors.grey[700]),
            overrideStyle: <String, TextStyle>{
              'p': const TextStyle(fontSize: 17.3),
              'a': const TextStyle(wordSpacing: 2),
              // specify any tag not just the supported ones,
              // and apply TextStyles to them and/override them
            },
          );

          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon:
                      Icon(Icons.arrow_back_ios_new, color: mainColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  'Term & Conditions',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: Colors.black),
                ),
              ),
              body: (state is! TermsSuccess)
                  ? SizedBox()
                  : SingleChildScrollView(child: RichText(text: textSpan)));
        });
  }
}
