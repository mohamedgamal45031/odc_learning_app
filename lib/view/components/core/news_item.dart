import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class NewsItem extends StatelessWidget {
  final String? url;
  final String? title;
  final String? body;
  final String? date;

  const NewsItem(
      {required this.url,
      required this.title,
      required this.body,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.small(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            elevation: 2),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        body: Container(
          color: Colors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  url.toString(),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: RichText(
                      text: TextSpan(
                        text: '$title',
                        style: fontStyle,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: RichText(
                      text: TextSpan(
                        text: '$date',
                        style: fontStyleSettings,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '$body',
                            style: fontStyleSettings,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
//mainColor
