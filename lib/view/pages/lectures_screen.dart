import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../viewmodel/bloc/lectures_cubit.dart';
import '../components/core/constants.dart';
import 'bottom_bar.dart';

class Lectures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    BottomBar()), (Route<dynamic> route) => false);
              },
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: mainColor,
              ),
            ),
            title: Text(
              'lectures',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              Icon(
                Icons.filter_alt,
                color: mainColor,
              )
            ],
            backgroundColor: Colors.white,
          ),
          body:
          BlocConsumer<LecturesCubit,LecturesState>(
            listener: (context, state) {} ,
            builder: (context, state) =>
            (LecturesCubit.get(context).lectureModel!=null)?Container(
                    child: ListView.builder(
                      itemCount: LecturesCubit.get(context).data.data!.length,
                      itemBuilder: (context, index) {
                        var time = LecturesCubit.get(context).data.data![index].lectureStartTime
                            .toString()
                            .split(':');
                        var timestart = time[0];
                        var time2 = LecturesCubit.get(context).data.data![index].lectureEndTime
                            .toString()
                            .split(':');
                        var timeend = time2[0];
                        if (int.parse(timestart) < 12) {
                          timestart = '$timestart am';
                        } else {
                          timestart = '$timestart pm';
                        }
                        if (int.parse(timeend) < 12) {
                          timeend = '$timeend am';
                        } else {
                          timeend = '$timeend pm';
                        }
                        return Padding(
                          padding:
                              const EdgeInsets.only(top: 18, right: 18, left: 18),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 4.0,
                                        left: 4.0,
                                        top: 4.0,
                                        bottom: 12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          LecturesCubit.get(context).data.data![index].lectureSubject.toString(),
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 24,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.timer_rounded,
                                              color:
                                                  Color.fromARGB(255, 90, 90, 90),
                                            ),
                                            Text(
                                              "2hrs",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Lecture Day',
                                              style: GoogleFonts.poppins(
                                                  color: Color.fromARGB(
                                                      255, 169, 169, 169),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.calendar_month),
                                                Text(
                                                  '${LecturesCubit.get(context).data.data![index].lectureDate.toString()}',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Start Time',
                                              style: GoogleFonts.poppins(
                                                  color: Color.fromARGB(
                                                      255, 169, 169, 169),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.access_time_filled,
                                                  color: Color.fromARGB(
                                                      255, 154, 213, 134),
                                                ),
                                                Text(
                                                  '${timestart}',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'End Time',
                                              style: GoogleFonts.poppins(
                                                  color: Color.fromARGB(
                                                      255, 169, 169, 169),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.access_time_filled,
                                                  color: Color.fromARGB(
                                                      255, 230, 140, 140),
                                                ),
                                                Text(
                                                  '${timeend}',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ):Center(child: CircularProgressIndicator(),),
          ),
        );
  }
}
