import 'package:flutter/material.dart';
import 'package:flutter_exo1/pages/auth_service.dart';
import 'package:flutter_exo1/pages/home_page.dart';
import 'package:flutter_exo1/pages/sign_up_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

String email = "";
String pw = "";
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
AuthService authService = AuthService();
@override
void dispose() {
  emailController.dispose();
  passwordController.dispose();

  dispose();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Log In",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25.0,
          right: 25,
        ),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/logo.png",
                height: 100,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText("Email"),
                    const SizedBox(
                      height: 2,
                    ),
                    buildTextField(
                      'Enter your email address',
                      'email',
                      'user',
                      (value) {},
                      emailController,
                    ),
                    reusableText("Password"),
                    const SizedBox(
                      height: 2,
                    ),
                    buildTextField(
                      'Enter your password',
                      'password',
                      'lock',
                      (value) {},
                      passwordController,
                    ),
                    forgotPassword(),
                    buildLogInAndRegbutton(
                      "Sign in",
                      1,
                      () async {
                        email = emailController.text;
                        pw = passwordController.text;//
                        bool x = true;
                        if (x) {
                          Navigator.pushReplacement(
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const HomePage(), // Replace with your target page widget
                            ),
                          );
                        }
                      },
                    ),
                    buildLogInAndRegbutton(
                      "Sign up ",
                      2,
                      () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget reusableText(String text) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
    ),
  );
}

Widget buildTextField(
  String hintText,
  String textType,
  String iconName,
  void Function(String value)? func,
  TextEditingController textController,
) {
  return Container(
    margin: const EdgeInsets.only(
      bottom: 10,
    ),
    width: 300,
    height: 60,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: Colors.black),
    ),
    child: Row(
      children: [
        Container(
          width: 15,
          height: 15,
          margin: const EdgeInsets.only(left: 15),
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          width: 140,
          height: 50,
          child: TextField(
            controller: textController,
            onChanged: (value) => func!(value),
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
            ),
            style: const TextStyle(
              color: Colors.black,
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        ),
      ],
    ),
  );
}

Widget forgotPassword() {
  return SizedBox(
    // margin: EdgeInsets.only(left: 25.w),
    width: 260,
    height: 44,
    child: GestureDetector(
      onTap: () {},
      child: const Text(
        "Forgot Password ?",
        style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline,
          decorationColor: Colors.white,
          fontSize: 16,
        ),
      ),
    ),
  );
}

Widget buildLogInAndRegbutton(
  String buttonName,
  int buttonType,
  void Function()? func,
) {
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: EdgeInsets.only(
        top: buttonType == 1 ? 15 : 5,
        bottom: 10,
      ),
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: buttonType == 1 ? Colors.red : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: buttonType == 2
            ? Border.all(color: Colors.black.withOpacity(0.5))
            : Border.all(color: Colors.black.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            color: Colors.grey.withOpacity(0.1),
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: buttonType == 1 ? Colors.white : Colors.black,
          ),
        ),
      ),
    ),
  );
}
