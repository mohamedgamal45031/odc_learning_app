import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_workshop/main.dart';
import 'package:odc_workshop/model/grade_model.dart';
import 'package:odc_workshop/view/pages/Login.dart';
import 'package:odc_workshop/viewmodel/bloc/login_cubit.dart';

import '../components/core/constants.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController confirmPassController =new TextEditingController();
  TextEditingController nameController =new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  BlocProvider(
        create: (context)=>LoginCubit()..getUniversityData()..getGradeData(),
        child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                Fluttertoast.showToast(
                    msg: "Register Successfully",
                    gravity: ToastGravity.TOP_RIGHT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 18.0);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Login()),
                    (Route<dynamic> route) => false);
              }
              if (state is RegisterError) {
                Fluttertoast.showToast(
                    msg: "Register Failed",
                    webBgColor: "linear-gradient(to right, #960b10, #9e1353)",
                    gravity: ToastGravity.TOP_RIGHT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 18.0);
              }
            },
            builder: (context, state) {
              var formKey = GlobalKey<FormState>();
              return (LoginCubit.get(context).gradeModel == null &&
                  LoginCubit.get(context).universityModel == null)
                  ? SizedBox()
                  :
              Container(
                margin: EdgeInsets.only(top: 60),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(children: [
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
                          margin: EdgeInsets.only(left: 25, top: 40),
                          alignment: AlignmentDirectional.centerStart,
                          child: Text("Sign Up",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold))),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          controller: nameController,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Please enter Name";
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          controller: emailController,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Please enter Email";
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          controller: passController,
                          obscureText: LoginCubit
                              .get(context)
                              .visible1,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Please enter Password";
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon: IconButton(
                                icon: Icon((!LoginCubit
                                    .get(context)
                                    .visible1)
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  LoginCubit.get(context).changeVisible(1);
                                },
                                color: mainColor),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          controller: confirmPassController,
                          obscureText: LoginCubit
                              .get(context)
                              .visible2,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Please enter Password again";
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            suffixIcon: IconButton(
                                icon: Icon((!LoginCubit
                                    .get(context)
                                    .visible2)
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  LoginCubit.get(context).changeVisible(2);
                                },
                                color: mainColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          controller: phoneController,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Please enter Phone number";
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(children: [
                            Text("Gender",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                            Container(
                              height: 60,
                              padding: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border:
                                  Border.all(color: mainColor, width: 2)),
                              child: DropdownButton(
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                // Initial Value
                                value:
                                LoginCubit
                                    .get(context)
                                    .dropdownGendervalue,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: LoginCubit
                                    .get(context)
                                    .gender
                                    .map((String gender) {
                                  return DropdownMenuItem(
                                    value: gender,
                                    child: Text(gender),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                onChanged: (vale) {
                                  LoginCubit.get(context)
                                      .genderChange(vale.toString());
                                },
                                // change button value to selected value
                                underline: DropdownButtonHideUnderline(
                                    child: Container()),
                              ),
                            ),
                          ]),
                          Column(children: [
                            Text("University",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                            Container(
                              width: 150,
                              height: 40,
                              // padding: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                  Border.all(color: mainColor, width: 2)),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: DropdownButton(
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  isExpanded: true,

                                  // Initial Value
                                  value: LoginCubit
                                      .get(context)
                                      .dropdownUniversityvalue,

                                  // Down Arrow Icon
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey,
                                  ),

                                  // Array list of items
                                  items: LoginCubit
                                      .get(context)
                                      .universityModel!
                                      .List_UniversityData
                                      .map((items) {
                                    return DropdownMenuItem<int>(
                                      value: items.id,
                                      child: Text("   ${items.name}"),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (newValue) {
                                    LoginCubit.get(context).universityChange(
                                        int.parse(newValue.toString()));
                                  },
                                  underline: DropdownButtonHideUnderline(
                                    child: Container(),
                                  ),
                                ),
                              ),
                            ),
                          ])
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Column(children: [
                          Text("Grade",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                          Container(
                            // padding: EdgeInsets.all(9),
                            width: 160,
                            height: 40,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: mainColor, width: 2)),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: DropdownButton<String>(
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                isExpanded: true,
                                // Initial Value
                                value:
                                LoginCubit
                                    .get(context)
                                    .dropdownGradevalue,
                                // isDense: true,
                                underline: DropdownButtonHideUnderline(
                                  child: Container(),
                                ),

                                // Down Arrow Icon
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.grey,
                                ),

                                // Array list of items
                                items: LoginCubit
                                    .get(context)
                                    .gradeModel!
                                    .data!
                                    .where((e) => e.grade != null)
                                    .toSet()
                                    .map((items) {
                                  return DropdownMenuItem<String>(
                                    value: items.grade!,
                                    child: Text("   ${items.grade!}"),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (newValue) {
                                  LoginCubit.get(context)
                                      .gradeChange(newValue!);
                                },
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.only(right: 20, left: 20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8), // <-- Radius
                                    ),
                                    primary: mainColor,
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!
                                        .validate()) {
                                      if (passController.text ==
                                          confirmPassController.text) {
                                        var json = {
                                          "name":
                                          nameController.text.toString(),
                                          "email":
                                          emailController.text.toString(),
                                          "password":
                                          passController.text.toString(),
                                          "phoneNumber":
                                          phoneController.text.toString(),
                                          "gender": LoginCubit
                                              .get(context)
                                              .dropdownGendervalue ==
                                              "Male"
                                              ? 'm'
                                              : 'f',
                                          'roleId': 2,
                                          'universityId': LoginCubit
                                              .get(
                                              context)
                                              .universityModel!
                                              .List_UniversityData[
                                          LoginCubit
                                              .get(context)
                                              .dropdownUniversityvalue]
                                              .id,
                                          'gradeId': int.parse(
                                              LoginCubit
                                                  .get(context)
                                                  .dropdownGradevalue
                                                  .split(" ")[1])
                                        };
                                        LoginCubit.get(context).register(
                                          json['email'].toString(),
                                          json['password'].toString(),
                                          json['name'].toString(),
                                          json['gender'].toString(),
                                          json['phoneNumber'].toString(),
                                          int.parse(
                                              json['universityId']
                                                  .toString()),
                                          int.parse(
                                              json['gradeId'].toString()),
                                        );
                                      }
                                    }
                                  },
                                  child: Text("Sign Up",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 30.0, right: 10.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                        Text("OR"),
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 30.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                      ]),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.only(right: 20, left: 20),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12), // <-- Radius
                                        ),
                                        side: BorderSide(
                                          width: 2,
                                          color: mainColor,
                                        ),
                                        primary: Colors.white,
                                        textStyle: TextStyle(
                                          color: mainColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login()),
                                              (route) => false);
                                    },
                                    child: Text("Login",
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: mainColor,
                                        ))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              );
            }
          ),
      ),
    );
  }
}
