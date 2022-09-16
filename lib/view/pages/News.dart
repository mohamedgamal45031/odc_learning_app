import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math' as math;

import 'package:odc_workshop/main.dart';
import 'package:odc_workshop/view/components/core/news_item.dart';
import 'package:odc_workshop/viewmodel/bloc/lectures_cubit.dart';

import '../components/core/constants.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LecturesCubit, LecturesState>(
      builder: (context, state) => ConditionalBuilder(
        condition: LecturesCubit.get(context).newsModel != null,
        builder: (context) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "News",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: LecturesCubit.get(context).newsModel!.data!.length,
                  itemBuilder: (BuildContext context, int index) => Center(
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => NewsItem(
                                  url: LecturesCubit.get(context)
                                      .newsModel!
                                      .data![index]
                                      .imageUrl
                                      .toString(),
                                  title: LecturesCubit.get(context)
                                      .newsModel!
                                      .data![index]
                                      .title
                                      .toString(),
                                  body: LecturesCubit.get(context)
                                      .newsModel!
                                      .data![index]
                                      .body
                                      .toString(),
                                  date: LecturesCubit.get(context)
                                      .newsModel!
                                      .data![index]
                                      .date
                                      )),
                            ),
                          );
                        },
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
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        " ${LecturesCubit.get(context).newsModel!.data![index].title}",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600)),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, right: 10),
                                      decoration: BoxDecoration(
                                          color: mainColor,
                                          borderRadius:
                                              BorderRadius.circular(11)),
                                      child: IntrinsicHeight(
                                        child: Row(
                                          children: [
                                            Container(
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.share_outlined,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                            VerticalDivider(
                                              indent: 7,
                                              endIndent: 7,
                                              color: Colors.white,
                                              thickness: 1,
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.copy_rounded,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 150),
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          // padding: new EdgeInsets.only(right: 2.0),
                                          child: Text(
                                            "${LecturesCubit.get(context).newsModel!.data![index].body}",
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 25, right: 5),
                                        child: Text(
                                          "${LecturesCubit.get(context).newsModel!.data![index].date}",
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        fallback: (context) => Center(
          child: CircularProgressIndicator(),
        ),
      ),
      listener: (context, state) {},
    );
  }
}
