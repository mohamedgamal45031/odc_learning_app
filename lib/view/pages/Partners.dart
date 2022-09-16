import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_workshop/view/pages/settings.dart';
import 'package:odc_workshop/viewmodel/bloc/lectures_cubit.dart';

import '../components/core/constants.dart';
import 'bottom_bar.dart';

class Our_Parteners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LecturesCubit, LecturesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var myCubit = LecturesCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new, color: mainColor),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title:Text(
                "Our Partners",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ) ,
            ),
            body: (LecturesCubit.get(context).newsModel == null)
                ? SizedBox()  
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: LecturesCubit.get(context)
                              .newsModel!
                              .data!
                              .length,
                          itemBuilder: (BuildContext context, int index) =>
                              Center(
                            child: Card(
                              elevation: 20,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.network(
                                      LecturesCubit.get(context)
                                          .newsModel!
                                          .data![index]
                                          .imageUrl
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5, left: 5),
                                    child: Text(
                                        " ${LecturesCubit.get(context).newsModel!.data![index].title}",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        });
  }
}
