import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odc_workshop/view/components/core/constants.dart';
import '../components/core/components.dart';



class Support extends StatelessWidget {
  Support({Key? key}) : super(key: key);
  GlobalKey<FormState> supportFormKey = GlobalKey();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
          centerTitle: true,
          title:  Text('Support',
              style: fontStyle),
        ),
        body: MediaQuery(
          data: const MediaQueryData(),
          child: Container(
            margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width / 20,
                0,
                MediaQuery.of(context).size.width / 20,
                MediaQuery.of(context).size.height / 40),
            child: SingleChildScrollView(
              child: Form(
                key: supportFormKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 30,
                          left: MediaQuery.of(context).size.width / 60,
                          bottom:
                          MediaQuery.of(context).size.height / 100),
                    ),
                    defaultFormField(
                      decoration: customDecoration(label: "Name", context: context ,color:  mainColor,borders: 1 , prefixIcon: Icons.person),
                      controller: nameController,
                      type: TextInputType.text,
                      isPassword: false,
                    ),
                    getSizedBox(context),
                    defaultFormField(
                      decoration: customDecoration(label: "E-mail",context:  context ,color:  mainColor,borders: 1 , prefixIcon: Icons.email),
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      isPassword: false,
                    ),
                    getSizedBox(context),
                    defaultFormField(
                      minLines: 7,
                      decoration: decoration(label: "What\'s making you unhappy?", context: context , color: mainColor ,borders: 1 ),
                      controller: descriptionController,
                      type: TextInputType.text,
                      isPassword: false,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width / 200,
                          MediaQuery.of(context).size.height / 20,
                          MediaQuery.of(context).size.width / 200,
                          0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width /
                                        40)),
                            primary: mainColor,
                            fixedSize: Size(
                                MediaQuery.of(context).size.width / 1.1,
                                MediaQuery.of(context).size.height / 16),
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        onPressed: () {
                          if (supportFormKey.currentState!.validate()) {
                            Fluttertoast.showToast(msg: "Submitted Successfully");
                          }
                        },
                        child: const Text("Submit" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 24 , color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )

    );

  }

}
