import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_workshop/view/pages/exams_screen.dart';
import 'package:odc_workshop/view/pages/lectures_screen.dart';
import 'package:odc_workshop/view/pages/section_screen.dart';

import '../components/core/constants.dart';
import 'Events.dart';
import 'midterms.dart';
import 'notes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
              text: 'Orange',
              style: TextStyle(
                  color: mainColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: " Digital Center",
                    style: TextStyle(color: Colors.black)),
              ]),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
              crossAxisSpacing: 10),
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                    Lectures()));
                },
              child: Card(
                elevation: 5.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(120, 232, 231, 231),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.menu_book,
                        color: mainColor,
                        size: 60,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Lectures",
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: mainColor),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SectionsScreen()));
              },
              child: Card(
                elevation: 5.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(120, 232, 231, 231),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.book,
                        color: mainColor,
                        size: 60,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Sections",
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: mainColor),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                    Midterm()));
                },
              child: Card(
                elevation: 5.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(120, 232, 231, 231),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.my_library_books_rounded,
                        color: mainColor,
                        size: 60,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Midterms",
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: mainColor),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                    ExamsScreen()));
                },
              child: Card(
                elevation: 5.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(120, 232, 231, 231),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.my_library_books_sharp,
                        color: mainColor,
                        size: 60,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Finals",
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: mainColor),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                    CalendarApp()));
              },
              child: Card(
                elevation: 5.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(120, 232, 231, 231),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.calendar_month,
                        color: mainColor,
                        size: 60,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Events",
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: mainColor),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Notes()),);
              },
              child: Card(
                elevation: 5.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(120, 232, 231, 231),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.note_add,
                        color: mainColor,
                        size: 60,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Notes",
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: mainColor),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
