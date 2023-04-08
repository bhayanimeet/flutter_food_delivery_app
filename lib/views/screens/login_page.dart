import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/firebase_login_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  bool isVisible = true;

  String status = "Create account";
  String logIn = "Sign Up";
  String account = "Already account?";
  String signIn = " Sign in";

  bool isSignUp = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.teal.shade600,
                      Colors.teal.shade300,
                    ],
                  ),
                ),
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/logo.png',
                  filterQuality: FilterQuality.high,
                  scale: 2,
                ),
              ),
              Container(
                height: 580,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 18),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15),
                        child: Text(
                          status,
                          style: GoogleFonts.arya(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          enableSuggestions: true,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          style: GoogleFonts.play(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          onSaved: (val) {
                            setState(() {
                              email = val!;
                            });
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter email first...";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1)),
                            focusColor: Colors.grey.shade300,
                            labelText: "Email",
                            labelStyle: GoogleFonts.arya(
                                fontSize: 25, color: Colors.black),
                            hintText: "Enter Email",
                            prefixIcon: const Icon(Icons.email_outlined,
                                color: Colors.black, size: 28),
                            errorStyle: GoogleFonts.play(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            hintStyle: GoogleFonts.play(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          enableSuggestions: true,
                          obscureText: isVisible,
                          style: GoogleFonts.play(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          onSaved: (val) {
                            setState(() {
                              password = val!;
                            });
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Password first...";
                            }
                            return null;
                          },
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Icon(
                                (isVisible == true)
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1)),
                            focusColor: Colors.black,
                            labelText: "Password",
                            labelStyle: GoogleFonts.arya(
                                fontSize: 25, color: Colors.black),
                            hintText: "Enter Password",
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: Colors.black),
                            errorStyle: GoogleFonts.play(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            hintStyle: GoogleFonts.play(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot password?",
                            style: GoogleFonts.play(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            if (isSignUp == true) {
                              Map<String, dynamic> res = await FirebaseHelper
                                  .firebaseHelper
                                  .signUp(email: email, password: password);

                              if (res['user'] != null) {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setBool('isLogged', true);
                                setState(() {
                                  Navigator.pushReplacementNamed(context, 'homePage',
                                      arguments: res['user']);
                                });
                              }
                              else if (res['error'] != null) {
                                setState(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(res['error']),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                });
                              }
                              else {
                                setState(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                          "Please check network connection..."),
                                      behavior: SnackBarBehavior.floating,
                                      margin: const EdgeInsets.all(20),
                                      duration: const Duration(milliseconds: 1500),
                                      backgroundColor: Colors.red.shade400,
                                    ),
                                  );
                                });
                              }
                            }
                            else if (isSignUp == false) {
                              Map<String, dynamic> res = await FirebaseHelper
                                  .firebaseHelper
                                  .signIn(email: email, password: password);

                              if (res['user'] != null) {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setBool('isLogged', true);
                                setState(() {
                                  Navigator.pushReplacementNamed(context, 'homePage',
                                      arguments: res['user']);
                                });
                              }
                              else if (res['error'] != null) {
                                setState(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(res['error']),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                });
                              }
                              else {
                                setState(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                          "Please check network connection..."),
                                      behavior: SnackBarBehavior.floating,
                                      margin: const EdgeInsets.all(20),
                                      duration: const Duration(milliseconds: 1500),
                                      backgroundColor: Colors.red.shade400,
                                    ),
                                  );
                                });
                              }
                            }
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.teal.shade400,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            logIn,
                            style: GoogleFonts.arya(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 70,
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "OR SIGN IN WITH",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 8),
                          SizedBox(
                            width: 70,
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              Map<String, dynamic> res = await FirebaseHelper
                                  .firebaseHelper
                                  .signInWithGoogle();

                              if (res['user'] != null) {
                                SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                                await prefs.setBool('isLogged', true);
                                setState(() {
                                  Navigator.pushReplacementNamed(context, 'homePage',
                                      arguments: res['user']);
                                });
                              } else if (res['error'] != null) {
                                setState(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(res['error']),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                });
                              } else {
                                setState(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                          "Please check network connection..."),
                                      behavior: SnackBarBehavior.floating,
                                      margin: const EdgeInsets.all(20),
                                      duration: const Duration(milliseconds: 1500),
                                      backgroundColor: Colors.red.shade400,
                                    ),
                                  );
                                });
                              }
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                color: Colors.indigo,
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(10)),
                                shadowLightColor: Colors.transparent,
                                surfaceIntensity: 0.5,
                                lightSource: LightSource.bottomLeft,
                                oppositeShadowLightSource: true,
                              ),
                              child: Container(
                                height: 47,
                                width: 120,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/google.png',
                                        height: 25,
                                        filterQuality: FilterQuality.high),
                                    const SizedBox(width: 10),
                                    const Text(
                                      "Google",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () async {
                              Map<String, dynamic> res =
                              await FirebaseHelper.firebaseHelper.guest();

                              if (res['user'] != null) {
                                SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                                await prefs.setBool('isLogged', true);
                                setState(() {
                                  Navigator.pushReplacementNamed(context, 'homePage',
                                      arguments: res['user']);
                                });
                              } else if (res['error'] != null) {
                                setState(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                      Text("Please check network connection..."),
                                      behavior: SnackBarBehavior.floating,
                                      duration: Duration(seconds: 2),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                });
                              } else {
                                setState(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                          "Please check network connection..."),
                                      behavior: SnackBarBehavior.floating,
                                      margin: const EdgeInsets.all(20),
                                      duration: const Duration(milliseconds: 1500),
                                      backgroundColor: Colors.red.shade400,
                                    ),
                                  );
                                });
                              }
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                color: Colors.indigo,
                                shape: NeumorphicShape.convex,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(10)),
                                shadowLightColor: Colors.transparent,
                                surfaceIntensity: 0.5,
                                lightSource: LightSource.bottomLeft,
                                oppositeShadowLightSource: true,
                              ),
                              child: Container(
                                height: 47,
                                width: 120,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.indigo.shade500,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/guest.jpg',
                                        height: 30,
                                        filterQuality: FilterQuality.high),
                                    const SizedBox(width: 10),
                                    const Text(
                                      "Guest",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            account,
                            style: GoogleFonts.arya(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSignUp == false) {
                                  isSignUp = true;
                                  status = "Create account";
                                  logIn = "Sign Up";
                                  account = "Already account?";
                                  signIn = " Sign In";
                                } else if (isSignUp == true) {
                                  isSignUp = false;
                                  status = "Welcome back!";
                                  logIn = "Sign In";
                                  account = "Don't have an account?";
                                  signIn = " Create new";
                                }
                              });
                            },
                            child: Text(
                              signIn,
                              style: GoogleFonts.arya(
                                fontSize: 18,
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}