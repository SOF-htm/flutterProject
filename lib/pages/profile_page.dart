import 'package:flutter/material.dart';
import 'package:flutter_exo1/pages/intro_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: null,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const IntroPage(),
            ),
          ),
          child: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50,
                child: Image.asset(
                  "assets/logo.png",
                ),
              ),
              buildListView(context),
            ],
          ),
        ),
      ),
    );
  }
}

var imageInfo = <String, String>{
  "History": "logo",
  "Courses": "logo",
  "Edit Profile": "logo",
};
var routeBtn = <String>{""};

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imageInfo.length,
        (index) => Padding(
          padding: const EdgeInsets.only(
            top: 25.0,
            left: 25.0,
            right: 25,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              margin: EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                    ),
                    child: Image.asset(
                      "assets/${imageInfo.values.elementAt(index)}.png",
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    imageInfo.keys.elementAt(index),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
