import 'package:flutter/material.dart';
import 'package:flutter_exo1/pages/home_page.dart';

import 'auth_service.dart';
import 'log_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

final TextEditingController nameController = TextEditingController();
final TextEditingController firstNameController = TextEditingController();
final TextEditingController lastNameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
@override
void dispose() {
  nameController.dispose();
  firstNameController.dispose();
  lastNameController.dispose();
  emailController.dispose();
  passwordController.dispose();

  dispose();
}

class _SignUpPageState extends State<SignUpPage> {
  String result = "";
  bool loggedIn = false;
  String email = "";
  String firstname = "";
  String lastname = "";
  String name = "";
  String pw = "";
  AuthService authService = AuthService();

  void _loadToken() async {
    String? token = await authService.getToken();
    setState(() {
      result = token ?? "";
      print("result: $token");
      loggedIn = result == "" ? false : true;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  bool x = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText("Name"),
                  buildTextField(
                    'Enter your Name',
                    'name',
                    'user',
                    (value) {},
                    nameController,
                  ),
                  reusableText("first Name"),
                  buildTextField(
                    'Enter your first Name',
                    'name',
                    'user',
                    (value) {},
                    firstNameController,
                  ),
                  reusableText("last Name"),
                  buildTextField(
                    'Enter your last Name',
                    'name',
                    'user',
                    (value) {},
                    lastNameController,
                  ),
                  reusableText("Email"),
                  buildTextField(
                    'Enter your email address',
                    'email',
                    'lock',
                    (value) {},
                    emailController,
                  ),
                  reusableText("Password"),
                  buildTextField(
                    'Enter your password',
                    'password',
                    'lock',
                    (value) {},
                    passwordController,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 2),
                    child: reusableText(
                        "By signing up you agree on terms of use and conditions"),
                  ),
                  buildLogInAndRegbutton(
                    "Sign up ",
                    1,
                    () async {
                      name = nameController.text;
                      firstname = firstNameController.text;
                      lastname = lastNameController.text;
                      email = emailController.text;
                      pw = passwordController.text;
                      bool x = await authService.signupcall(name,firstname,lastname, email, pw);
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
                    "Sign in",
                    2,
                    () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogInPage(),
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
    );
  }
}
