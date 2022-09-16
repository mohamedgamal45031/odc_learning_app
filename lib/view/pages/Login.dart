import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_workshop/view/pages/settings.dart';
import 'package:odc_workshop/view/pages/signup.dart';
import '../../viewmodel/bloc/login_cubit.dart';
import '../components/core/constants.dart';
import 'News.dart';
import 'home_screen.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var show = false;

    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Fluttertoast.showToast(
                msg: "Login Successfully",
                gravity: ToastGravity.TOP_RIGHT,

                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 18.0);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (Route<dynamic> route) => false);
          }
          if (state is LoginError) {
            Fluttertoast.showToast(
                msg: "Login Failed",
                gravity: ToastGravity.TOP_RIGHT,

                webBgColor: "linear-gradient(to right, #960b10, #9e1353)",
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 18.0);
          }
        },
        builder: (context, state) {
          LoginCubit myCubit = LoginCubit.get(context);
          var formKey = GlobalKey<FormState>();

          return Scaffold(
            key: _scaffoldKey,
            body: SafeArea(
                child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Orange",
                              style: GoogleFonts.poppins(
                                  color: mainColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(width: 5),
                          Text("Digital Center",
                              style: GoogleFonts.poppins(
                                  wordSpacing: 5,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700))
                        ],
                      ),
                      SizedBox(height: 60),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Text("Login",
                              style: GoogleFonts.poppins(
                                  wordSpacing: 5,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter The Email";
                            }
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            labelText: 'E-mail',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: LoginCubit.get(context).visiblelogin,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Password";
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(icon:Icon((!LoginCubit.get(context).visiblelogin) ? Icons.visibility:Icons.visibility_off),
                                onPressed: (){
                                  LoginCubit.get(context).changeVisible(0);
                                }, color: mainColor),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          InkWell(
                            onTap: () {

                            },
                            child: Text("Forget Password?",
                                style: GoogleFonts.poppins(
                                    color: mainColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline)),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
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
                                    if (formKey.currentState!.validate()) {
                                      myCubit.login(emailController.text.toString(),
                                          passwordController.text.toString());
                                    }
                                  },
                                  child: Text("Login",
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  },
                                  child: Text("SignUp",
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: mainColor,
                                      ))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
